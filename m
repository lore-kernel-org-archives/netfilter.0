From: Netfilter List <netfilter@ea80.net>
Subject: RE: Help! FTP DNAT from internet to intranet server not working
Date: Wed, 16 Mar 2005 09:37:25 +0100
Message-ID: <6.2.1.2.2.20050316093054.023817a0@mail>
References: <6.2.1.2.2.20050315155658.0276c5d8@mail>
	<200503151600.j2FG0CNW010368@smtp26.wxs.nl>
Mime-Version: 1.0
In-Reply-To: <200503151600.j2FG0CNW010368@smtp26.wxs.nl>
References: <6.2.1.2.2.20050315155658.0276c5d8@mail>
	<200503151600.j2FG0CNW010368@smtp26.wxs.nl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

problem solved!!!

the point was the wrong default gateway on ftp-server....
shame on me for not checking it first... *grrrr*

thanks




At 17:00 15.03.2005, you wrote:
>  It seems to me your NAT rule is wrong.
>
>You are trying to NAT port 20 (ftp-data port). You should not do anything
>with that port in you iptables rule. Handling of the ftp data connection and
>NAT should be done by ip_copnntrack_nat and ip_nat_ftp modules.
>
>I think it should read:
>
>iptables -t nat -A PREROUTING -p tcp -i eth1 --destination-port 21 -j DNAT
>--to-destination 192.168.0.1
>
>If this does not work enable extended logging on your ftp server and see if
>the ftp PORT command gets natted correctly etc.
>
>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Netfilter List
>Sent: 15 March 2005 16:30
>To: netfilter@lists.netfilter.org
>Subject: Help! FTP DNAT from internet to intranet server not working
>
>hi,
>
>we got a strange problem while trying to access our internal ftp server from
>"outside" with iptables DNAT feature.
>it simply doesnt work.
>
>linux kernel is 2.4.29, iptables 1.3.1
>
>this is the COMPLETE firewall script.
>--------------------------------------
>#!/bin/sh
>echo 1 > /proc/sys/net/ipv4/ip_forward
>
>modprobe ip_conntrack_ftp
>modprobe ip_nat_ftp
>
>iptables -t nat -F
>iptables -P INPUT ACCEPT
>iptables -F INPUT
>iptables -P OUTPUT ACCEPT
>iptables -F OUTPUT
>iptables -P FORWARD ACCEPT
>iptables -F FORWARD
>
>iptables -t nat -A PREROUTING -p tcp --destination-port 20:21 -i eth1 -j
>DNAT --to-destination 192.168.0.1
>--------------------------------------
>
>lsmod after loading firewall script:
>------------------------------------
>Module                  Size  Used by    Not tainted
>ipt_MASQUERADE          1464   0  (autoclean)
>ipt_state                536   0  (autoclean)
>ip_nat_ftp              2736   0  (unused)
>iptable_nat            18488   2  [ipt_MASQUERADE ip_nat_ftp]
>ip_conntrack_ftp        3856   1
>ip_conntrack           20844   1  [ipt_MASQUERADE ipt_state ip_nat_ftp
>iptable_nat ip_conntrack_ftp]
>------------------------------------
>
>192.168.0.1 is up and running (IIS 6.0), and ftp works without problems.
>eth1 is the external interface. we installed for test purposes proftpd on an
>other machine (old redhat box with no firewall) -> same problem.
>so we think the ftp server cant be the point...
>
>when we try to acces the ftp server from outside, the ftp client gets a
>timeout.
>there is no login, no error...nothing.
>
>tcpdump on eth1 (external if a.b.c.d) is:
>16:17:55.897243 IP [ftp client ip].3962 > a.b.c.d.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK>
>16:17:58.815244 IP [ftp client ip].3962 > a.b.c.d.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK> 16:18:04.820680
>IP [ftp client ip].3962 > a.b.c.d.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK> tcpdump on eth0
>(internal if 192.168.0.100) is:
>16:17:55.897280 IP [ftp client ip].3962 > localhost.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK>
>16:17:58.815258 IP [ftp client ip].3962 > localhost.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK>
>16:18:04.820694 IP [ftp client ip].3962 > localhost.ftp: S
>4200552376:4200552376(0) win 64240 <mss 1460,nop,nop,sackOK>
>
>when we insert the logging rule:
>iptables -t nat -A PREROUTING -p tcp --destination-port 20:21 -i eth1 -j LOG
>--log-level 1 --log-prefix "DNAT FTP: "
>we get the following logfile entry:
>Mar 15 14:38:37 firewall kernel: DNAT FTP: IN=eth1 OUT=
>MAC=00:04:75:cb:c4:a1:00:07:0e:88:af:20:08:00 SRC=[ftp client ip]
>DST=a.b.c.d LEN=48  TOS=0x00 PREC=0x00 TTL=117 ID=17336 DF PROTO=TCP
>SPT=2031 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
>
>does anyone know, whats going on here?
>am i missing something?
>
>any help would be great....we ran out of ideas :(
>
>kind regards


