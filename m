From: Martijn Klingens <mklingens@ism.nl>
Subject: State NEW, no SYN, and different
Date: Mon, 7 Oct 2002 14:38:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210071438.42309.mklingens@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

It's been mentioned before some times, a stateful firewall dropping 
connections that are apparently NEW and do not contain a SYN bit.

In all of those cases (AFAIK) that had to do with FIN ACKs, and other exotic 
combinations of TCP flags that can be safely dropped without logging.

However, after adding all those tricks to our firewall a while ago the 
problems didn't really disappear, they only became a bit less. I can't see 
any other correspondence to other firewall traffic either, so I'm a bit at a 
loss at what may cause the problems.

Our firewall doesn't do NAT, it firewalls a true class C subnet using 
connection tracking. The NEW, no SYN packets appear with both Win2k and Linux 
servers, and for at least SMTP and HTTP, but seem to be independent of the 
used protocol. The only thing that seems to be consistent is that the amount 
of dropped 'new, not syns' is remarkably proportional to the amount of daily 
traffic a given IP address has. The most popular web sites have the most 
'new, not syns'.

The connection tracking code of the firewall script basically does the 
following (parts of the output from the script in debug mode):

----
* Setting up connection tracking for already-active traffic
iptables -A INPUT   -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT   -m state --state RELATED     -j ACCEPT
iptables -A FORWARD -m state --state RELATED     -j ACCEPT
modprobe ip_conntrack_ftp

( --- snipped other code --- )

* Setting up connection tracking for ACL wan
iptables -A acl_wan -p tcp --tcp-flags RST RST -j log_wan
iptables -A log_wan -p tcp --tcp-flags RST RST -j LOG --log-level debug \
    --log-prefix '* DROP: Unexpected RST * '
iptables -A log_wan -p tcp --tcp-flags RST RST -j DROP
iptables -A acl_wan -m state --state NEW -p tcp --tcp-flags FIN,ACK FIN,ACK \
    -j REJECT
iptables -A acl_wan -m state --state NEW -p tcp --tcp-flags SYN,FIN SYN,FIN \
    -j log_wan
iptables -A log_wan -m state --state NEW -p tcp --tcp-flags SYN,FIN SYN,FIN \
    -j LOG --log-level debug --log-prefix '* DROP: SYN + FIN * '
iptables -A log_wan -m state --state NEW -p tcp --tcp-flags SYN,FIN SYN,FIN \
    -j DROP
iptables -A acl_wan -m state --state NEW -p tcp ! --syn -j log_wan
iptables -A log_wan -m state --state NEW -p tcp ! --syn -j LOG \
    --log-level debug --log-prefix '* DROP: NEW, not SYN * '
iptables -A log_wan -m state --state NEW -p tcp ! --syn -j DROP
iptables -A acl_wan -m state --state INVALID -j log_wan
iptables -A log_wan -m state --state INVALID -j LOG \
    --log-level debug --log-prefix '* DROP: Invalid Packet * '
iptables -A log_wan -m state --state INVALID -j DROP
----

(The separate log_XXX chains are there to keep the main chains a bit smaller 
and hence perform better and be more readable; the log-level debug has to do 
with the syslog config - firewall logs can reliably go to another file by 
forcing them to be this low priority)

Log entries (with both IP addresses mangled to private ranges, in reality BOTH 
are legal, public IPs) look like

----
Oct  4 12:08:38 firewall kernel: * DROP: NEW, not SYN * IN=eth0
OUT=hdlc1 SRC=10.0.0.1 DST=192.168.0.1 LEN=1500 TOS=0x00
PREC=0x00 TTL=127 ID=28117 DF PROTO=TCP SPT=80 DPT=7616 WINDOW=17356
RES=0x00 ACK URGP=0
----

or

----
Oct  4 12:14:32 firewall kernel: * DROP: NEW, not SYN * IN=eth0
OUT=hdlc0 SRC=10.0.0.2 DST=192.168.0.2 LEN=64 TOS=0x00
PREC=0x00 TTL=127 ID=57892 DF PROTO=TCP SPT=80 DPT=20965 WINDOW=17363
RES=0x00 ACK URGP=0 
----

'SRC' is local in these cases, but both are different machines. Both DSTs are 
even in completely different networks.

I'm really at a loss here. Does anyone know what's going on?

Oh, a final note: although I get quite a few of them (about 20-40% of the 
firewall log, depending on portscan activity) I never heard any complaints, 
nor from customers, nor from coworkers. So it seems rather harmless. But I 
rather don't want to open up such packets to avoid potential exotic 
portscans, or malformed TCP packets that can crash an IP stack.

And blocking them without logging is fine with me if I know *what* it is, but 
not before...

Thanks in advance for any help,

-- 
Martijn


