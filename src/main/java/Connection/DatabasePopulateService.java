package Connection;

import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import static Connection.Reader.getStringFromSQL;

public class DatabasePopulateService {
    private static final Logger LOGGER = LoggerFactory.getLogger(Database.class);

    public static void main(String[] args) throws SQLException {
        BasicConfigurator.configure();

        try (Connection connection = Database.getInstance().getConnection()) {
            Statement st = connection.createStatement();
            String populateDB = getStringFromSQL("sql/populate_db.sql");
            try {
                st.execute(populateDB);
                LOGGER.info("Initialized successful!");
            } catch (SQLException e) {
                LOGGER.error("Table already exist", e);
            }
        }
    }
}