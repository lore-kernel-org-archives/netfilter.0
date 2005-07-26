From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: TOS problem
Date: Tue, 26 Jul 2005 14:49:22 +0200
Message-ID: <42E63152.9030006@mnemon.de>
References: <200507251448.41773.marcin.giedz@eulerhermes.pl>	<42E4F664.70801@mnemon.de>
	<200507261258.08378.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507261258.08378.marcin.giedz@eulerhermes.pl>
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
To: netfilter@lists.netfilter.org

Marcin Giedz schrieb:
> Hello,
> 
> 
>>Your providing too little information, so nobody can help you - even if
>>he/she desired to do so.
> 
> Maybe your are right.. I will try once again.
> 
> In my office we have 2 gateways. One of them GATEWAY1 is connected to one ISP1 
> and it is also default gateway for almost all of our servers. I said "almost" 
> because there is one server "service" where default gateway is GATEWAY2 
> connected to another ISP2.
> 
> All of our customers run Services situated on "service" server  via GATEWAY2. 
> But if GATEWAY2 is down or connection to ISP2 is broken I would like that 
> customers can still connect to Services via GATEWAY1. So I need some kind of 
> redirection on GATEWAY1 because I don't want to switch default gateway on 
> "service" manually. However if GATEWAY2 is running OK some part of our 
> customers can still run Services via GATEWAY1. My problem is:
> how to route connections to "service" server passed via GATEWAY1? 

Just to summarize the important points. Main traffic goes via GW1 to
ISP1, but the server in question has as default GW GW2 which in turn has
default GW to ISP2. The problem is to forward incoming connection from
GW1 to GW2 (or your special service server), if customers connect to
service server via GW1.

> Packets MARK'ing work within kernel so can be used. Another way is changing 
> TOS on GATEWAY1 for "these" packets and route them to "service".  

Yes, almost for sure, it is possible to have a solution based on MARK
and / or TOS, but I don't believe that it's necessary.

You said in your posting "IP:Port REDIRECT problem", that you tried with
public IPs to no avail. Why public IPs ? If your GWs aren't connected to
each other somehow, I suggest to connect them with RFC1918 addresses and
 set the routes accordingly. You don't want to redirect from GW1 to GW2
via the internet, do you ?

Once the GWs are connected, I think the simple solution will be to use
DNAT and SNAT with iptables, 'cause I can't see anything, that needs
more effort. So it breaks down to curby's posting, which looks something
this style:

## On GW1
iptables -t nat -A PREROUTING -p tcp --dport 4000 \
   -i $INET_IFACE -j DNAT --to $IP_OF_GW2
## If FORWARD policy is not ACCEPT or you have a rule like
## ... -A FORWARD -j DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
   -j ACCEPT
iptables -A FORWARD -i $INET_IFACE -o $IFACE_TO_GW2 \
   -p tcp --dport 4000 --syn -j ACCEPT
## You need SNAT too, at least it's the save way
iptables -t nat -A POSTROUTING -o $IFACE_TO_GW2 \
   -p tcp --dport 4000 -j SNAT --to $IP_OF_IFACE_TO_GW2

So, if GW1 and GW2 are connected somehow and know how to route packets
to each other, the packets in question will reach GW2 with a source
address of GW1. If allowed by iptable rules, GW2 will forward / redirect
these packets to "service server" (maybe applying DNAT and SNAT too) and
everything should work.

HTH and have a nice time,

Joerg


