From: Guillaume Morin <guillaume@morinfr.org>
Subject: Re: "unclean" ?bug? with dell dns
Date: Mon, 9 Sep 2002 22:40:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909204032.GA18977@morinfr.org>
References: <20020827025542.A15684@yannick.lesaint> <20020828132419.GC21410@morinfr.org> <200209091948.1734@ellinger.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200209091948.1734@ellinger.de>
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
To: Rainer Ellinger <rainer@ellinger.de>
Cc: Yannick Le Saint <y.lesaint@free.fr>, netfilter@lists.netfilter.org

Hi Rainer,

Dans un message du 09 sep =E0 20:27, Rainer Ellinger =E9crivait :
> investigation with ethereal showed that matching pakets had their udp=20
> crc set to 0x0000. My questions are:=20
>=20
> Should this condition really considered harmful and matched by unclean?

No, that's a bug. I'll submit a patch for that.

> Why is there no corresponding log message from the unclean module?

The consensus is that for a simple checksum error a log message is not
needed.=20

Regards,

--=20
Guillaume Morin <guillaume@morinfr.org>

        Justice is lost, Justice is raped, Justice is done. (Metallica)

