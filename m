From: "Samir Bellabes" <samir.bellabes@wanadoo.fr>
Subject: RE: Routing Question
Date: Thu, 8 May 2003 23:24:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HOEOKDEMFDBAJNCHMDBHMEEOCBAA.samir.bellabes@wanadoo.fr>
References: <1052328525.25094.202.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052328525.25094.202.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

hi all,
you also need to have
echo "1" > /proc/sys/net/ipv4/ip_forward
in the firewall box

samir bellabes

-----Message d'origine-----
De : netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]De la part de Joel Newkirk
Envoy=E9 : mercredi 7 mai 2003 19:29
=C0 : Chris Hoeschen
Cc : netfilter@lists.netfilter.org
Objet : Re: Routing Question


On Wed, 2003-05-07 at 12:46, Chris Hoeschen wrote:
> I am wondering if it is possible to route from one host to another
> host.  An example would be if I wanted to route all traffic on port 80
> to another complete different IP address on the internet (like
> google.com.)
>
> My goal is to reroute traffic coming in to one host to a different
> host without having to give out the IP address of the second host.  If
> I just change the DNS the IP address would be known to the person
> accessing the site.

If you, for example, wanted all connections to 10.10.10.1:80 to be
'rerouted' to actually connect to google.com, you'd use:

iptables -t nat -A PREROUTING -d 10.10.10.1 -p tcp --dport 80 -j DNAT
--to 216.239.35.100

This presumes that the connection in question would be allowed through
FORWARD, and that it is not to another local resource.  If you are using
DNAT and the new destination has a route back to the client that doesn't
pass through your firewall box, you need to also add:

iptables -t nat -A POSTROUTING -d 216.239.35.100 -p tcp --dport 80 -j
SNAT --to a.b.c.d

Where a.b.c.d is the IP of the interface the DNATted traffic passes out
through.  (IE, ppp0)  This way the reply traffic is forced to come back
through the DNATting box, which will reverse both the SNAT and the DNAT,
so that the client sees the reply from the expected 10.10.10.1.

j


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> | Chris Hoeschen - Distributed System Analysts        |
> | PrimeVest Financial Services                        |
> | (320) 656-4035 E-Mail: chris.hoeschen@primevest.com |
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> "Only two things are infinite, the universe and human stupidity, and I'm
not sure about the former."
>   -- Albert Einstein
> Hippopotomonstrosesquippedaliophobia is the fear of long words
>





