From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: New rule impact
Date: Thu, 04 May 2006 14:17:30 +0000
Message-ID: <1146752250.2644.9.camel@davila.nicaraguaopensource.com>
References: <5DCE1CDE91978540A3092DA869CF7F8AB17729@exchange01.intranet.abilis.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5DCE1CDE91978540A3092DA869CF7F8AB17729@exchange01.intranet.abilis.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Filipe Mordhorst <filipe.mordhorst@abilis.com.br>
Cc: netfilter@lists.netfilter.org

With the string match you can not be sure that the string that you want
compares is encapsulated in a single packet, then that mechanics does
not work well if you want block some URLs.

I don't know what you want but if you want block http traffic maybe is
better for you squid.

Hope this help.

Jorge.=20

El mi=E9, 03-05-2006 a las 14:46 -0300, Filipe Mordhorst escribi=F3:
> Hello everyone,
>=20
> I was searching the net (including google) for the best way to take a
> measurement for additional processor requirement and additional overhead
> when adding a specific rule.
> The fact is that I=FFm starting to work with the string match. A already =
know
> how to implement it, but I need to know how it will affect my environment.
>=20
> Thanks for now
>=20
> Best regards,
> ----
> Filipe Mordhorst =20
> Brasil - SC
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20


