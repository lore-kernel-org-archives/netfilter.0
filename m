From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: learning to understand iptables
Date: Wed, 3 Nov 2021 23:40:36 +0000 (GMT)
Message-ID: <28f6755f-a9e1-8ab5-3253-47bd9bbc76f8@jubileegroup.co.uk>
References: <b4aec750-bbeb-eb72-33f6-01d1e64c6949@sunrise.ch> <85e869fc-bded-c41-db86-91dfbcf5de@jubileegroup.co.uk> <cf3ef7ac-41b2-7c89-9de5-6ad2dfc5f6fd@sunrise.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463810772-1870834766-1635982838=:2774"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cf3ef7ac-41b2-7c89-9de5-6ad2dfc5f6fd@sunrise.ch>
List-ID: <netfilter.vger.kernel.org>
To: serando <serando@sunrise.ch>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463810772-1870834766-1635982838=:2774
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi there,

On Wed, 3 Nov 2021, serando wrote:

> ...
> The iptables configuration is as follows:
>
> $ sudo iptables -L
> Output:
> Chain INPUT (policy ACCEPT)
> target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
>
> Chain FORWARD (policy ACCEPT)
> target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
>
> Chain OUTPUT (policy ACCEPT)
> target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
>
>
> I have read that with this configuration, my browser only accepts data fr=
om=20
> the Internet, if it has requested the data. This means that all packets t=
hat=20
> the browser has not requested are dropped.

I doubt that you have read that.  It is wrong.  Your remaining questions are
based on an assumption which is false, and therefore need no answer.

You really should read some of the documentation which I mentioned in
my previous reply to you.

--=20

73,
Ged.
---1463810772-1870834766-1635982838=:2774--
