From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables returns "module is wrong version"
Date: 28 Jan 2005 20:12:51 +0100
Message-ID: <1106939570.11290.11.camel@nostromo.bgsecm.com>
References: <r02010100-1037-5F0466BA715F11D998C6000A95DF6F1E@[192.168.1.112]>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <r02010100-1037-5F0466BA715F11D998C6000A95DF6F1E@[192.168.1.112]>
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
Content-Type: text/plain; charset="utf-8"
To: Kurt Yoder <ktynetfilter@richard-group.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 28 de 01 de 2005 a las 20:04, Kurt Yoder escribi=C3=B3:
> Thanks for your help so far!
>=20
> I understand that I need to compile iptables with the same patches as
> the iptables kernel module, but I'm still not sure how to determine
> which patches the kernel module has. I see a bunch of files in the
> kernel lib directory, and another different set in the iptables lib
> directory. Is the different list of files sufficient to tell me which
> patches I should apply to iptables?

Patch-o-matic patches at the same time the kernel sources and the
iptables sources. You can try to patch a "fake" source from your
kernel so the iptables get patched with the same modules, but I
can't tell you if that would solve your problem.

Regards.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


