From: "Jerry Robles de Medina" <jroblesdemedina@godo.sr>
Subject: RE: Bypass transparent proxy(Squid)
Date: Thu, 1 Apr 2004 08:04:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040EAEDD7A465C4AA0350CB69A326D550C3943@backup2.GODO-2000>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Thanks Anthony,
Have you done this already in a situation?
I'll try it out and let the list know how it went.
Jerry

-----Original Message-----
From: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: March 31, 2004 4:23 PM
To: netfilter@lists.netfilter.org
Subject: Re: Bypass transparent proxy(Squid)

On Wednesday 31 March 2004 7:29 pm, Jerry Robles de Medina wrote:

> Dear all,
> I have read somewhere along the posts that it is possible to let 2 =
pc's
> (ip's) bypass a transparent proxy server(squid cache). I have tried it =
in
> the rc.firewall.up file but I cannot get it working. Can someone =
please
> shed some light into my problem?I know it has to do with iptables but =
dunno
> where and how.

The trick is to create a user-defined chain, match the addresses you =
want as=20
exceptions, then do the NAT at the end of the chain (after the =
exceptions=20
have been returned to the main chain).

Something like:

iptables -N mychain
iptables -A PREROUTING -t nat -p tcp --dport 80 -j mychain
iptables -A mychain -t nat -s a.b.c.d -j RETURN
iptables -A mychain -t nat -s w.x.y.z -j RETURN
iptables -A mychain -t nat -j DNAT --to my.squid.proxy.server:3128

The way this works is:
1. Only packets addressed to port 80 get processed by the user defined =
chain
2. The first exception source address a.b.c.d immediately returns =
(unchanged)=20
the to main PREROUTING chain.
3. The second exception address w.x.y.z returns to the main PREROUTING =
chain.
4. Any other addresses get redirected.

I'm sure you can adjust this to your own requirements now you see the =
trick=20
involved.   The important point is to recognise that the negation =
operator !=20
cannot deal with more than one exception address, so there's no point =
trying=20
to force it to work.

Regards,

Antony.

--=20
The words "e pluribus unum" on the Great Seal of the United States are =
from a=20
poem by Virgil entitled "Moretum", which is about cheese and garlic =
salad=20
dressing.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



