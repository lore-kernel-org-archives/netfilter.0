From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: netfilter digest, Vol 1 #514 - 7 msgs (was Re: portforwarding-HOWTO)
Date: Fri, 10 Jan 2003 15:07:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301101507.12420.netfilter@newkirk.us>
References: <20030108052635.5370.76979.Mailman@kashyyyk> <14780.192.168.0.1.1042018341.squirrel@mail.intermediacorp.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <14780.192.168.0.1.1042018341.squirrel@mail.intermediacorp.com>
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
To: oarojo@intermediacorp.com, netfilter@lists.netfilter.org

On Wednesday 08 January 2003 04:32 am, oarojo@intermediacorp.com wrote:
> Yes I'm using telnet from other network...

Please snip unrelated material out of a digest message when replying -=20
the other six messages had nothing to do with this...  A single-line=20
response with over 450 quoted lines is a big waste, especially since you=20
didn't sign the response making it appear that there might be more you=20
had added further on in the quoted part.

Also, you don't answer the first question I posed, or the one another=20
helpful participant offered. =20

You said you have a mail server behind your firewall and are trying to=20
DNAT connections to it from the internet.  You listed two DNAT rules=20
(which appeared correct) and two FORWARD rules to let the traffic reach=20
the mail server.  (which also appeared correct)

Since you don't offer much detail apart from this about the setup, we=20
asked if you have a rule allowing the return traffic back through the=20
FORWARD chain, and whether you have forwarding enabled with:
echo "1" > /proc/sys/net/ipv4/ip_forward
At least that's what I believe the other reply meant.  He actually asked=20
"Did you turn on Masquerading?", but MASQUERADE in iptables syntax is a=20
form of SNAT, while Masquerade in general is simply NAT used to hide=20
multiple machines, neither of which has any direct bearing on DNAT to a=20
mailserver, so I'm making a guess as to what the question really=20
intended. =20

Finally, you said you try telnetting to the IP, port 25, and get no=20
response.  Is there a service running on the mailserver that is properly=20
configured to respond to a telnet connection to port 25 from the=20
internet?  If this is the only DNAT you are attempting so far, you might=20
be better served trying it to port 80 with apache running on=20
192.168.0.5, until you confirm that your DNAT and FORWARD rules and=20
everything else are working as expected, THEN change over to port 25/110=20
with mail server (sendmail?) running and that way any failure at that=20
last step is then very likely a problem with mail configuration, rather=20
than firewall DNAT and forwarding.

j

> > Do you have a FORWARD rule to allow return traffic back out?  You
> > don't=3D20 mention one, so I have to ask.  Something like this would
> > work, if no=3D20 other more general rule allows it:
> >
> > iptables -A FORWARD -p tcp -o eth0 -s 192.168.0.5 -m multiport  \
> > --sport 25,110 -j ACCEPT
> >
> > Are you trying to telnet from outside the network?  If you are
> > trying to=3D20 do it from the firewall box or from anywhere on the
> > 192.168 network it=3D20 will fail unless you have other rules to help
> > 'guide' the traffic back=3D20 through the firewall.  (of course the
> > rules you list are presumably for=3D20 traffice from outside...)  See
> > Oskar's tutorial's DNAT info at:
> > http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATT
> >ARGET where he explains the problem and the solution, if you need to
> > allow=3D20 access from the local network or firewall.



