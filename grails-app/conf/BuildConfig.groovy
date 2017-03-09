grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
    // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
    //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

    // configure settings for the test-app JVM, uses the daemon by default
    test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
    // configure settings for the run-app JVM
    run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    // configure settings for the run-war JVM
    war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
    // configure settings for the Console UI JVM
    console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()
        mavenRepo 'http://dl.bintray.com/karman/karman'
        mavenRepo("http://mvnrepository.com/artifact/")
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
        runtime 'mysql:mysql-connector-java:5.1.33'
        compile 'com.github.sommeri:less4j:1.10.0'
        // runtime 'org.postgresql:postgresql:9.3-1101-jdbc41'
        test "org.grails:grails-datastore-test-support:1.0.2-grails-2.4"
        runtime "org.springframework:spring-test:4.1.6.RELEASE"
        //Needed as dependency for rendering-plugin when used in WAR
    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.55.3" // or ":tomcat:8.0.22"

        // plugins for the compile step
        compile ":scaffolding:2.1.2"
        compile ":cache:1.1.8"
        compile ":asset-pipeline:2.9.1"
        compile(":less-asset-pipeline:2.9.1") {
            excludes "less4j"
        }

        compile ":retina-tag:2.1.1"
        compile ":karman:0.8.3"
        compile ":karman-aws:0.8.4"
        compile ":selfie:0.6.3"
        //compile ":spud-cms:0.7.1"
        //compile ":spud-core:0.7.1"
        //compile ":spud-media:0.6.6"
        //compile ":spud-blog:0.7.4"
        //compile ":spud-markdown:0.6.0"
        compile ":mail:1.0.7"
        compile ":ooh-la-log:1.0.2"
        //compile ":spring-security-core:2.0.0"
        compile ":force-ssl:1.0.4"
        compile "org.grails.plugins:seed-me:0.7.2"
        compile ":quartz:1.0.2"
        compile ":qrcode:0.7"
        compile ":twitter4j:4.0.4.3"
        compile ":cookie:1.4"
        compile "org.grails.plugins:rendering:1.0.0"
        compile "org.grails.plugins:shopping-cart:0.8.2"
        compile ":sitemaps:1.0.0"
        //compile ":spring-security-oauth:2.0.2"
        //compile ":spring-security-oauth-facebook:0.2"
        //compile ':spring-security-oauth-google:0.3.1'
        //compile ':spring-security-oauth-twitter:0.2'

        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.18"//":hibernate4:4.3.8.1" // or ":hibernate:3.6.10.18"
        runtime ":database-migration:1.4.0"
        runtime ":jquery:1.11.1"
        runtime ":console:1.5.9"
        runtime ":twitter-bootstrap:3.3.5"
        runtime ":font-awesome-resources:4.3.0.2"
        runtime ":cache-headers:1.1.7"
    }
}
