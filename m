From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: SNAT, packet mangling and QoS Problem
Date: Sun, 5 Jan 2003 14:20:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301051420.55275.netfilter@newkirk.us>
References: <IMELJGMMLMCOALNNLBFCKEDECFAA.jna@microflex.ca>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <IMELJGMMLMCOALNNLBFCKEDECFAA.jna@microflex.ca>
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
To: jna@microflex.ca, netfilter@lists.netfilter.org

On Sunday 05 January 2003 01:37 pm, Jean-Francois Nadeau wrote:
> Hi,
>
> Let say you have a proxy behind a firewall on your LAN.
> You use SNAT or MASQUERADING to give Internet access to your proxy.
> You also want to do some Qos (CBQ + U32) to shape traffic coming from
> the net to the proxy.
>
> The goal is to mark a packet returning from an exernal host to the
> proxy.
>
> The OUTPUT chain can not be used to mangle packets as they were not
> generated locally.
> The FORWARD and POSTROUTING chains cant be used with the mangle table.
> The PREROUTING chain offers no match as the packet is targetted at the
> SNAT IP.
>
> The problem is: I can not mark a packet in order to match a shaping
> class.
>
> Anyone has an idea on how to do the trick ?
>
> Any reason why the FORWARD chain cant be used with the mangle table ?

It CAN.  The mangle table has PREROUTING, FORWARD POSTROUTING, INPUT and=20
OUTPUT chains available, at least since v1.2.5, possibly earlier.  See=20
http://iptables-tutorial.frozentux.net/chunkyhtml/traversingoftables.html=
=20
=2E For 'returning' traffic from external host to proxy something like=20
this might work:

iptables -t mangle -A POSTROUTING -m state --state ESTABLISHED   \
-d $PROXYIP -i $EXTIF -p tcp --sport 80 -j MARK --set-mark 2

where PROXYIP and EXTIF are self-explanatory.  I used ESTABLISHED since=20
you specified "returning" in your scenario above.  If that's not what=20
you really want, just drop the state match and run with the rest.  I=20
used '--sport 80' presuming that by 'returning' traffic you intend to=20
catch replies from external web servers, but of course any match would=20
be usable here, dport, sport, etc.

j


