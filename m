From: Steve Snodgrass <ssnodgra@pheran.com>
Subject: Netfilter dropping packets with valid conntracks on RHEL4?
Date: Wed, 18 Jan 2006 19:47:15 -0500
Message-ID: <20060119004715.GA11129@shadow.pheran.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm running a firewall on RHEL4 (kernel 2.6.9-22.0.1.ELsmp) and have been
seeing some strange problems affecting the IMAP connections from my mail
client, mutt.  It seems that occasionally netfilter will decide to start
dropping packets from an IMAP session that has been established and running
fine for hours, causing mutt to hang.  Here's an example (this is the
output from the LOG target before the default deny statement at the end
of the iptables rules):

Jan 18 17:04:40 xxxx kernel: IN=eth1 OUT=eth0.21 SRC=192.168.10.9
DST=192.168.0.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=62 ID=31009 DF PROTO=TCP
SPT=143 DPT=35857 WINDOW=63712 RES=0x00 ACK URGP=0

But, this entry exists in the conntrack table:

tcp      6 431979 ESTABLISHED src=192.168.0.10 dst=192.168.10.9 sport=35857
dport=143 packets=823 bytes=666482 src=192.168.10.9 dst=192.168.0.10 sport=143
dport=35857 packets=629 bytes=257842 [ASSURED] use=1

The very first rule in iptables is:

ACCEPT     all  --  anywhere   anywhere    state RELATED,ESTABLISHED

Has anyone seen this before?  Is there anything I can do to further
debug this?  Unfortunately I do not have any way to cause this behavior
at will, it just seems to happen at random.

-- 
Steve Snodgrass * ssnodgra@pheran.com * Network and Unix Guru(?) at Large
Geek Code: GCS d? s: a C++ U++++$ P+++ L++ w PS+ 5++ b++ DI+ D++ e++ r+++ y+*
"If you want to be somebody else, change your mind."  -Sister Hazel

