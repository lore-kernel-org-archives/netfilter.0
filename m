From: Karl Lattimer <karl@kms-lan.co.uk>
Subject: Re: Kernel 2.6.5 - iptables 1.2.9 problems
Date: Wed, 30 Jun 2004 11:06:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088590006.667.7.camel@despair.kent-music.com>
References: <1088179390.2701.14.camel@despair.kent-music.com>
	 <40DC4F0E.5040609@kanux.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-piHjHHD8nvc16p45X1mm"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DC4F0E.5040609@kanux.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Juan Hernandez <alucard@kanux.com>
Cc: netfilter@lists.netfilter.org


--=-piHjHHD8nvc16p45X1mm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi IP-Tables isn't outputting any error messages at all. Heres my
script. Or there abouts.

The problems i am getting are the port forwards for 4662 and 4672 arn't
working correctly. I'm getting port forwards adding themselves in for
ports 5800,5900,3372,6502,1025,1026,42 and 366. As you can see these
rules don't exist in the firewall, there is also an nmap scan output
attached of the ports which are open/filtered.

Connection tracking is working fine and when i add some rules in to open
ports up sometimes it doesn't work sometimes it does.

Thanks

Karl

On Fri, 2004-06-25 at 17:13, Juan Hernandez wrote:
> Could you copy and pase some logging?
> 
> Juan
> Karl Lattimer wrote:
> 
> >Hi, I've got a firewall script I've which i've been using for 2 years
> >now on redhat 7.3 and redhat 9, after upgrading to fedora core 2 the
> >script is misbehaving slightly. Some of my port forwards don't work
> >correctly and some of my port blocking/opening doesn't work correctly.
> >
> >Any ideas what may be causing this?
> >
> >Thanks
> >
> >Karl
> >
> >
> >  
> >

--=-piHjHHD8nvc16p45X1mm
Content-Disposition: attachment; filename=firewall.debug.sh
Content-Type: application/x-shellscript; name=firewall.debug.sh
Content-Transfer-Encoding: 7bit

#!/bin/bash
/sbin/iptables -F 
/sbin/iptables -Z 
/sbin/iptables -X 
/sbin/iptables -P INPUT DROP 
/sbin/iptables -P OUTPUT DROP 
/sbin/iptables -P FORWARD DROP 
/sbin/iptables -N SYN_FLOOD 
/sbin/iptables -A SYN_FLOOD -m limit --limit 1/s --limit-burst 4 -j RETURN 
/sbin/iptables -A SYN_FLOOD -j REJECT --reject-with icmp-host-unreachable 
/sbin/iptables -N STOP_SYN_SCAN 
/sbin/iptables -A STOP_SYN_SCAN -m limit --limit 60/s --limit-burst 10 -j RETURN 
/sbin/iptables -A STOP_SYN_SCAN -j REJECT --reject-with icmp-port-unreachable 
/sbin/iptables -A INPUT -j ACCEPT -i lo 
/sbin/iptables -A OUTPUT -j ACCEPT -o lo 
/sbin/iptables -N NetBIOS-wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p tcp -m state --state NEW,ESTABLISHED --dport 135:139 --sport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p udp -m state --state NEW,ESTABLISHED --dport 135:139 --sport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p tcp -m state --state NEW,ESTABLISHED --dport 445 --sport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p udp -m state --state NEW,ESTABLISHED --dport 445 --sport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p tcp -m state --state ESTABLISHED --sport 135:139 --dport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -o wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p udp -m state --state ESTABLISHED --sport 135:139 --dport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -o wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p tcp -m state --state ESTABLISHED --sport 445 --dport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -o wp1adsl 
/sbin/iptables -A NetBIOS-wp1adsl -p udp -m state --state ESTABLISHED --sport 445 --dport 1024:65535 -j REJECT --reject-with icmp-host-unreachable -o wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 25: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 25: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 110: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 110: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 143: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 143: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 465: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 465: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 993: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 993: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 995: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 995: -j DNAT --to-destination 192.168.0.2 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 4662: -j DNAT --to-destination 192.168.0.4 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 4662: -j DNAT --to-destination 192.168.0.4 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p tcp --dport 4672: -j DNAT --to-destination 192.168.0.4 -i wp1adsl 
/sbin/iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 81.174.143.230 -p udp --dport 4672: -j DNAT --to-destination 192.168.0.4 -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p tcp --sport 53 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p udp --sport 53 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -m state --state INVALID -j DROP -i wp1adsl 
/sbin/iptables -A INPUT -p tcp --syn -j SYN_FLOOD -i wp1adsl 
/sbin/iptables -A INPUT -p tcp --dport 0:1023 --syn -j STOP_SYN_SCAN -i wp1adsl 
/sbin/iptables -A INPUT -p tcp ! --syn -m state --state NEW -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -j NetBIOS-wp1adsl 
/sbin/iptables -A INPUT -j NetBIOS-wp1adsl 
/sbin/iptables -A INPUT -f -j LOG --log-prefix IPTABLES FRAGMENTS:  -i wp1adsl 
/sbin/iptables -A INPUT -f -j DROP -i wp1adsl 
/sbin/iptables -A INPUT -s 10.0.0.0/8 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 172.16.0.0/12 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 192.168.0.0/16 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 224.0.0.0/4 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 240.0.0.0/5 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -d 127.0.0.0/8 -j REJECT --reject-with icmp-net-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -p tcp -s 0.0.0.0/0 -d 0.0.0.0/0 --dport 22 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -p udp -s 0.0.0.0/0 -d 0.0.0.0/0 --dport 22 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state ESTABLISHED,RELATED --dport 42 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state ESTABLISHED,RELATED --dport 42 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state NEW --dport 42 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state NEW --dport 42 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state ESTABLISHED,RELATED --dport 366 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state ESTABLISHED,RELATED --dport 366 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state NEW --dport 366 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state NEW --dport 366 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state ESTABLISHED,RELATED --dport 1025 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state ESTABLISHED,RELATED --dport 1025 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state NEW --dport 1025 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state NEW --dport 1025 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state ESTABLISHED,RELATED --dport 6502 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state ESTABLISHED,RELATED --dport 6502 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p tcp -m state --state NEW --dport 6502 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 81.174.143.230 -p udp -m state --state NEW --dport 6502 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A INPUT -p tcp -m state --state NEW,ESTABLISHED,RELATED --dport 1024:65535 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -p udp -m state --state NEW,ESTABLISHED,RELATED --dport 1024:65535 -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -p udp --dport 1024:65535 --sport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -p udp --dport 1024:65535 --sport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT -i wp1adsl 
/sbin/iptables -A INPUT -d 0.0.0.0/32 -j REJECT --reject-with icmp-host-unreachable -i wp1adsl 
/sbin/iptables -A OUTPUT -j NetBIOS-wp1adsl 
/sbin/iptables -A FORWARD -j NetBIOS-wp1adsl 
/sbin/iptables -A FORWARD -j ACCEPT -i lo 
/sbin/iptables -A FORWARD -j ACCEPT -o lo 
/sbin/ip route del default 
/sbin/ip route add default dev wp1adsl 
/sbin/tc qdisc add dev wp1adsl root handle 10: cbq bandwidth 10Mbit avpkt 1000 mpu 64 
/sbin/tc class add dev wp1adsl parent 10:0 classid 10:1 cbq bandwidth 10Mbit rate 57Kbit allot 1514 prio 1 maxburst 10 avpkt 100 isolated 
/sbin/tc class add dev wp1adsl parent 10:0 classid 10:2 cbq bandwidth 10Mbit rate 230Kbit allot 1514 prio 8 maxburst 2 avpkt 1500 bounded 
/sbin/iptables -t mangle -A PREROUTING -m length --length 0:500 -j MARK --set-mark 3 
/sbin/iptables -t mangle -A PREROUTING -m length --length 500:1500 -j MARK --set-mark 4 
/sbin/iptables -A INPUT -s 192.168.0.0/24 -j ACCEPT -i eth0 
/sbin/iptables -A INPUT -s 0.0.0.0/32 -j ACCEPT -i eth0 
/sbin/iptables -A FORWARD -j ACCEPT -i eth0 
/sbin/iptables -A FORWARD -j ACCEPT -o eth0 
/sbin/iptables -A FORWARD -s 192.168.0.0/24 -d 0.0.0.0/0 -j ACCEPT -o wp1adsl 
/sbin/iptables -A FORWARD -s 192.168.0.0/24 -d 0.0.0.0/0 -j ACCEPT -i wp1adsl 
/sbin/iptables -A FORWARD -s 0.0.0.0/0 -d 192.168.0.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT -o wp1adsl 
/sbin/iptables -A FORWARD -s 0.0.0.0/0 -d 192.168.0.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT -i wp1adsl 
/sbin/iptables -A FORWARD -j ACCEPT -i lo 
/sbin/iptables -A FORWARD -j ACCEPT -o lo 
/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o wp1adsl -j MASQUERADE 
/sbin/ip route del 192.168.0.0/24 
/sbin/ip route add 192.168.0.0/24 dev eth0 
/sbin/iptables -A INPUT -j REJECT --reject-with icmp-port-unreachable 
/sbin/iptables -A OUTPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT 
/sbin/iptables -A OUTPUT -j REJECT --reject-with icmp-port-unreachable 
/sbin/iptables -A FORWARD -j REJECT --reject-with icmp-port-unreachable 

--=-piHjHHD8nvc16p45X1mm
Content-Disposition: attachment; filename=nmap.firewall.txt
Content-Type: text/plain; name=nmap.firewall.txt; charset=UTF-8
Content-Transfer-Encoding: 7bit

(The 1557 ports scanned but not shown below are in state: closed)
Port       State       Service
1/tcp      filtered    tcpmux
2/tcp      filtered    compressnet
3/tcp      filtered    compressnet
4/tcp      filtered    unknown
5/tcp      filtered    rje
6/tcp      filtered    unknown
7/tcp      filtered    echo
8/tcp      filtered    unknown
9/tcp      filtered    discard
10/tcp     filtered    unknown
11/tcp     filtered    systat
12/tcp     filtered    unknown
13/tcp     filtered    daytime
14/tcp     filtered    unknown
15/tcp     filtered    netstat
16/tcp     filtered    unknown
17/tcp     filtered    qotd
18/tcp     filtered    msp
19/tcp     filtered    chargen
20/tcp     filtered    ftp-data
21/tcp     filtered    ftp
22/tcp     open        ssh
23/tcp     filtered    telnet
24/tcp     filtered    priv-mail
25/tcp     open        smtp
42/tcp     open        nameserver
110/tcp    open        pop-3
135/tcp    filtered    loc-srv
136/tcp    filtered    profile
137/tcp    filtered    netbios-ns
138/tcp    filtered    netbios-dgm
139/tcp    filtered    netbios-ssn
143/tcp    open        imap2
366/tcp    open        odmr
445/tcp    filtered    microsoft-ds
465/tcp    open        smtps
993/tcp    open        imaps
995/tcp    open        pop3s
1025/tcp   open        NFS-or-IIS
1026/tcp   open        LSA-or-nterm
3372/tcp   open        msdtc
5800/tcp   open        vnc-http
5900/tcp   open        vnc
6502/tcp   open        netop-rc
No exact OS matches for host (If you know what OS is running on it, see http://www.insecure.org/cgi-bin/nmap-submit.cgi).
TCP/IP fingerprint:
SInfo(V=3.00%P=i386-redhat-linux-gnu%D=6/30%Time=40E28D7F%O=22%C=26)
TSeq(Class=RI%gcd=1%SI=185E3A%IPID=Z%TS=1000HZ)
TSeq(Class=RI%gcd=3%SI=81693%IPID=Z%TS=1000HZ)
TSeq(Class=RI%gcd=1%SI=18513E%IPID=Z%TS=1000HZ)
T1(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
T2(Resp=N)
T3(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
T4(Resp=N)
T5(Resp=Y%DF=N%W=0%ACK=S++%Flags=AR%Ops=)
T6(Resp=Y%DF=N%W=0%ACK=O%Flags=R%Ops=)
T7(Resp=Y%DF=N%W=0%ACK=S++%Flags=AR%Ops=)
PU(Resp=Y%DF=N%TOS=0%IPLEN=38%RIPTL=148%RID=E%RIPCK=E%UCK=F%ULEN=134%DAT=E)

--=-piHjHHD8nvc16p45X1mm--


