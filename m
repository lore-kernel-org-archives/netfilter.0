From: alexb@atix.com.br
Subject: Re: QoS on dynamic port allocation protocols
Date: Thu, 13 Mar 2003 10:40:53 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047562853.3e708a65c21a5@www.spsul.com.br>
References: <OFA83BF598.09B2B5B9-ON83256CE8.000228A8@LocalDomain> <1047533324.11445.64.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1047533324.11445.64.camel@raylinux.internal>
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
To: raymondl@knowledgefactory.co.za
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

But how do I distinguish RELATED connection from ftp and H323 ?
If I only whant to limit bandwidht for ftp and not for H323, how could I te=
ll
iptable to mark only the RELATED packets from ftp connections ?

Thanks,

Alex

C=F3pia Raymond Leach <raymondl@knowledgefactory.co.za>:

> On Thu, 2003-03-13 at 03:09, Antonio Paulo Salgado Forster wrote:
> > Hello all,
> >=20
> >       I'm trying to apply QoS rules on protocols that use dynamic
> port
> > allocation on secondary connections such as ftp or H323 that have a
> > specific iptables helper to handle them, and the problem begins when
> the
> > secondary connections startup.  Would the connmark module mark also
> the
> > seconday connections if you tells it to mark the main flow?  Or, is
> there
> > any way to to match a packet using, at the same time, the -m state
> --state
> > RELATED match and check if the related connection belongs to a ftp
> session?
> >=20
> > Any ideas are appreciated. Thanks in advance.
> >=20
> > Forster
>=20
> Depending on your QoS setup, you could use the -m state --state
> RELATED
> and the fwmark patch to mark the packets. Then your QoS filters could
> be
> triggered by the fwmark values.
>=20
>=20

