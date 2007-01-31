From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connect to localhost bound port from outside?
Date: Thu, 01 Feb 2007 00:01:48 +0100
Message-ID: <45C11FDC.4030908@plouf.fr.eu.org>
References: <eppgne$mc1$1@sea.gmane.org>	<45C06BE7.2080208@plouf.fr.eu.org>	<45C0B772.2090201@riverviewtech.net>	<45C0BDDE.2030905@plouf.fr.eu.org>
	<45C0E06F.3080405@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C0E06F.3080405@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor a =E9crit :
>=20
>>> I have often considered using lo for local only but using dummy as a=20
>>> spur network to bind services to and then route traffic in to the=20
>>> spur network.  Thoughts / Opinions?
>>
>> A dummy interface is a black hole, a kind of "/dev/null" interface,=20
>> traffic you route to it is lost. This is very different from a=20
>> loopback interface, whose traffic you route to it loops back and is=20
>> received by the local host. It is fine to use a dummy interface if you=
=20
>> want to add an extra address to the host and bind services to it, but=20
>> I guess you could do the same with the loopback interface.
>=20
> I beg to differ.  Loop back is ONLY for the local host.  However, Dummy=
=20
> is not only for local host.  Dummy is *usually* used for local host=20
> only, however this is not an kernel enforced limitation.

So far, we both agree that loopback and dummy interfaces are very=20
different. :-)

> Dummy network=20
> is akin to a network card that does not talk to any thing else.

You can remove "else". A network card that does not talk to anything.

> I.e. if=20
> I put a loop back plug in an ethernet card so that it sees its self UP=20
> and UP (Cisco terms).  Then I can configure any computer to access the=20
> dummy network VIA the computer that dummy is on.

Yes. But actually you access nothing but void.

> To verify this, I just brought my dummy net up with a 192.0.2.254 IP=20
> address.  I then went to my Windows VM session and added a route to the=
=20
> 192.0.2.x/24 network via my Linux host.  My Windows VM was able to ping=
=20
> the 192.0.2.254 IP address on the dummy network.

Yes, but doing this you do not access the dummy network. You just access=20
the dummy interface _address_ like any other address owned by that host.=20
The dummy interface nevers sees that traffic. You could do the same just=20
by adding that address to any other interface, including the loopback=20
interface lo.

> With this in mind, if the dummy network is used to bind services to, it=
=20
> would be possible to DNAT traffic destined to the local system in to th=
e=20
> dummy network with out being stopped the way that loop back does.

I am not sure I get what you mean... Maybe an example would help.

> Now, what I'm not sure about is if it would be possible to not use lo=20
> but use dummy in place of it.  I.e. lo is down and down with dummy up=20
> and up with 127.0.0.1 on it.

Hmm... You don't want lo to be down, else the host cannot communicate=20
with itself any more.

> In this case I don't know if you could=20
> DNAT traffic in to 127.0.0.1 from external or not.  And as I write this=
,=20
> I think that this may be more of a problem with routing than interface.=
=20
> If it is the routing code that says the only thing that can speak to=20
> 127.x.y.z/24 is 127.x.y.z/24 then this will do no good.

The routing code does not say that only 127.0.0.0/8 (not /24) can talk=20
to 127.0.0.0/8. Actually any address allocated to any interface on the=20
host (which I call a local address) can talk to 127.0.0.0/8 and=20
conversely. The routing code says that you can talk to or from=20
127.0.0.0/8 only through the loopback interface. So giving 127.0.0.1 to=20
another interface won't help.

> One thing that I do see as an advantage of using dummy in this way is=20
> that it would be possible to bind services to the dummy IP which would=20
> cause traffic destined for public services to pass through the=20
> filter:FORWARD table / chain.

Huh ? Traffic destined to a local service goes through the INPUT chain,=20
not the FORWARD chain. Whether the IP address you bind the service to=20
belongs to a loopback interface, a dummy interface or any other=20
interface does not make a difference. All local addresses belong to the=20
host and create a local route in the special "local" routing table.

