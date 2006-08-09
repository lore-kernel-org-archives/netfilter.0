From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Problem with router connected to two ISPs (connection marking?)
Date: Wed, 09 Aug 2006 13:47:39 +0200
Message-ID: <44D9CB5B.9020508@freemail.hu>
References: <200608082140.03815.marek.zachara@telperion.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200608082140.03815.marek.zachara@telperion.pl>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

>
> Hi there
>   
...
> here is the iptables script: ------------------------
>
> EXTINT=eth0
> DMZ=eth1
> INTERN=eth2
>
> MAIL=1.0.0.1
> WWW=1.0.0.2
> MAIL2=2.0.0.1
> WWW2=2.0.0.2
>
> INT_WWW=192.168.1.16
>
> $IPT -P INPUT DROP
> $IPT -F INPUT
> $IPT -P OUTPUT ACCEPT
> $IPT -F OUTPUT
> $IPT -P FORWARD ACCEPT
> $IPT -F FORWARD
>
> $IPT -t filter -N keep_state
> $IPT -t filter -A keep_state -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -t filter -A keep_state -j RETURN
>   
-j RETURN <== Not needed if this is the last command of a chain...
> $IPT -t filter -A INPUT -j keep_state
> $IPT -t filter -A OUTPUT -j keep_state
> $IPT -t filter -A FORWARD -j keep_state
>   
It would be a bit simplier:

$IPT -t filter -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
$IPT -t filter -A OUTPUT -j ACCEPT -m state --state ESTABLISHED,RELATED
$IPT -t filter -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED

> $IPT -A INPUT -i lo -j ACCEPT
> $IPT -A INPUT -p icmp -j ACCEPT
> #silently discard all windows related worm attacks
> $IPT -A INPUT -p tcp --destination-port 135:140 -j DROP
> $IPT -A INPUT -p udp --destination-port 135:140 -j DROP
> $IPT -A INPUT -p tcp --destination-port 445 -j DROP
> #drop any traffic incomming on unprivileged ports
> $IPT -A INPUT -p tcp --destination-port ! 1:1024 -j DROP
> $IPT -A INPUT -p udp --destination-port ! 1:1024 -j DROP
> #log any potential scans of privileged ports (ignore port 80)
> $IPT -A INPUT -p tcp --destination-port 80 -j DROP
> $IPT -A INPUT -i $EXTINT -j LOG --log-level info
>
> $IPT -t nat -F
>
>
> # WWW server
> $IPT -t nat -A PREROUTING -d $WWW -p tcp --destination-port 80 -j DNAT --to-destination $INT_WWW
> $IPT -t nat -A PREROUTING -d $WWW2 -p tcp --destination-port 80 -j DNAT --to-destination $INT_WWW
>   
Maybe these lines will help you... :) But if not.... :D

$IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW 
--to-source $MY_IP
$IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW 
--to-source $MY_IP
> #masquerade all other outgoing transfers
> $IPT -t nat -A POSTROUTING -o $EXTINT -j MASQUERADE
>
> $IPT -t mangle -F
> $IPT -t mangle -A PREROUTING -i $EXTINT -j CONNMARK --restore-mark
> $IPT -t mangle -A PREROUTING -m connmark --mark 1 -j ACCEPT
> $IPT -t mangle -A PREROUTING -m connmark --mark 2 -j ACCEPT
> $IPT -t mangle -A PREROUTING -i $EXTINT -d 1.0.0.0/29 -j CONNMARK --set-mark 1
> $IPT -t mangle -A PREROUTING -i $EXTINT -d 2.0.0.0/29 -j CONNMARK --set-mark 2
> $IPT -t mangle -A PREROUTING -i $EXTINT -j CONNMARK --save-mark
>
>   

