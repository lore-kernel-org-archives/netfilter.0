From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: nf_conntrack_sip regression?
Date: Sun, 9 Oct 2016 05:55:18 +0200
Message-ID: <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Le 09/10/2016 =E0 02:19, Joerg Dorchain a =E9crit :
> Hello,
>=20
> I am having a problem with iptables rules that used to work with
> kernel 4.6, but does not anymore with 4.8 (I think I skipped 4.7)
>=20
[...]
>=20
> This input rule used to match incoming rtp packets when initiating
> a sip call from the local asterisk, but now it does not match
> anymore.
>=20
> Did something change with netfilters?

There was this dmesg log for long: "nf_conntrack: automatic helper
assignment is deprecated and it will be removed soon. Use the iptables
CT target to attach helpers instead."=20

> Is this supposed to work at all?
> What other concept would work for this setup?
>=20
> Thanks for a hint,

I think that's the answer to the problem:
https://www.spinics.net/lists/netfilter/msg56874.html

>=20
> Joerg
>=20

Regards,
Adel
