From: "Brent Clark" <bclark@eccotours.biz>
Subject: RE: ruleset
Date: Tue, 20 Jul 2004 18:02:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIMEMLCEAA.bclark@eccotours.biz>
References: <200407201637.13100.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407201637.13100.Antony@Soft-Solutions.co.uk>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all and Anthony

Thanks for replying.
In terms of "I know know nothing about security", unfortunately I have a
budget and expenditure to worry about, therefore, I cant really afford to
spend to much on machine etc. Therefore I am forced to run a few services on
the FW.

I am running a small dns server (pdnsd).
And I am running apache for the sake of my bandwith logging util (bandwithd,
bandwithd.sourceforge.org - REALLY NICE TOOL).

thanks for your assistance and pointers.
Really appreciate it.

Kind Regards
Brent Clark





-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Tuesday, July 20, 2004 5:37 PM
To: iptables
Subject: Re: ruleset


On Tuesday 20 July 2004 3:58 pm, Brent Clark wrote:

> Hi all
>
> Below is a copied and pasted ruleset.
> Anyone care to have a look, it would really be appreciated.

<snip...>

> # Allow for resolving of  DNS and lookup from  gate
>
> /sbin/iptables -A OUTPUT -o eth0 -p udp --dport 53 -m state --state NEW -j
> ACCEPT
> /sbin/iptables -A INPUT -i eth1 -p udp --sport 53 -m state --state NEW -j
> ACCEPT
> /sbin/iptables -A FORWARD -p udp --sport 53 -m state --state NEW -j ACCEPT

Is your firewall running a DNS server?   If so, you want the INPUT rule.
If
not (ie: you are passing DNS requests through to somewhere else), you want
the FORWARD rule.   I'd be surprised if you really want both.

Why do you specify source port 53 in the FORWARD rule instead of destination
port 53?   The reply packets are already taken care of by the
ESTABLISHED,RELATED rule.

> # Allow access gate from 192.168.111.0/255.255.255.0
>
> /sbin/iptables -A INPUT -i eth1 -p all -s 192.168.111.0/24 -j ACCEPT

You want *all* machines on 192.68.111.0./24 to have access to *all* services
on the firewall??

> /sbin/iptables -A FORWARD -p all -s 192.168.111.0/24 -d
192.168.111.0/24 -j
> ACCEPT

This one makes no sense.   Packets from one subnet to another machine on the
same subnet do not go through the firewall.

> # Allow access to port 80(http) and 443(https) to the gate
>
> /sbin/iptables -A INPUT -i eth1 -s 192.168.111.0/24 -p tcp -m
> multiport --dport 80,443 -m state --state NEW -j ACCEPT

You are running an http/s server on the firewall???

> #/sbin/iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

You are running an FTP server on the firewall as well as HTTP, HTTPS and
perhaps DNS???   Something makes me think you don't know about good security
practice saying "don't run uneccessary (some people say "any") services on
your firewall, as a compromise of one service can lead to a compromise of
the
firewall".

Regards,

Antony.

--
"It would appear we have reached the limits of what it is possible to
achieve
with computer technology, although one should be careful with such
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the
list;
                                                           please don't CC
me.




