From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: from firewall machine wget is not working
Date: Tue, 5 Nov 2002 12:02:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005001c284ed$22276d40$8c01a8c0@sundaram>
References: <1100D69203AAD2118E3C00508B8B9E8A67F13C@mailhost.intech.unu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "Heupink, Mourik Jan C." <Heupink@INTECH.UNU.EDU>, netfilter@lists.netfilter.org

Hi,

wget command is not working form my firewall machine, But inside my network
I was able to use wget command

After resolving domain, its staying for ever.

$ wget http://www.fibrespeed.net/~mbabcock/mirrors/bing/bing-1.0.4.ta
r.gz
--11:53:51--
http://www.fibrespeed.net/%7Embabcock/mirrors/bing/bing-1.0.4.tar.
gz
           => `bing-1.0.4.tar.gz'
Resolving www.fibrespeed.net... done.
Connecting to www.fibrespeed.net[216.168.105.35]:80...




Inside my network, it downloaded the file

[sundaram@rose sundaram]$ wget
http://www.fibrespeed.net/~mbabcock/mirrors/bing
/bing-1.0.4.tar.gz
--23:59:24--
http://www.fibrespeed.net/%7Embabcock/mirrors/bing/bing-1.0.4.tar.
gz
           => `bing-1.0.4.tar.gz'
Resolving www.fibrespeed.net... done.
Connecting to www.fibrespeed.net[216.168.105.35]:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 20,774 [application/x-gzip]

100%[====================================>] 20,774        65.44K/s    ETA
00:00

23:59:25 (65.44 KB/s) - `bing-1.0.4.tar.gz' saved [20774/20774]

What is the problem?

Thanks
SR

my firewall rules:

[root@gw root]# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere           udp spt:domain
dpts:
1024:65535
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:domain
dpts:
1024:65535
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
ACCEPT     icmp --  anywhere             anywhere           icmp
destination-unr
eachable
ACCEPT     icmp --  anywhere             anywhere           icmp redirect
ACCEPT     icmp --  anywhere             anywhere           icmp
time-exceeded
DROP       icmp --  anywhere             anywhere           icmp echo-reply
DROP       icmp --  anywhere             anywhere           icmp echo-reply
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:1723
ACCEPT     gre  --  anywhere             anywhere
LOG        udp  --  anywhere             anywhere           udp dpt:2002 LOG
lev
el warning
DROP       udp  --  anywhere             anywhere           udp dpt:2002
REJECT     tcp  --  anywhere             anywhere           tcp dpt:https
reject
-with icmp-port-unreachable
LOG        all  --  wwwmailme.danbbs.dk  anywhere           LOG level
warning pr
efix `spam: '
DROP       all  --  wwwmailme.danbbs.dk  anywhere
LOG        all  --  wwwmailme.danbbs.dk  anywhere           LOG level
warning pr
efix `spam: '
LOG        all  --  syst.globaltel.cz    anywhere           LOG level
warning pr
efix `spam: '
DROP       all  --  syst.globaltel.cz    anywhere
LOG        all  --  syst.globaltel.cz    anywhere           LOG level
warning pr
efix `spam: '
LOG        all  --  www.iol.it           anywhere           LOG level
warning pr
efix `spam: '
DROP       all  --  www.iol.it           anywhere
LOG        all  --  www.iol.it           anywhere           LOG level
warning pr
efix `spam: '
Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABL
ISHED
ACCEPT     all  --  anywhere             anywhere           state NEW
REJECT     tcp  --  anywhere             anywhere           tcp dpt:auth
flags:S
YN,RST,ACK/SYN reject-with icmp-port-unreachable
ACCEPT     tcp  --  anywhere             percipia.com       tcp dpt:http
ACCEPT     tcp  --  anywhere             percipia.com       tcp dpt:pop3
ACCEPT     tcp  --  anywhere             percipia.com       tcp dpt:smtp
ACCEPT     tcp  --  anywhere             cvs                tcp dpt:ftp
ACCEPT     tcp  --  anywhere             cvs                tcp
dpt:cvspserver
ACCEPT     tcp  --  anywhere             192.168.1.12       tcp dpt:4899
ACCEPT     udp  --  anywhere             192.168.1.12       udp dpt:4899
ACCEPT     tcp  --  anywhere             mail.percipia.net  tcp dpt:http
ACCEPT     tcp  --  anywhere             mail.icss-usa.com  tcp dpt:http
ACCEPT     tcp  --  anywhere             mail.icss-usa.com  tcp dpt:pop3
ACCEPT     tcp  --  anywhere             mail.icss-usa.com  tcp dpt:smtp
ACCEPT     tcp  --  anywhere             192.168.1.142      tcp dpt:5631
ACCEPT     udp  --  anywhere             192.168.1.142      udp dpt:5632
ACCEPT     tcp  --  anywhere             192.168.1.143      tcp dpt:5631
ACCEPT     udp  --  anywhere             192.168.1.143      udp dpt:5632
ACCEPT     tcp  --  anywhere             192.168.1.144      tcp dpt:5631
ACCEPT     udp  --  anywhere             192.168.1.144      udp dpt:5632
ACCEPT     tcp  --  anywhere             192.168.1.145      tcp dpt:5631
ACCEPT     udp  --  anywhere             192.168.1.145      udp dpt:5632
DROP       all  --  wwwmailme.danbbs.dk  anywhere
DROP       all  --  syst.globaltel.cz    anywhere
DROP       all  --  www.iol.it           anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere           udp
spts:1024:65535
dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp
spts:1024:65535
dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:1723
ACCEPT     gre  --  anywhere             anywhere
REJECT     tcp  --  anywhere             anywhere           tcp dpt:https
reject
-with icmp-port-unreachable


