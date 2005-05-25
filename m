From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Wed, 25 May 2005 07:35:23 +0200
Message-ID: <42940E9B.1070502@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
	<42920AA7.6070909@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42920AA7.6070909@riverviewtech.net>
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

Taylor, Grant wrote:
> Would this version be more to your liking?  I'm just trying to evolve this script to answer as many of the questions / concerns that are being posed on the list.
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
> iptables -A SSH_Brute_Force -s $My_Home_Firewall_IP -j RETURN
> iptables -A SSH_Brute_Force -s $My_Office_Firewall_IP -j RETURN
> iptables -A SSH_Brute_Force -s $My_Girlfriends_Firewall_IP list -j RETURN
> iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN 
> iptables -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
> iptables -A SSH_Brute_Force -p tcp -j TARPIT
> I have tested this script on my home firewall and have found it to work the way that it is intended, so give it a try and see what you think.  Any and all feedback is welcome and appreciated.

Hi all

For some funny reason I still cant seem to get this right.
I tried connecting from home (dynamic assigned ip) and I still cant connect.

I can connect to my other two server 100%, but the one im trying this on.
I still cant seem to get it right.

Brent

======================================================================

May 25 06:21:51 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131 
DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40576 DF 
PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0 OPT 
(0204055001010402)
May 25 06:21:54 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131 
DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40578 DF 
PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0 OPT 
(0204055001010402)
May 25 06:22:00 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131 
DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40585 DF 
PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0

$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A INPUT -m state --state INVALID -j LOG --log-prefix 
"INVALID input: " --log-tcp-options --log-ip-options
$IPT -t filter -A INPUT -m state --state INVALID -j DROP
$IPT -t filter -A INPUT -p tcp  --dport 113 -j REJECT --reject-with 
icmp-host-unreachable
$IPT -t filter -A INPUT -d 217.199.186.255 -j DROP
$IPT -t filter -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 20 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 21 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 25 -m state --state NEW -j ACCEPT

$IPT -N SSH_Brute_Force
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name 
SSH --set --rsource -j SSH_Brute_Force
$IPT -A SSH_Brute_Force -s 196.31.9.82 -j RETURN
$IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 
--name SSH --rsource -j RETURN
$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$IPT -A SSH_Brute_Force -p tcp -j DROP

$IPT -t filter -A INPUT -p tcp --dport 10000 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 135 -j DROP
$IPT -t filter -A INPUT -p tcp  --dport 113 -j REJECT --reject-with 
icmp-host-unreachable
$IPT -t filter -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type destination-unreachable -j 
ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type ! echo-request -j LOG
$IPT -t filter -A INPUT -j LOG --log-prefix "[INPUT  DROP]: " 
--log-tcp-options --log-ip-options
$IPT -t filter -A INPUT -j DROP

