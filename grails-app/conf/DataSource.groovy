hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    // cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            url = "jdbc:mysql://localhost/mybounds_development"
            driverClassName = "com.mysql.jdbc.Driver"
            username = 'root'
            dbCreate = "update"
            logSql = false
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
                validationQuery = 'select 1'
                testOnBorrow = true
                testOnReturn = false
                testWhileIdle = true
                timeBetweenEvictionRunsMillis = 300000
                numTestsPerEvictionRun = 3
                minEvictableIdleTimeMillis = 600000
                initialSize = 1
                minIdle = 1
                maxActive = 20
                maxIdle = 3
                maxWait = 90000
                removeAbandoned = true
                removeAbandonedTimeout = 6000
                logAbandoned = true
            }
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }

    production {
        dataSource {login
            pooled = true
            url = "jdbc:mysql://my-db-instance.ckgtuyr5htue.us-west-2.rds.amazonaws.com:3306/mybounds"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "trafferty"
            password = "letmeinN0w!"
            dbCreate = "update"
            logSql = false
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect

            properties {
                validationQuery = 'select 1'
                testOnBorrow = true
                testOnReturn = false
                testWhileIdle = true
                timeBetweenEvictionRunsMillis = 300000
                numTestsPerEvictionRun = 3
                minEvictableIdleTimeMillis = 600000
                initialSize = 1
                minIdle = 1
                maxActive = 20
                maxIdle = 3
                maxWait = 90000
                removeAbandoned = true
                removeAbandonedTimeout = 6000
                logAbandoned = true
            }
        }
    }
}

