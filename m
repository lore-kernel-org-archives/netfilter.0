From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Empirically determined limits on identifier name length
Date: Wed, 23 Aug 2017 19:24:55 -0400
Message-ID: <20170823192455.4d7ed8f3@playground>
References: <0628e05b-00cb-0135-3ffc-c44dcb4634b3@wagsky.com>
        <0ea79422-035e-6a2a-d416-937f32615e89@wagsky.com>
        <7c9cc6db-30be-5b89-7030-5ea3bec04c8b@wagsky.com>
        <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v7NNOwQd002834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1503530698; i=@wpi.edu;
        bh=6G4rGp9rSV+9YuhJyP7j6Am3txmyZoIw48uX8/74yI0=;
        h=Date:From:To:Subject:In-Reply-To:References;
        b=aZWpTPtZEVaALh/hnq/kar6kqBOk1dTHoF9whXHMvMGAxBDFh4vdfZJ40PopUV7S8
         OW3+dUHoFx9r7cBp5x3WWg5uhBiAoxz9m3J7Uv4qUiNRNTsqboS8a40cas4yKSFX75
         QcCC1aYJBHo/hS1SL+WqunV8LPxajTeJuIz62s3Y=
In-Reply-To: <015d67fd-4453-66df-c4c9-78a17bcbbdd3@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

With respect to the 'long' identifiers, is it possible that the code reads =
only so much of the 'token', then reads (treats) the rest of it as the next=
 'token'? I think I encountered something like this recently in something (=
but not nftables). If this is the case, it could explain the 'numeric range=
' error....

Should the code should use a global identifier length so they all have the =
same length limit (if it doesn't already)?

N


On Wed, 23 Aug 2017 14:58:23 -0700
Jeff Kletsky <jmk@wagsky.com> wrote:

> At least working with the HEAD version of nftables v0.7, current library=
=20
> versions, and kernel 4.9,
> the limits on identifier length that I have determined empirically (I=20
> have not examined the code):
>=20
> * chain, set -- 31 characters
> * table -- (not examined, but *guessing* 31 characters as well)
>=20
> * define -- limit in excess of 65 characters
>=20
> The error message when the limit is exceeded for the "in-kernel" chain=20
> and set identifiers is similar to
>=20
>  =C2=A0=C2=A0=C2=A0 nftables.conf:3:1-14: Error: Could not process rule: =
Numerical=20
> result out of range
>  =C2=A0=C2=A0=C2=A0 flush ruleset
>  =C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^
>=20
> where the line identified has nothing to do with the offending identifier
> (it is the first "actionable" statement of the file)
>=20
> HTH someone else
>=20
>=20
> Jeff
>=20
>=20
>=20
> ~/build/nftables$ git log -1
> commit d74eed8c9649e9278b69f2cd0fd92f71e3e19cfb (HEAD -> master, tag:=20
> 2017-08-19, origin/master, origin/HEAD)
> Author: Varsha Rao <rvarsha016@gmail.com>
> Date:=C2=A0=C2=A0 Wed Aug 16 19:48:17 2017 +0530
>=20
>=20
> ~/build/libmnl$ git log -1
> commit fbe0f33b45abd585eb9f52cb56d751a750667dc6 (HEAD -> master, tag:=20
> 2017-08-19, origin/master, origin/HEAD)
> Author: Guillaume Nault <g.nault@alphalink.fr>
> Date:=C2=A0=C2=A0 Wed Aug 3 12:52:34 2016 +0200
>=20
>=20
> ~/build/libnftnl$ git log -1
> commit d58998312375de0865091cfc5d00ddd271d9a44c (HEAD -> master, tag:=20
> 2017-08-19)
> Author: Eric Leblond <eric@regit.org>
> Date:=C2=A0=C2=A0 Thu Jul 6 13:58:27 2017 +0100
>=20
> (my libnftl is presently two commits behind origin/master)
>=20
>=20
> kernel 4.9.28-38
>=20
>=20
>=20
>=20
> $ cat nftables.conf
> #!/usr/sbin/nft -f
>=20
> flush ruleset
>=20
> table inet global {
>=20
>  =C2=A0=C2=A0=C2=A0 define=20
> identifier123456789212345678931234567894123456789512345678961234. =3D one
>  =C2=A0=C2=A0=C2=A0 define=20
> identifier123456789212345678931234567894123456789512345678961234_ =3D one
>=20
>=20
>  =C2=A0=C2=A0=C2=A0 chain prerouting12345678921234567893. {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook prerouting p=
riority -175
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 chain prerouting12345678921234567893_ {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook prerouting p=
riority -50
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 set identifier12345678921234567893. {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type inet_service
>  =C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0 set identifier12345678921234567893_ {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type inet_service
>  =C2=A0=C2=A0=C2=A0 }
>=20
> }
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

