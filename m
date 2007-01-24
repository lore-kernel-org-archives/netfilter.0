From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Pid owner module
Date: Wed, 24 Jan 2007 16:19:43 -0600
Message-ID: <web-4439882@bk3.webmaillogin.com>
References: <9772C290CD0BDF4B91356C9102BA886A0567BB66@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9772C290CD0BDF4B91356C9102BA886A0567BB66@ftrdmel1.rd.francetelecom.fr>
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
To: zze-FREDI POIROT N ext RD-MAPS-LAN <npoirot.ext@orange-ftgroup.com>, netfilter@lists.netfilter.org

May you want try a combination of DansGuardian and Squid.

Jorge.

On Wed, 24 Jan 2007 11:27:33 +0100
  "zze-FREDI POIROT N ext RD-MAPS-LAN" <npoirot.ext@orange-ftgroup.com>=20
wrote:
> Thanks for the answer !
>=20
> Do you have any idea/suggestion of how I could achieve such a filter ?=20
>(application-based filtering) ???
>=20
>=20
>=20
>=20
> -----Message d'origine-----
> De : netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] De la part de Pascal=20
>Hambourg
> Envoy=E9 : mercredi 24 janvier 2007 11:16
> =C0 : netfilter@lists.netfilter.org
> Objet : Re: Pid owner module
>=20
> Hello,
>=20
> zze-FREDI POIROT N ext RD-MAPS-LAN a =E9crit :
>> Jan 24 10:25:47 localhost kernel: ipt_owner: pid, sid and command=20
>> matching not supported anymore
> [...]
>> 3. Since which kernel version has this module been disabled ?
>=20
>Found in Changelog-2.6.14 :
>   [NETFILTER]: Remove tasklist_lock abuse in ipt{,6}owner
>=20
>   Rip out cmd/sid/pid matching since its unfixable broken and stands in
>   the way of locking changes to tasklist_lock.
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com

