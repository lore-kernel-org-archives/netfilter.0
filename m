From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Conntrack rule timeout problem
Date: Wed, 23 May 2007 18:27:55 +0200
Message-ID: <46546B8B.9040705@freemail.hu>
References: <1179765250.12001.18.camel@thales.lan>	
	<465437E1.9030600@freemail.hu>
	<1179927731.28690.16.camel@thales.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1179927731.28690.16.camel@thales.lan>
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
To: Pat Riehecky <prieheck@iwu.edu>
Cc: netfilter@lists.netfilter.org

Pat Riehecky =EDrta:
> I am about 90% certain that I am not being scanned as a bunch of the
> dropped packets are coming from places like the New York Times,
> Microsoft, and Google.  Admittedly they could be spoofed IP addresses.
> but the packets are all coming from 80 or 443 and they are all destined=

> for TCP Ports in the ephemeral range.  Additionally in my squid logs I
> have a corresponding entry requesting data from that server.
>
>  =20
Well... Read this:

http://www.hackinthebox.org/modules.php?op=3Dmodload&name=3DNews&file=3Da=
rticle&sid=3D10640&mode=3Dthread&order=3D0&thold=3D0

The interesting part starts at *"Camouflaging your ip address"...*
> All evidence I have points to some sort of conntrack timeout.
> Occasionally I can find the IP addresses in the output from iptstate,
> but...=20
>
> Thanks for the ideas, any chance for more theories?
> Pat
>  =20
Swifty


