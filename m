From: Steve Snodgrass <ssnodgra@pheran.com>
Subject: Disappearing DNS packets
Date: Fri, 13 Dec 2002 12:05:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021213120503.A8206@cruncher.pheran.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm having a very strange problem and I was hoping that maybe someone has
seen this before.  Note that IP addresses have been sanitized.

I have a Red Hat 7.3 firewall using iptables 1.2.5 and kernel 2.4.18-10
separating two subnets.  The eth0 subnet contains a DNS server and the eth1
subnet contains a DNS client.  The firewall uses connection tracking and the
ruleset permits DNS queries from the client to the server.

192.168.10.20 ------ eth0-FIREWALL-eth1 ------ 192.168.3.8
DNS Server                                     DNS Client

Rule fragement from FORWARD chain:
ACCEPT   all  --  0.0.0.0/0     0.0.0.0/0        state RELATED,ESTABLISHED 
LOG      udp  --  192.168.3.8   192.168.10.20    udp dpt:53 LOG flags 0 level 4 
ACCEPT   udp  --  192.168.3.8   192.168.10.20    udp dpt:53 

The DNS client box is running squid, which happens to generate pairs of
similar DNS queries for some reason.  What is happening is that *one* of
the two queries gets dropped most of the time as it crosses the firewall.
Observe these tcpdumps:

firewall# tcpdump -i eth1 host 192.168.3.8 and port 53
tcpdump: listening on eth1
11:54:15.132008 192.168.3.8.32772 > 192.168.10.20.domain:  18+ A? www.google.com. (32) (DF)
11:54:15.132034 192.168.3.8.32772 > 192.168.10.20.domain:  19+ A? www.google.com. (32) (DF)
11:54:15.171377 192.168.10.20.domain > 192.168.3.8.32772:  18 1/4/2 A www.google.com (152) (DF)

firewall# tcpdump -i eth0 host 192.168.3.8 and port 53
tcpdump: listening on eth0
11:54:15.156014 192.168.3.8.32772 > 192.168.10.20.domain:  18+ A? www.google.com. (32) (DF)
11:54:15.171337 192.168.10.20.domain > 192.168.3.8.32772:  18 1/4/2 A www.google.com (152) (DF)

Note that the DNS query with query ID 19 has disappeared somewhere between
coming into eth1 and exiting eth0.

The logging rule I have in iptables does show both of those packets right
before they hit the ACCEPT rule:

IN=eth1 OUT=eth0 SRC=192.168.3.8 DST=192.168.10.20 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=UDP SPT=32772 DPT=53 LEN=40 
IN=eth1 OUT=eth0 SRC=192.168.3.8 DST=192.168.10.20 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=UDP SPT=32772 DPT=53 LEN=40 

I'm kind of at a loss here, does anyone have any idea what could be going on?
I'll be happy to provide any additional info that I can.  Thanks!

-- 
Steve Snodgrass * ssnodgra@pheran.com * Network and Unix Guru(?) at Large
Geek Code: GCS d? s: a C++ U++++$ P+++ L++ w PS+ 5++ b++ DI+ D++ e++ r+++ y+*
"If you want to be somebody else, change your mind."  -Sister Hazel

