From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DMZ trouble!
Date: Thu, 9 Jan 2003 02:58:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301090258.04071.netfilter@newkirk.us>
References: <1042090495.2320.216.camel@jimmy>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042090495.2320.216.camel@jimmy>
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
To: David Collodel <dave@crawlspaceradio.com>, netfilter@lists.netfilter.org

On Thursday 09 January 2003 12:34 am, David Collodel wrote:

{Very heavily snipped}

> Perhaps it would help if I included my entire script? Or at least the
> relevant parts of it.

It seems you included it entire.  :^)

> Thanks for any help you can offer.

[snipped lengthy but self-explanatory IP & interface aliases]

> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
>
> $IPTABLES -F
>
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
>
> $IPTABLES -F -t mangle
> $IPTABLES -t mangle -X

Why are you not flushing nat table as well?  BTW, the "$IPTABLES -F"=20
encompasses all the filter table chains, so the following three flushes=20
are redundant.

Why do you have so many (snipped) rules for INPUT to the firewall box=20
itself?  Do you really need to allow all ports and all protocols from=20
the DMZ and the LAN??  Unless you are running some services on the box=20
(which should probably be run on a server on the LAN or in the DMZ) you=20
really shouldn't allow ANY access, except SSH if you must.  Other than=20
SSH I can't conceive of why you need ANY access to this box from the=20
Internet.  Even the EST/REL shouldn't be necessary.

> $IPTABLES -A FORWARD -i $DMZ_IFACE -o $EXT_IFACE -j ACCEPT

This should probably be dropped in favor of individual rules to allow=20
each (if any other than DNS) connection that the DMZ machines would need=20
to initiate.

> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT

Do you trust the LAN machines and users this much?  You'd probably be=20
much better off if you just have a handful of rules to ACCEPT the=20
services they really require.  If someone needs something that doesn't=20
get through the firewall, you'll certainly get a call. :^)  You can then=20
decide if you want to allow it, and if so then add an appropriate rule. =20
On my home network, where I control all machines, I STILL only allow=20
four ports through FORWARD, and log everything else.  And my INPUT rules=20
are tighter than this, and my firewall IS my desktop machine, web=20
server, and an Unreal Tournament server, and runs P2P sometimes.  (Both=20
those are toggled through a script, so I open the ports manually with=20
"fw ut" for example then close with "fw utx")

> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

This one makes all your other FORWARD state rules rather unnecessary,=20
since they are all tighter than this, and this accepts any interface.

> $IPTABLES -A OUTPUT -p ALL -s $EXT_IP -j ACCEPT

Again, what need do you have for this box to communicate directly with=20
anything on the internet?  I would lock this sucker down TIGHT.  Set up=20
a script owned by root that you can execute to temporarily open INPUT=20
and OUTPUT only as far as absolutely necessary if there's anything you=20
need to do from the box.  Other than that leave OUTPUT and INPUT at just=20
DROP, with SSH allowed in and responded only if you have to.  If=20
somebody gets this box, they own your network.  Don't invite trouble. =20
(especially now that your complete firewall is part of a publicly=20
accessibly archive...)

I'm not sure why you bothered with a DROP policy on OUTPUT with the four=20
OUTPUT rules you use.  The ONLY thing you prevent from going out is an=20
incorrect IP.

> $IPTABLES -F -t nat

Ah, here's the nat table flush, 2/3 of the way through the script... :^) =
=20
Not a big deal, just that everything else is organized fairly clearly.

> # 3.2 PREROUTING chain

> # 3.2.3 DMZ DNAT
> #
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> --dport 80 -j DNAT --to-destination $DMZ_HTTP_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> --dport 22 -j DNAT --to-destination $DMZ_HTTP_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> --dport 443 -j DNAT --to-destination $DMZ_HTTP_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> --dport 8000 -j DNAT --to-destination $DMZ_HTTP_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP
> --dport 8001 -j DNAT --to-destination $DMZ_HTTP_IP
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> 53 -j DNAT --to-destination $DMZ_DNS_IP
> $IPTABLES -t nat -A PREROUTING -p UDP -i $EXT_IFACE -d $DNS_IP --dport
> 53 -j DNAT --to-destination $DMZ_DNS_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> 443 -j DNAT --to-destination $DMZ_DNS_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> 22 -j DNAT --to-destination $DMZ_DNS_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> 25 -j DNAT --to-destination $DMZ_DNS_IP
> $IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
> 995 -j DNAT --to-destination $DMZ_DNS_IP

Hmmm.  Well, this is the answer to your 'real' question.  I don't see ANY=
=20
rules in PREROUTING to DNAT connections from the LAN. Those would be=20
addressed -d $DNS_IP, but would be -i $LAN_IFACE.

You should seriously reconsider what communications the firewall box=20
itself requires, and what traffic the LAN is allowed to conduct.

j


