From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: wireless filter question
Date: Sun, 5 Jan 2003 19:36:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301051936.26076.netfilter@newkirk.us>
References: <1041806262.6022.77.camel@cookies.local.redneck.nu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1041806262.6022.77.camel@cookies.local.redneck.nu>
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
To: Tommy McNeely <Tommy.McNeely@Sun.COM>, netfilter@lists.netfilter.org

On Sunday 05 January 2003 05:37 pm, Tommy McNeely wrote:
> Thanks for your quick answer on the ftp port issue (I learned a new
> command "modinfo" that will make it so I can answer module questions
> on my own from now on)
>
> I have my wireless network being "firewalled" by my Linux box...
> (something like)
>
> :INPUT DROP [0:0]
>
> (definitions removed)
>
> [0:0] -A INPUT -i lo -j ACCEPT
> [0:0] -A INPUT -i eth0 -j ACCEPT
> [0:0] -A INPUT -i eth1 -j PublicFilter
> [0:0] -A INPUT -i eth2 -j WirelessFilter
> [0:0] -A INPUT -i ppp+ -j PublicFilter
>
> (excess rules removed)
>
> ##### WIRELESS FILTER
> [0:0] -A WirelessFilter -p udp -m udp --dport 53 -j ACCEPT
> [0:0] -A WirelessFilter -p tcp -m tcp --dport 53 -j ACCEPT
> [0:0] -A WirelessFilter -p tcp -m tcp --dport 80 -j ACCEPT
> [0:0] -A WirelessFilter -p udp -m udp --dport 67 -j ACCEPT
> [0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
> [0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
> [0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
> [0:0] -A WirelessFilter -m state --state RELATED,ESTABLISHED -j ACCEPT
> [0:0] -A WirelessFilter -m state --state NEW -j MyREJECT

> Basically what I am trying to accomplish here is that _IF_ you figure
> out my key (which I know is trivial) and know the name of the ESSID
> (which is not being broadcast), then I want to have a little firewall
> waiting for you on the other side.
>
> I _DO_ want to allow them to come online and be able to look up their
> DNS (so windows thinks its online)... but I want to have it so that
> only my machines have full access to the network, and people who dont
> have access (should be my friends that I have given ESSID and KEY to)
> will get a webpage that says something generic like "You are on such
> and such wireless network.. If you do not have permission to be here,
> get off now.. otherwise, please email wirelessadmin@somedomain.com to
> be added to the access list."
>
> My problem is.. that while I feel the actual firewall HOST is
> protected by the rules below, I don't have any fricken clue how to do
> the redirect thing to the web site.. and I think I probably need some
> freakey forward rules or maybe something in -t nat? and squid?? or ??
> maybe a neat virtual host in apache??

What you have listed here is only for INPUT chain, therefore only for=20
connections directly to your firewall host.  Anything that requests an=20
IP other than the firewall's will go through the FORWARD chain, never=20
hitting INPUT except one possible situation I'll mention in a bit.

You want to allow/prevent connections in the FORWARD chain, filter table=20
(default table) for anything other than connections TO this box.  For=20
connections directly to this box, use the INPUT chain.

For your scenario, I would suggest something a little unusual, as=20
follows.  Set up that the first rule (for eth2) in NAT PREROUTING jumps=20
to a user-defined chain.  In that chain, have an ACCEPT rule for anyone=20
on your access list, and use the REDIRECT target for the rest (from=20
eth2), to redirect them to an apache-served document on the box itself. =20
You can redirect to a different port and set up a virtual host if you=20
are already using apache.  Also ACCEPT UDP 53 if you want them to be=20
able to use DNS regardless of the access list, in the PREROUTING chain. =20

NAT PREROUTING is explicitly for NAT, NOT for filtering, but this usage=20
is valid, IE using the ACCEPT target to control what packets hit DNAT or=20
REDIRECT rules.  You will then need to ACCEPT those connections in INPUT=20
for them to be able to complete the REDIRECT, and ACCEPT access list=20
clients in FORWARD to allow them out to the internet or the rest of your=20
network.  This is the situation I hinted at where normally forwarded=20
connections will hit the INPUT chain, since after a redirection they are=20
destined for the local box.

I'd also suggest logging right before the REDIRECT, so if you see someone=
=20
connecting again and again but NOT complying with your request, you can=20
add a DROP rule in FORWARD and INPUT to just shut them out.  (actually,=20
depending on paranoia level and traffic level, you might want to log all=20
state NEW connections from eth2...)

Finally, if you write the rules carefully, you should be able to reuse=20
the WirelessFilter chain from PREROUTING, INPUT and FORWARD.  Normally=20
this poses problems, but if all the rules in the chain consist solely of=20
matching macs and accepting, and other rules are not in that chain, it=20
will work.  This way you could have something like:

iptables  -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
iptables  -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
iptables  -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT

iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 53 -j ACCEPT
iptables -t nat -A PREROUTING -i eth2 -p udp --multiport   \
=09--dport 53, 67 -j ACCEPT
iptables -t nat -A PREROUTING -i eth2 -j WirelessFilter
iptables -t nat -A PREROUTING -i eth2 -j LOG --log-prefix   \=20
"IPT:UnAuthWrls:"
iptables -t nat -A PREROUTING -i eth2 -j REDIRECT --to-ports 83

iptables -A FORWARD -i eth2 -p tcp --multiport --dport 25,80,110,443   \
=09-j WirelessFilter

iptables -A INPUT -i eth2 -p tcp --dport 83 -j ACCEPT
iptables -A INPUT -i eth2 -m state --state ESTABLISHED,RELATED   \
=09-j WirelessFIlter

With this you accept the stated ports in PREROUTING regardless of source=20
mac, then accept your access list macs in WirelessFilter regardless of=20
port, then redirect everything else to local port 83, where you=20
(presumably) have apache configured to deliver your little message. =20
Remember that all this does is control what packets reach the REDIRECT,=20
it is not intended to filter what packets are allowed/disallowed.  The=20
log-prefix can be anything you want, but make it something meaningful=20
and easy to search.  (IE, "cat /var/log/messages | grep IPT:UnAuthWrls")

You could of course just redirect port 80 requests, but who cares?  This=20
way anything other than the previously accepted ports gets redirected,=20
if the result is nonsensical it's their problem, won't affect you.  :^) =20
You can of course redirect to port 80 if you want, but although it is=20
possible to redirect without any '--to-ports' your safer forcing=20
everything to a single port that you can control more easily.  REDIRECT=20
will automatically reverse, just like SNAT and DNAT, so the response=20
will appear to the client as coming from the expected port anyway.

As long as WirelessFilter's rules are 'safe', (nothing table-specific)=20
you can then reuse the WirelessFilter user-defined chain in FORWARD to=20
handle ACCEPTs for everyone on the access list, provided that the packet=20
matches one of the ports in the rule that jumps to WirelessFilter.  If=20
there is some reason those people would need to access the firewall host=20
itself, then you could reuse the chain again in INPUT, where you will=20
also need a rule to ACCEPT port 83 (or whatever you redirect to) so that=20
anyone can reach the message.

You should use state matching rules in INPUT and FORWARD chains still, to=
=20
allow ESTABLISHED and/or RELATED connections where appropriate, (you=20
might not want RELATED nor even ESTABLISHED for the redirects...) but=20
this wouldn't serve any useful purpose I can see in the PREROUTING=20
chain.  The point is simply to ACCEPT allowed connections in PREROUTING=20
so that everything else drops through to the REDIRECT, don't try to do=20
any 'real' filtering in the PREROUTING chain or one to which it jumps. =20
Be careful about EST/REL for unauthorized connections, though, you=20
really shouldn't need them.

Obviously there are several vital rules missing from the fragments I=20
offer above, and the fragments themselves would need to be changed to=20
match your actual needs, but they should convey the idea well enough.

j


