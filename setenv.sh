export CATALINA_OPTS="$CATALINA_OPTS -Djava.awt.headless=true -server -Xbootclasspath/a:$JAVA_HOME/lib/tools.jar -Dgw.server.mode=dev -Dgw.bc.env=docker -Dgw.pc.env=docker -Dgw.ab.env=docker -Dgw.cc.env=docker -Xmx4g -Xms4g  "