From: Guillaume Morin <guillaume@morinfr.org>
Subject: Re: QoS using HTB and SFQ ...
Date: Thu, 12 Dec 2002 11:06:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021212100624.GC23202@oyster.morinfr.org>
References: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1039684623.4085.47.camel@rayw.knowledgefactory.co.za>
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
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi Raymond,

Dans un message du 12 Dec =E0 11:17, Raymond Leach =E9crivait :
> Does anyone have any experience (good or bad) with using htb and sfq to
> do QoS using 2.4.20 kernels?
>=20
> I compiled the kernel, installed the image, but tc tells me that htb is
> an unknown qdisc. I checked that I did select htb in the QoS section.

You need an updated tc binary. Check out
http://luxik.cdi.cz/~devik/qos/htb/ and download htb3.6-020525.tgz which
contains the iproute2 patch.

Regards,

--=20
Guillaume Morin <guillaume@morinfr.org>

      A friend in need is a friend indeed. A friend who bleeds is better.
         My friend confessed, she passed the test. We will never sever.
                                   (Placebo)

