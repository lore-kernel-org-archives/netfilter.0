From: "Franck ZOCCOLO" <franck@zoccolo.com>
Subject: RE : Some webpages inaccessible through IPTables
Date: Sat, 8 Feb 2003 16:58:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c2cf8a$fb5bf760$fd42a8c0@zoccolo.com>
References: <20030208153456.424A223F1C@www.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030208153456.424A223F1C@www.fastmail.fm>
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

> -----Message d'origine-----
> De : netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] De la part de Sven Bolt
> Envoy=E9 : samedi 8 f=E9vrier 2003 16:35
> =C0 : Kevin McConnell; netfilter@lists.netfilter.org
> Objet : Re: Some webpages inaccessible through IPTables
>=20
>=20
> No ECN is not enabled in the kernel. The sites are accessible from the
> gateway itself so it's not an MTU issue. What else could it be?
You're wrong... THIS is an MTU issue... I bet you're using PPPoE to
connect to the internet. This problem should be handled by MTU path
discovery, but some stupid network administrators are blocking all ICMP
packets, and MTU path discovery uses ICMP to do its job.

Try lowering the MTU of your client hosts to 1492, and you'll be able to
browse the sites you cannot access for now.


