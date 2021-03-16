From: "etkaar" <lists.netfilter.org@prvy.eu>
Subject: Re: How to concatenate subnet with port in a =?UTF-8?Q?set=3F?=
Date: Tue, 16 Mar 2021 16:52:44 +0100
Message-ID: <5q7dypqy7.NZGfjm@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=prvy.eu; s=20180701;
        t=1615909964; bh=VvkhojVRsq+qrpO3GDwwt5ZyL1KkyzdvZRWHXtKtjF4=;
        h=Date:From:To:Subject:From;
        b=B5BnC3SDeDXgT63s4x/4ljrdwBej1kRC9xb3SFJqMcN1zCocC/UEvyx6dFVubSd38
         l9z/tq+qSuZDlOLw6AKXfzzVS8KbWOZF9KqB84ElWP1mMgymZwn6k86MsRwGheg0UC
         U+qMHD2c0zZFWm3sIHiLsm8N+KXu2RkFJfIBKwxEkQUj8uBfUyxtPrttTGiC895/Uc
         JrNlvaYAXrZ1xVsZRNd14U/PvAsyO3BBVTnN1thVVuYjGgnn0bLyxR6ohYiQHU7fPP
         CqMEw8M69IE9IV6QziSSdyfxAPM9ciCSMAuMrXr4L2OLhucbZ9My5b/puKQ6XIaShE
         LsEsz8XtBAuFg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Sorry, the code was unprettified in my initial email:=0A=091> set whitelist=
_ipv4_tcp {=0A=092>=C2=A0 =C2=A0 =C2=A0type inet_service . ipv4_addr=0A=093=
>=C2=A0 =C2=A0 =C2=A0elements =3D {=0A=094>=C2=A0 =C2=A0 =C2=A0 22 . 255.25=
5.255.255,=0A=095>=C2=A0 =C2=A0 =C2=A0 22 . 255.255.255.0/24=0A=096>=C2=
=A0 =C2=A0 =C2=A0}=0A=097> }=0A--etkaar=0A=0A

