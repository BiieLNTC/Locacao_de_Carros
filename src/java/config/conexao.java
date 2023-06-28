package config;
import java.sql.*;
import com.mysql.jdbc.Driver;

/**
 *
 * @author Pablo
 */
public class conexao {
    public Connection conectar() throws SQLException {
try {
Class.forName("com.mysql.cj.jdbc.Driver");   /* cj é para indicar o time zone */
return DriverManager.getConnection("jdbc:mysql://localhost/locacao_carros?useTimezone=true&serverTimezone=UTC&user=root&password=root");

}catch (ClassNotFoundException e){
throw new RuntimeException(e);
        }
}
}
