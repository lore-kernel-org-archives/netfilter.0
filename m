From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: nat of all local dns-request to my own server
Date: Sun, 10 Apr 2005 14:59:21 -0500
Message-ID: <42598599.2070502@riverviewtech.net>
References: <1113137280.2857.20.camel@piepre-debian.klo>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113137280.2857.20.camel@piepre-debian.klo>
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
To: =?ISO-8859-15?Q?Philipp_P=E4per?= <piepre@gmx.de>
Cc: netfilter@lists.netfilter.org

What you are asking for sounds simple enough.  Though as I read your script below I see a few things that differ from what I would do.  I would use something along these lines:

EXT=eht1
EXT_IP=193.x.x.251
EXT_NET=193.x.x.0/24
DMZ=eth2
DMZ_IP=10.0.0.1
DMZ_NET=10.0.0.1/30  
INT=eth0
INT_IP=192.168.112.1
INT_NET=192.168.112.0/24
SERVER_DMZ=10.0.0.2

iptables -t nat -A PREROUTING -i $INT -s $INT_NET -d $INT_IP -p tcp --dport 53 -j DNAT --to-destination $SERVER_DMZ
iptables -t nat -A PREROUTING -i $INT -s $INT_NET -d $INT_IP -p udp --dport 53 -j DNAT --to-destination $SERVER_DMZ
iptables -t nat -A POSTROUTING -o $DMZ -s $INT_NET -d $SERVER_DMZ -p tcp --dport 53 -j SNAT --to-source $DMZ_IP
iptables -t nat -A POSTROUTING -o $DMZ -s $INT_NET -d $SERVER_DMZ -p udp --dport 53 -j SNAT --to-source $DMZ_IP
iptables -t filter -A FORWARD -i $INT -o $DMZ -s $INT_NET -d $SERVER_DMZ -p tcp -m state --state NEW -j ACCEPT
iptables -t filter -A FORWARD -i $DMZ -o $INT -s $SERVER_DMZ -d $INT_NET -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -i $ING -o $DMZ -s $IMT_NET -d $SERVER_DMZ -p udp -j ACCEPT
iptables -t filter -A FORWARD -i $DMZ -o $INT -s $SERVER_DMZ -d $INT_NET -p udp -j ACCEPT

Something to keep in mind is that UDP does not have states like TCP does so you can't do a statefull match against it.  What this will effectively do is take any TCP and UDP traffic coming in the $INT interface destined to the $INT_IP on port 53 DNAT it to the $SERVER_DMZ and last but not least SNATing the traffic as to appear as if it is coming from the firewall + router its self to the new server $SERVER_DMZ.  The reason you want the traffic to appear as if it is coming from the firewall its self is because if it responds directly to the clients making the DNS query the traffic will appear to be coming from an IP that the client's have not been communicating with.  Keep in mind that the clients are sending the DNS query to $INT_IP and they would get a response from $SERVER_DMZ which are not the same.



Grant. . . .

> networkplan:
> 
> internet
>  |
>  |
> router ---- server (DNS + HTTP + EMail)
>  | 
>  |
> intranet
> 
> router: intern: eth0 - 192.168.112.1, extern: eth1 - 193.x.x.251, dmz:
> eth2 - 10.0.0.1
> server: eth0: 10.0.0.2
> 
> here are the rule i tried the last time:
> 
> EXT=eht1
> EXT_IP=193.x.x.251
> EXT_NET=193.x.x.0/24
> DMZ=eth2
> DMZ_IP=10.0.0.1
> DMZ_NET=10.0.0.1/30  
> INT=eth0
> INT_IP=192.168.112.1
> INT_NET=192.168.112.0/24
> 
> SERVER_DMZ=10.0.0.2
> 
> iptables -t nat -A PREROUTING -i $INT -p tcp --dport 53 -j DNAT --to-destination $SERVER_DMZ
> iptables -t nat -A POSTROUTING -o $INT -s $SERVER_DMZ -p tcp --dport 53 -j SNAT --to-source $INT_IP
> iptables -A FORWARD -i $INT -m state --state NEW -p tcp -d $SERVER_DMZ --dport 53 -j ACCEPT
> iptables -t nat -A PREROUTING -i $INT -p udp --dport 53 -j DNAT --to-destination $SERVER_DMZ
> iptables -t nat -A POSTROUTING -o $INT -s $SERVER_DMZ -p udp --dport 53 -j SNAT --to-source $INT_IP
> iptables -A FORWARD -i $INT -m state --state NEW -p udp -d $SERVER_DMZ --dport 53 -j ACCEPT

