package bit.minisys.minicc.parser;

import bit.minisys.minicc.MiniCCCfg;
import bit.minisys.minicc.internal.util.MiniCCUtil;
import bit.minisys.minicc.parser.ast.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.antlr.v4.gui.TreeViewer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;


public class Parser implements IMiniCCParser {
	/**
	 * 属性字节流结构体
	 */
	private class ScannerToken {
		public String lexme;
		public String type;        //类型
		public int line;        //行号
		public int column;        //列号
	}

	private ArrayList<ScannerToken> tokenList;
	private int tokenIndex;
	private ScannerToken nextToken;

	static List<String> TYPE = Arrays.asList(new String[]{"'int'", "'float'", "'char'","'void'"});

	static List<String> PLUS_SUB = Arrays.asList(new String[]{"'+'", "'-'"});
	static List<String> MUT_DIV = Arrays.asList(new String[]{"'*'", "'/'","'%'"});

	static List<String> ASSIGN_OP = Arrays.asList(new String[]{"'='", "'*='", "'/='", "'%='", "'+='", "'-='", "'<<='", "'>>='", "'&='", "'^='", "'|='"});
	static List<String> UNARY_OP = Arrays.asList(new String[]{"'++'", "'--'"});
	static List<String> POST_OP = Arrays.asList(new String[]{"'++'", "'--'"});
	static List<String> SHIFT_OP = Arrays.asList(new String[]{"'<<'", "'>>'"});
	static List<String> RELATIONAL_OP = Arrays.asList(new String[]{"'<'", "'>'","'<='","'>='"});
	static List<String> EQUALITY_OP = Arrays.asList(new String[]{"'=='", "'!='"});
	static List<String> AND_OP = Arrays.asList(new String[]{"'&'"});
	static List<String> EXC_OR_OP = Arrays.asList(new String[]{"'^'"});
	static List<String> INC_OR_OP = Arrays.asList(new String[]{"'|'"});
	static List<String> LOG_AND_OP = Arrays.asList(new String[]{"'&&'"});
	static List<String> LOG_OR_OP = Arrays.asList(new String[]{"'||'"});
	static List<String> CONDITIONAl_OP = Arrays.asList(new String[]{"'|'"});


	static List<String> SELECT_WORD = Arrays.asList(new String[]{"'if'", "'switch'"});
	static List<String>  ITERATION_WORD = Arrays.asList(new String[]{"'for'", "'while'","'do'"});
	static List<String> JUMP_WORD = Arrays.asList(new String[]{"'goto'","'continue'","'break'","'return'"});
	@Override
	public String run(String iFile) throws Exception {
		System.out.println("Parsing...   WXZ");

		String oFile = MiniCCUtil.removeAllExt(iFile) + MiniCCCfg.MINICC_PARSER_OUTPUT_EXT;
		String tFile = MiniCCUtil.removeAllExt(iFile) + MiniCCCfg.MINICC_SCANNER_OUTPUT_EXT;

		load_Tokens(tFile);    //加载属性字节流
		tokenIndex = -1;


		// 完成对语法树的生成
		ASTCompilationUnit root = compilation_Unit();

//		//绘制语法树
		String[] dummyStrs = new String[16];
		TreeViewer viewr = new TreeViewer(Arrays.asList(dummyStrs), root);
		viewr.open();

		//保存
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(new File(oFile), root);

		return oFile;
	}

	public static ArrayList<String> readTokens(String src) {
		ArrayList tokenString = new ArrayList();

		File file = new File(src);
		if (!file.exists()) {
			System.out.println("file " + src + "dose not exist.");
			return null;
		} else {
			try {
				BufferedReader freader = new BufferedReader(new FileReader(file));
				String line;
				while((line = freader.readLine())!=null) {
					tokenString.add(line);
				}
				freader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return tokenString;
	}

	/**
	 * 加载属性字节流
	 *
	 * @param tFile 属性字节流路径
	 */
	private void load_Tokens(String tFile) {
		tokenList = new ArrayList<ScannerToken>();
		ArrayList<String> tokenString = readTokens(tFile);    //Load token string
		ScannerToken token = null;
		for (String str : tokenString) {
			if (str.trim().length() <= 0) {    //空行
				continue;
			}
			token = new ScannerToken();
			String[] segs;
			if (str.indexOf("<','>") > 0) {
				str = str.replace("','", "'DOT'");

				segs = str.split(",");
				segs[1] = "=','";
				segs[2] = "<','>";

			} else {
				segs = str.split(",");
			}
			//值 去除两端可能的''
			token.lexme = segs[1].substring(segs[1].indexOf("=") + 1);
			int len = token.lexme.length();
			token.lexme = token.lexme.substring(1,len-1);
			//类型
			token.type = segs[2].substring(segs[2].indexOf("<") + 1, segs[2].length() - 1);
			String[] lc = segs[3].split(":");
			//行号
			token.line = Integer.parseInt(lc[0]);
			//列号
			token.column = Integer.parseInt(lc[1].replace("]", ""));
			tokenList.add(token);
		}
	}

	//下一个Token
	private ScannerToken next() {
		if (tokenIndex < tokenList.size()) {
			tokenIndex++;
			nextToken = tokenList.get(tokenIndex);
			return nextToken;
		} else {
			return null;
		}
	}

	//匹配
	private boolean match(String type) {
		if (nextToken.type.equals(type)) {
			next();        //下一个Token
			return true;
		} else {
			System.out.println("[ERROR] Parser.java: unmatched token, expected = \"" + type + "\", input = \"" + nextToken.type + "\"");
			return false;
		}
	}


	// 类型    TYPE -> 'int' | 'float' | 'char'
	private ASTToken TYPE() {
		ASTToken t = new ASTToken();
		if (TYPE.contains(nextToken.type)) {    //包含这个元素
			t.tokenId = tokenIndex;
			t.value = nextToken.lexme;
			//添加孩子
			t.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();		//获取下一个
		}
		else{
			System.out.println("[ERROR] Parser.java: unknown type");
		}
		return t;
	}
	//标识符    IDENTIFIER -> identifier
	private ASTIdentifier IDENTIFIER() {
		ASTIdentifier res = new ASTIdentifier();
		res.value = nextToken.lexme;
		res.tokenId = tokenIndex;
		//添加孩子
		res.children.add(new ASTToken(nextToken.lexme,tokenIndex));
		match("Identifier");

		return res;
	}



	//编译单元 根节点
	private ASTCompilationUnit compilation_Unit(){
		next();		//第一个属性字节流
		ASTCompilationUnit p = new ASTCompilationUnit();	//编译单元
		ArrayList<ASTNode> exDeclar = external_Declaration();	//外部定义
		if(exDeclar!=null){
			p.items.addAll(exDeclar);	//添加items
		}
		p.children.addAll(p.items);	//添加到子节点
		return p;
	}

	//外部定义，仅实现函数定义
	//external_Declaration -> function external_Declaration | e
	private ArrayList<ASTNode>external_Declaration(){
		ArrayList<ASTNode> funlist = new ArrayList<ASTNode>();

		while(!nextToken.type.equals("EOF")){
			ASTNode f = function();		//匹配函数v
			funlist.add(f);			//添加到子节点
		}

		if(funlist.isEmpty()){
			return null;
		}
		else{
			return funlist;
		}
	}

	//函数    TYPE ID '(' arguments ')' code_block
	private ASTFunctionDefine function() {
		//函数定义
		ASTFunctionDefine fdef = new ASTFunctionDefine();

		//返回值类型
		ASTToken type = TYPE();
		fdef.specifiers.add(type);	//函数类型
		fdef.children.add(type);    //添加到子节点


		//函数声明
		fdef.declarator = function_declarator();	//函数声明
		fdef.children.add(fdef.declarator);

		//函数体
		fdef.body = code_block();
		fdef.children.add(fdef.body);

		return fdef;
	}

	//函数声明    function_declarator -> variable_declarator '(' arguments ')'
	private ASTFunctionDeclarator function_declarator() {
		ASTFunctionDeclarator res = new ASTFunctionDeclarator();

		//函数名
		res.declarator = variable_declarator();
		res.children.add(res.declarator);

		//参数列表
		match("'('");
		res.params = arguments();
		res.children.addAll(res.params);
		match("')'");

		return res;
	}
	//变量声明    variable_declarator  -> IDENTIFIER
	private ASTVariableDeclarator variable_declarator() {
		ASTVariableDeclarator res = new ASTVariableDeclarator();
		res.identifier = IDENTIFIER();
		res.children.add(res.identifier);
		return res;
	}

	//声明符号
	private ASTDeclarator declarator() {
		ASTIdentifier id= IDENTIFIER();
		//数组
		if(nextToken.type.equals("'['")) {
			ASTArrayDeclarator res = new ASTArrayDeclarator();
			//标识符
			ASTVariableDeclarator dec = new ASTVariableDeclarator(id);
			dec.children.add(dec.identifier);
			res.declarator = dec;
			res.children.add(res.declarator);

			match("'['");

			//条件判定
			ASTExpression expr = expression();
			res.expr = expr;
			res.children.add(res.expr);

			match("']'");

			return res;
		}
		//常数
		else {
			ASTVariableDeclarator res = new ASTVariableDeclarator();
			res.identifier = id;
			res.children.add(res.identifier);
			return res;
		}
	}

	//程序块    code_block -> '{' compound_statement '}'
	private ASTCompoundStatement code_block() {
		match("'{'");
		ASTCompoundStatement cs = compound_statement();
		match("'}'");
		return cs;
	}

	//复合陈述    compound_statements -> statement compound_statements | e
	private ASTCompoundStatement compound_statement() {
		ASTCompoundStatement res = new ASTCompoundStatement();
		res.blockItems = new ArrayList<ASTNode>();
		while(!nextToken.type.equals("'}'")){
			ASTNode line = null;

			line = line();

			if(line!=null){
				res.blockItems.add(line);	//添加一句陈述
				res.children.add(line);
			}
		}
		return res;
	}

	private ASTNode line() {
		//变量声明
		if(TYPE.contains(nextToken.type)){
			return declaration();

		}
		//陈述
		else{
			return statement();
		}
	}


	//单句陈述
	//statement -> declarator_statement | selection_statement
	// 				| iteration_statement | return_statement
	// 				| fun_call
	private ASTStatement statement() {
		//跳转语句
		if (JUMP_WORD.contains(nextToken.type)) {
			ASTStatement res = jump_statement();
			res.children.add(new ASTToken(nextToken.lexme, tokenIndex));
			match("';'");
			return res;
		}
		//选择语句陈述
		else if (SELECT_WORD.contains(nextToken.type)) {
			return selection_statement();
		}
		//循环语句
		else if(ITERATION_WORD.contains(nextToken.type)){
			return iteration_statement();
		}
		//其它 一般语句
		else {    //表达式
			ASTStatement res = expression_statement();
			res.children.add(new ASTToken(nextToken.lexme, tokenIndex));
			match("';'");
			return res;
		}
	}

	//循环语句
	private ASTStatement iteration_statement() {
		if(nextToken.type.equals("'for'")){
			match("'for'");
			match("'('");
			//带声明的循环
			if(TYPE.contains(nextToken.type)){
				ASTIterationDeclaredStatement res = new ASTIterationDeclaredStatement ();
				res.cond = new LinkedList<ASTExpression>();
				res.step = new LinkedList<ASTExpression>();

				//初始化
				res.init = declaration();
				res.children.add(res.init);

//				match("';'");

				//条件判定
				ASTExpression expr = expression();
				if(expr!=null){
					res.cond.add(expr);
					res.children.addAll(res.cond);
				}


				match("';'");

				//执行操作
				expr = expression();
				if(expr!=null){
					res.step.add(expr);
					res.children.addAll(res.step);
				}


				match("')'");

				//执行体
				res.stat = _code_block();
				res.children.add(res.stat);

				return res;
			}
			//不带声明循环体
			else{
				ASTIterationStatement res = new ASTIterationStatement();
				res.init = new LinkedList<ASTExpression>();
				res.cond = new LinkedList<ASTExpression>();
				res.step = new LinkedList<ASTExpression>();

				//初始化
				res.init.addAll(expression_statement().exprs);
				res.children.addAll(res.init);

				match("';'");

				//条件判定
				ASTExpression expr = expression();
				if(expr!=null){
					res.cond.add(expr);
					res.children.addAll(res.cond);
				}

				match("';'");

				//执行操作
				expr = expression();
				if(expr!=null){
					res.step.add(expr);
					res.children.addAll(res.step);
				}

				match("')'");

				//执行体
				res.stat = _code_block();
				res.children.add(res.stat);

				return res;
			}
		}
//		else if(nextToken.type.equals("'while'")){
//			ASTIterationStatement res = new ASTIterationStatement();
//				res.init = null;
//
//		}
		return null;
	}

	//选择语句
	private ASTStatement selection_statement() {
		ASTSelectionStatement res = new ASTSelectionStatement();
		res.cond = new LinkedList<ASTExpression>();
		match("'if'");
		match("'('");

		//条件
		res.cond.add(expression());
		res.children.addAll(res.cond);

		match("')'");

		//if语句
		res.then = _code_block();
		res.children.add(res.then);

		//是否有else
		if (nextToken.type.equals("'else'")) {
			match("'else'");
			res.otherwise = _code_block();
			res.children.add((res.otherwise));

		}
		return res;
	}

	//一段代码
	private ASTStatement _code_block() {
		if(nextToken.type.equals("'{'")){
			return code_block();
		}
		else{
			return statement();
		}
	}

	//声明陈述
	private ASTDeclaration declaration() {
		ASTDeclaration res = new ASTDeclaration();
		res.specifiers = new ArrayList<ASTToken>();
		res.initLists = new ArrayList<ASTInitList>();

		//参数类型
		ASTToken t = TYPE();
		res.specifiers.add(t);
		res.children.add(t);
		//初始化列表
		res.initLists.addAll(init_lists());
		res.children.addAll(res.initLists);
		res.children.add(new ASTToken(nextToken.lexme, tokenIndex));
		match("';'");

		return res;
	}

	//参数初始化列表
	private List<ASTInitList> init_lists(){
		ArrayList<ASTInitList> res = new ArrayList<ASTInitList>();
		while(!nextToken.type.equals("';'")){	//没遇到；
			ASTInitList init = init_list();
			res.add(init);
			if(nextToken.type.equals("','")){
				match("','");
			}
		}

		return res;
	}

	//一项初始化
	private ASTInitList init_list() {
		ASTInitList res = new ASTInitList();
		res.exprs = new ArrayList<ASTExpression>();

		res.declarator = declarator();
		res.children.add(res.declarator);

		if(nextToken.type.equals("'='")){
			match("'='");

			//变量定义
			if(res.declarator.getType().equals("VariableDeclarator")){
				res.exprs.add(expression());
				res.children.addAll(res.exprs);
			}
			else if(res.declarator.getType().equals("ArrayDeclarator")){
				match("'{'");
				while(!nextToken.type.equals("'}'")){
					res.exprs.add(expression());
					if(nextToken.type.equals("','")){
						match("','");
					}
				}
				res.children.addAll(res.exprs);
				match("'}'");
			}
		}

		return res;
	}



	//返回陈述
	private ASTStatement jump_statement() {
		if (nextToken.type.equals("'return'")) {
			ASTReturnStatement res = new ASTReturnStatement();
			match("'return'");
			ASTExpression t = expression();
			if(t!=null){
				res.expr.add(t);
				res.children.addAll(res.expr);
			}
			else{
				res.expr = null;
			}
			return res;
		} else if (nextToken.type.equals("'goto'")) {
			ASTGotoStatement res = new ASTGotoStatement();
			match("'goto'");
			res.label = IDENTIFIER();
			res.children.add(res.label);
			return res;
		} else if (nextToken.type.equals("'break'")) {
			ASTBreakStatement res = new ASTBreakStatement();
			match("'break'");
			return res;
		} else if (nextToken.type.equals("'continue'")) {
			ASTContinueStatement res = new ASTContinueStatement();
			match("'continue'");
			return res;
		} else {
			System.out.println("[ERROR] jump_statement: should not be here");
			return null;
		}
	}

	//表达式陈述    expression_statement -> expr ',' expression_statement | expr ';'
	private ASTExpressionStatement expression_statement() {
		//返回值
		ASTExpressionStatement es = new ASTExpressionStatement();
		es.exprs = new ArrayList<ASTExpression>();
		do{
			//跳过','
			if(nextToken.type.equals("','")){
				es.children.add(new ASTToken(nextToken.lexme,tokenIndex));
				next();
			}
			//匹配表达式
			ASTExpression e = expression();
			if(e!=null){
				es.exprs.add(e);		//表达式
				es.children.add(e);		//儿子
			}
		}while(nextToken.type.equals("','"));

		return es;
	}


	private ASTExpression expression(){
		return assignment_expression();
	}

	//赋值表达式
	//assignment_expression -> unary_expression ASSIGN_OP assignment_expression | binary_expression
	private ASTExpression assignment_expression() {
		//尝试匹配前缀表达式
		int curtoken = tokenIndex;
		/**
		 * 这里设计了两个方法：
		 *     1. _unary_expression()
		 *     2. unary_expression()
		 *
		 * 1.方法要求解析到的表达式是纯前缀表达式，以满足C语法赋值表达式expr1必须为可修改左值的要求
		 * 2.方法则使用后缀表达式作为进一步分析的前进。
		 *
		 * 但考虑到实际情况下，确定expr1类型为可修改左值的任务应由语义分析完成，因此考虑在此处直接匹
		 * 配一个前缀表达式。
		 *
		 * 进一步可以考虑使用 additive_expression() 加联结表达式进行替代，以消去回溯。
		 */
//		ASTExpression expr = _unary_expression();
//		ASTExpression expr = unary_expression();
		ASTExpression expr = logical_OR_expression();

		//匹配 赋值表达式 成功
		if(ASSIGN_OP.contains(nextToken.type)) {
			ASTBinaryExpression res = new ASTBinaryExpression();
			//前表达式
			res.expr1 = expr;
			//匹配赋值符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//后表达式
			res.expr2 = assignment_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		//匹配 赋值表达式 失败   回溯  匹配二元表达式
		else{
			return expr;
		}
	}

	//二元表达式    logical_OR_exoression
	private ASTExpression  logical_OR_expression() {
		//匹配因子
		ASTExpression expr = logical_AND_expression();
		//匹配运算符
		if(LOG_OR_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = logical_OR_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    logical_AND_exoression
	private ASTExpression  logical_AND_expression() {
		//匹配因子
		ASTExpression expr = inclusive_OR_expression();
		//匹配运算符
		if(LOG_AND_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = logical_AND_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    inclusive_OR_exoression
	private ASTExpression  inclusive_OR_expression() {
		//匹配因子
		ASTExpression expr = exclusive_OR_expression();
		//匹配运算符
		if(INC_OR_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = inclusive_OR_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    exclusive_OR_exoression
	private ASTExpression  exclusive_OR_expression() {
		//匹配因子
		ASTExpression expr = AND_expression();
		//匹配运算符
		if(EXC_OR_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = exclusive_OR_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    AND_exoression
	private ASTExpression  AND_expression() {
		//匹配因子
		ASTExpression expr = equality_expression();
		//匹配运算符
		if(AND_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = AND_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    equality_exoression
	private ASTExpression  equality_expression() {
		//匹配因子
		ASTExpression expr = relational_expression();
		//匹配运算符
		if(EQUALITY_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = equality_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    relational_exoression
	private ASTExpression  relational_expression() {
		//匹配因子
		ASTExpression expr = shift_expression();
		//匹配运算符
		if(RELATIONAL_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = relational_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    shift_expression
	private ASTExpression  shift_expression() {
		//匹配因子
		ASTExpression expr = additive_expression();
		//匹配运算符
		if(SHIFT_OP.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = shift_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    additive_expression
	private ASTExpression  additive_expression() {
		//匹配因子
		ASTExpression expr = multiplicative_expression();
		//匹配运算符
		if(PLUS_SUB.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = additive_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//二元表达式    multiplicative_expression
	private ASTExpression multiplicative_expression(){
		//匹配因子
		ASTExpression expr = unary_expression();
		//匹配运算符
		if(MUT_DIV.contains(nextToken.type)){
			ASTBinaryExpression res = new ASTBinaryExpression();
			//第一个表达式
			res.expr1 = expr;
			//运算符
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			//第二个表达式
			res.expr2 = multiplicative_expression();

			//添加孩子
			res.children.add(res.expr1);
			res.children.add(res.op);
			res.children.add(res.expr2);

			return res;
		}
		else{
			return expr;
		}
	}

	//前缀表达式
	//unary_expression ->
	private ASTExpression unary_expression(){
		//前缀运算符
		if(UNARY_OP.contains(nextToken.type)){	//前缀符号
			ASTUnaryExpression res = new ASTUnaryExpression();
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();
			res.expr = unary_expression();

			//添加孩子
			res.children.add(res.op);
			res.children.add(res.expr);

			return res;
		}
		//后缀表达式
		else{
			ASTExpression res = postfix_expression();
			return res;
		}
	}

	//后缀表达式
	//postfix_expression -> primary_expression
	private ASTExpression postfix_expression() {
		ASTExpression expr = primary_expression();
		if (POST_OP.contains(nextToken.type)) {    // '++' '--'
			ASTPostfixExpression res = new ASTPostfixExpression();
			res.expr = expr;
			res.op = new ASTToken(nextToken.lexme,tokenIndex);
			next();

			//添加孩子
			res.children.add(res.expr);
			res.children.add(res.op);

			return res;
		}
		else if (nextToken.type.equals("'['")) {
			ASTArrayAccess res = new ASTArrayAccess();
			res.elements = new ArrayList<ASTExpression>();

			match("'['");
			//数组名
			res.arrayName = expr;
			res.children.add((res.arrayName));

			//数组操作
			ASTExpressionStatement t = expression_statement();
			res.elements.addAll(t.exprs);
			res.children.addAll(res.elements);

			match("']'");

			return res;
		}
		else{	//非后缀表达式，返回下一级生成的表达式
			return expr;
		}
	}

	//初级表达式    primary_expression -> CONST | ID | '(' assign_expression ')'
	private ASTExpression primary_expression() {
		ASTExpression res = null;
		if(nextToken.type.equals("IntegerConstant")){
			res = new ASTIntegerConstant(Integer.valueOf(nextToken.lexme),tokenIndex);
			res.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();
		}
		else if(nextToken.type.equals("FloatingConstant")){
			res = new ASTFloatConstant(Double.valueOf(nextToken.lexme),tokenIndex);
			res.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();
		}
		else if(nextToken.type.equals("CharacterConstant")){
			res = new ASTCharConstant(nextToken.lexme,tokenIndex);
			res.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();
		}
		else if(nextToken.type.equals("StringLiteral")){
			res = new ASTStringConstant(nextToken.lexme,tokenIndex);
			res.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();
		}
		else if(nextToken.type.equals("'('")){
			match("'('");
			res = expression();
			match("')'");
		}
		else if(nextToken.type.equals("Identifier")){
			ASTIdentifier id = new ASTIdentifier(nextToken.lexme,tokenIndex);
			id.children.add(new ASTToken(nextToken.lexme,tokenIndex));
			next();
			//判断是否是 FUN_CALL
			if(nextToken.type.equals("'('")){
				match("'('");
				ASTFunctionCall fcall = new ASTFunctionCall();
				fcall.funcname = id;
				fcall.argList = expression_statement().exprs;
				match("')'");

				//添加孩子
				fcall.children.add(fcall.funcname);
				fcall.children.addAll(fcall.argList);

				return fcall;
			}
			else{
				res = id;
			}
		}
		else{
//			System.out.println("[ERROR] Parser.java: unknown error. Location:primary_expression()");
		}
		return res;
	}



	//函数参数声明
	//arguments -> arg_list | e
	private ArrayList<ASTParamsDeclarator> arguments() {
		if(nextToken.type.equals("')'") || nextToken.type.equals("';'")){
			return new ArrayList<ASTParamsDeclarator>();
		}else{
			ArrayList<ASTParamsDeclarator> al = arglist();
			return al;
		}
	}

	//参数列表    arglist -> argument ',' arglist | argument
	private ArrayList<ASTParamsDeclarator> arglist() {
		ArrayList<ASTParamsDeclarator> pdl = new ArrayList<ASTParamsDeclarator>();
		//匹配参数列表
		while(!nextToken.type.equals("')'")){
			ASTParamsDeclarator pd = argument();
			pdl.add(pd);
			if(nextToken.type.equals("','")){
				next();
			}
		}

		if(pdl.isEmpty()){
			return null;
		}
		else{
			return pdl;
		}
	}

	//参数声明
	// argument -> TYPE ID
	private ASTParamsDeclarator argument() {
		ASTParamsDeclarator pd = new ASTParamsDeclarator();

		//标识符
		pd.specfiers.add(TYPE());
		pd.children.addAll(pd.specfiers);

		//声明
		pd.declarator = declarator();
		pd.children.add(pd.declarator);

		return pd;
	}
}
