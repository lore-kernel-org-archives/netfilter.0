From: James Arnott <jmarnott@comcast.net>
Subject: Newbie Help
Date: Wed, 30 Aug 2006 10:07:27 -0500
Message-ID: <1156950447.11692.9.camel@jarnott-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am sorry if this seems like a basic question, I am trying to install
conntrackd in order to help support an Active Active cluster
configuration. 

I have installed
conntrack-1.00beta2 - No problems
libnfnetlink-0.0.16 - no problems
libnetfilter_conntrack-0.0.31 - no problems.

when I can configure conntrackd-0.8.2 
but when I run make it fails

Making all in src
make[1]: Entering directory
`/home/jarnott/Downloads/conntrackd-0.8.2/src'
/bin/sh ../libtool --mode=link gcc  -g -O2   -o conntrackd  -lnfnetlink
-lnetfilter_conntrack alarm.o main.o run.o events.o hash.o local.o log.o
mcast.o cache.o netlink.o internal_cache.o external_cache.o stats.o
sync-mode.o stats-mode.o read_config_yy.o read_config_lex.o
-lnetfilter_conntrack -lnfnetlink
gcc -g -O2 -o conntrackd alarm.o main.o run.o events.o hash.o local.o
log.o mcast.o cache.o netlink.o internal_cache.o external_cache.o
stats.o sync-mode.o stats-mode.o read_config_yy.o read_config_lex.o
-lnetfilter_conntrack -lnfnetlink
events.o: In function
`resync_with_master':/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:198: undefined reference to `nfnl_send_receive_process'
events.o: In function
`flush_master_table':/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:212: undefined reference to `nfnl_send_receive_process'
events.o: In function
`ignore':/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:50:
undefined reference to `nfct_conntrack_is_dnatted'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:56: undefined
reference to `nfct_conntrack_is_snatted'
events.o: In function
`resync_process':/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:158: undefined reference to `nfct_parse_netlink_message'
events.o: In function
`event_process':/home/jarnott/Downloads/conntrackd-0.8.2/src/events.c:93: undefined reference to `nfct_parse_netlink_message'
netlink.o: In function
`build_network_netlink_message':/home/jarnott/Downloads/conntrackd-0.8.2/src/netlink.c:71: undefined reference to `nfct_build_protoinfo'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/netlink.c:73: undefined
reference to `nfct_build_nat'
netlink.o: In function
`parse_network_netlink_message':/home/jarnott/Downloads/conntrackd-0.8.2/src/netlink.c:91: undefined reference to `nfct_parse_netlink_message'
internal_cache.o: In function
`compare_internal':/home/jarnott/Downloads/conntrackd-0.8.2/src/internal_cache.c:51: undefined reference to `nfct_tuple_equal'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/internal_cache.c:51:
undefined reference to `nfct_tuple_equal'
external_cache.o: In function
`compare_external':/home/jarnott/Downloads/conntrackd-0.8.2/src/external_cache.c:45: undefined reference to `nfct_tuple_equal'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/external_cache.c:45:
undefined reference to `nfct_tuple_equal'
external_cache.o: In function
`iterate_commit':/home/jarnott/Downloads/conntrackd-0.8.2/src/external_cache.c:143: undefined reference to `nfct_conntrack_strip_nat'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/external_cache.c:144:
undefined reference to `nfct_build_netlink_message'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/external_cache.c:151:
undefined reference to `nfnl_send_receive_process'
sync-mode.o: In function
`step_sync':/home/jarnott/Downloads/conntrackd-0.8.2/src/sync-mode.c:303: undefined reference to `nfnl_receive_process'
stats-mode.o: In function
`step_stats':/home/jarnott/Downloads/conntrackd-0.8.2/src/stats-mode.c:168: undefined reference to `nfnl_receive_process'
read_config_yy.o: In function
`yyerror':/home/jarnott/Downloads/conntrackd-0.8.2/src/read_config_yy.y:269: undefined reference to `yytext'
:/home/jarnott/Downloads/conntrackd-0.8.2/src/read_config_yy.y:269:
undefined reference to `yylineno'
read_config_yy.o: In function
`yyparse':/home/jarnott/Downloads/conntrackd-0.8.2/src/read_config_yy.c:1208: undefined reference to `yylex'
read_config_yy.o: In function
`init_config':/home/jarnott/Downloads/conntrackd-0.8.2/src/read_config_yy.y:283: undefined reference to `yyrestart'
collect2: ld returned 1 exit status
make[1]: *** [conntrackd] Error 1
make[1]: Leaving directory
`/home/jarnott/Downloads/conntrackd-0.8.2/src'
make: *** [all-recursive] Error 1

I think I have all the dependencies installed, but it seems like
something is missing.

also a question about the patches for conntrackd, how are these applied.
I have looked into patch-o-matic but dont see the patches I want to
apply listed.

thank you very much for any help. 
James Arnott



