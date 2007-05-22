From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT addresses - RFC or tradition?
Date: Tue, 22 May 2007 15:22:50 -0500
Message-ID: <4653511A.5020205@riverviewtech.net>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
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

On 05/22/07 14:26, Paul Blond=E9 wrote:
> I've noticed that a lot of people use the 192.168.X.X subnet for=20
> internal networks, is this (and the less-used 10-series) a=20
> requirement of some RFC, or a recommendation that has become=20
> tradition?

10.0.0.0-10.255.255.255, 172.16.0.0-172.31.255.255, and=20
192.168.0.0-192.168.255.255 are reserved for private (read internal) use=20
and guaranteed to not be globally routable.  As others have stated, you=20
can use any address you want, though you run the risk of being in=20
conflict with some subnet somewhere.  Granted it is VERY unlikely that=20
you will effect any one other than your self as the world will route to=20
the other subnet, not you.

Please reference RFC 3330 - "Special-Use IPv4 Addresses"=20
(http://www.rfc-editor.org/rfc/rfc3330.txt) for more information on=20
these and other reserved subnets.

> We are using a completely different subnet, something similar to (for=20
> example) 42.127.129.X to further obfuscate the internal network from=20
> outside. This, and many other examples, produces a class-A subnet=20
> mask (some produce a class-B) when entered in WinXP's TCP/IP dialog,=20
> although the actual mask we use with it is class-C.

*nod*

> Is this a no-no? Will it break our server's IPTables when=20
> communicating with it? Am I in for a lot of trouble? The addresses=20
> don't seem to cause any problems, but I don't want this to jump up=20
> and bite us in the bottom sometime down the road.

Well, the 42.x.y.z is not too bad as far as conflicting with someone=20
else seeing as how IANA has it "Reserved".  Take a look at the "Internet=20
Protocol v4 Address Space" page=20
(http://www.iana.org/assignments/ipv4-address-space) on IANA's web site=20
for more information.



Grant. . . .

