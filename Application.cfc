component {
	// change this according to your database 
    this.datasources["stackoverflow"] = {
		class: 'org.gjt.mm.mysql.Driver',
		connectionString: 'jdbc:mysql://localhost:3306/stackoverflow?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true', 
		username:'root'
	};
}