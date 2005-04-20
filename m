From: "Doug C" <the_wasp@game-nation.net.nz>
Subject: Re: Remapping of starcraft UDP port 6112
Date: Wed, 20 Apr 2005 19:39:25 +1200
Message-ID: <000901c5457c$14e461e0$3800a8c0@Dewasp>
References: <001001c544af$d2bd15e0$3800a8c0@Dewasp>
	<42655AC6.9080007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

cheers for spoting that the rules were backwards, i think i must have
stuffed them up when putting them into the email.

is it actually possible for iptables/netfilter to redirect the packets the
way i want it to?

if it is possible i dont see why it shouldnt work because as i said in the
first question warcraft can use any port it pleases therefor the protocol
must be able to handle it
----- Original Message -----
From: "Taylor, Grant" <gtaylor@riverviewtech.net>
To: "Doug C" <the_wasp@game-nation.net.nz>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, April 20, 2005 7:23 AM
Subject: Re: Remapping of starcraft UDP port 6112


> > ADSL=$(/sbin/ifconfig hsb0 | grep "inet addr" | awk -F: '{print $2}' |
awk '{print $1}'|sed -n 1p)
> >
> > iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport
63001 --to-destination 192.168.0.3:6112
> > iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport
6112 --to-source 192.168.0.3:63001
> >
> > iptables -A PREROUTING -t nat -j DNAT -p udp -d $ADSL --dport
63002 --to-destination 192.168.0.56:6112
> > iptables -A POSTROUTING -t nat -j SNAT -p udp -s $ADSL --sport
6112 --to-source 192.168.0.56:63002
>
> Doug, it looks like you might be using the wrong source IP to SNAT your
traffic to in your POSTROUTING chain.  I would use the following rules and
see if they work.
>
> iptables -t nat -A PREROUTING -p udp -d $ADSL --dport 63001 -j
DNAT --to-destination 192.168.0.3:6112
> iptables -t nat -A POSTROUTING -p udp -s 192.168.0.3 --sport 6112 -j
SNAT --to-source $ADSL:63001
>
> iptables -t nat -A PREROUTING -p udp -d $ADSL --dport 63002 -j
DNAT --to-destination 192.168.0.56:6112
> iptables -t nat -A POSTROUTING -p udp -s 192.168.0.56 --sport 6112 -j
SNAT --to-source $ADSL:63002
>
> It looks like you had your IPs backwards in your POSTROUTING rules.
However I'm a bit perplexed that your regular SNATing rules did not take
care of this.  You may also need to explicitly allow traffic for these
connections in your FORWARD chain if you have set the default policy to
DROP.
>
>
>
> Grant. . . .
>
>


