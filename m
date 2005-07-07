From: Dirk Morris <dmorris@metaloft.com>
Subject: REDIRECT in 2.6.12.2 not working
Date: Thu, 07 Jul 2005 12:56:16 -0700
Message-ID: <42CD88E0.3050209@metaloft.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I tried this on the devel list, but didnt get much response, so I'll try 
here.


I've been using REDIRECT to transparently capture TCP traffic (like 
squid), but after upgrading to 2.6.12.2 I'm running into some issues.

My understanding is (in anything from 2.4.x up to 2.6.8.1) the SYN came 
in (from alice) and was redirected to whatever port (on eve), the 
SYN/ACK was sent back from that port and it matchs conntrack which 
'fixes' the packet to look like it was coming from the original 
destination (bob).

This works great 2.4.x and the early 2.6 <2.6.8.1).
I havent tried 2.6.9 - 2.6.11 because we were having some reset problems 
under load, but now we are trying 2.6.12.2.

Here is the 2.6.8.1 output (which is expected):

setup:
[alice] <----> [eve] <----> [bob]
all tcpdump are on the alice <----> eve segment.
eve is a bridge. (maybe thats why no one else has experienced this?)

[dmorris @ eve] ~ # uname 
-a                                                                        
Linux cartman 2.6.8.1 #1 SMP Fri Apr 29 18:35:22 PDT 2005 i686 GNU/Linux

[dmorris @ alice] ~ # s tcpdump "not port 22 or 
icmp"                                        tcpdump: verbose output 
suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
06:27:28.053491 arp who-has bob tell alice
06:27:28.053635 arp reply bob is-at 00:13:20:3d:a7:74
06:27:28.053640 IP alice.33026 > bob.echo: S 1284341781:1284341781(0) 
win 5840 <mss 1460,sackOK,timestamp 153932448 0,nop,wscale 7>
06:27:28.070878 arp who-has bob tell eve
06:27:28.071684 IP bob.echo > alice.33026: S 1135117817:1135117817(0) 
ack 1284341782 win 5792 <mss 1460,sackOK,timestamp 274943 153932448>
06:27:28.071700 IP alice.33026 > bob.echo: . ack 1 win 5840 
<nop,nop,timestamp 153932467 274943>

[dmorris @ eve] ~ # s cat /proc/net/ip_conntrack | grep "port=7"  
tcp      6 431996 ESTABLISHED src=192.168.2.1 dst=192.168.2.3 
sport=33030 dport=7 src=192.168.2.2 dst=192.168.2.1 sport=9500 
dport=33030 [ASSURED] use=1


Now in 2.6.12.2 the SYN/ACK doesnt seem to get "fixed, " and so all 
connections are immediately reset:

[dmorris @ eve] ~ # uname 
-a                                                                         
Linux cartman 2.6.12.2 #1 SMP Sun Jul 3 17:21:45 PDT 2005 i686 GNU/Linux

[dmorris @ alice] ~ # s tcpdump "not port 22 or 
icmp"                            tcpdump: verbose output suppressed, use 
-v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
06:16:00.981041 arp who-has bob tell alice
06:16:00.981117 arp reply bob is-at 00:13:20:3d:a7:74
06:16:00.981122 IP alice.33022 > bob.echo: S 574776601:574776601(0) win 
5840 <mss 1460,sackOK,timestamp 153245271 0,nop,wscale 7>
06:16:00.983896 arp who-has bob tell eve
06:16:00.984228 IP eve.9500 > alice.33022: S 551400716:551400716(0) ack 
574776602 win 5792 <mss 1460,sackOK,timestamp 1983246 153245271>
06:16:00.984249 IP alice.33022 > eve.9500: R 574776602:574776602(0) win 0

~ # s cat /proc/net/ip_conntrack | grep 
"port=7"                                          [dmorris @ cartman]
tcp      6 58 SYN_RECV src=192.168.2.1 dst=192.168.2.3 sport=33028 
dport=7 packets=1 bytes=60 src=192.168.2.2 dst=192.168.2.1 sport=9500 
dport=33028 packets=1 bytes=56 use=1

notice how the syn/ack comes from eve instead of bob, and it only 
matches 1 packet (the SYN I assume)
I suspect the syn/ack isnt matching in the conntrack table for some reason?

I tried again with a simple iptables rule redirecting to netcat 
listening on port 1234 with a vanilla kernel, and it
also happens so should be easy to reproduce:
eve: iptables -t nat -A PREROUTING -p tcp --destination-port 1234 -j 
REDIRECT --to-port 1234
eve: netcat -l -p 1234
alice: telnet bob 1234 (doesnt connect, tcpdump shows packet from eve 
coming back)


Any ideas?

Thanks,
-Dirk






more info:

[dmorris @ eve] ~ # s iptables -t nat 
-nL                                                                 
[dmorris @ cartman]
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        REDIRECT   
tcp  --  0.0.0.0/0            0.0.0.0/0           MARK match 
!0x1000000/0x1000000 redir ports 9500-9627

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination       
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

~ # s cat /proc/net/ip_conntrack | grep 
"port=7"                                          [dmorris @ cartman]
tcp      6 58 SYN_RECV src=192.168.2.1 dst=192.168.2.3 sport=33028 
dport=7 packets=1 bytes=60 src=192.168.2.2 dst=192.168.2.1 sport=9500 
dport=33028 packets=1 bytes=56 mark=0 use=1




