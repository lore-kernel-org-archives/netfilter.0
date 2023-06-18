From: public1020 <public1020@proton.me>
Subject: Re: Modify packet without NAT
Date: Sun, 18 Jun 2023 14:34:31 +0000
Message-ID: <Yx2SfoKfezY0BYo1HR62Qk9XK3cFc2OmDz23H29qQEJiSjDuWurALweCqK8aup09tG3q59mUU6_8UFBYCXMC3Y3GMQsqvqhiBaFgYVGZDQY=@proton.me>
References: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me> <68081ede-21a0-48be-aecc-d959f317bcb5@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1687098883; x=1687358083;
        bh=d6Ssqi9omyk5ONURmhQZCmr8DvyeM+Vf1vwsRZcN+Xk=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=lrGM6asRbY9vaAzYD7+jyNFBTz0FgfX+6ztmN/PXvIJxJo/KvKgW5Wj9aMT27ztDl
         gy/MbbIgGe0ROGBJoz+/HDBgoHAk18rvkr6iNW46rQxkQgCqOtMrL7BamO6mE3qzUh
         9JSkBpW418NjKFrkfyjjc0OBNMK81Wey6BlAIvBZAu7nLGwsm7ymZH57xrHrBpercE
         ADqiTT2bMFzqccwqwql0RdlZa2MOszAPgHnblMAKf+CuwH2/QGN0U0XYjQMK/GU+JN
         mZIP4mFAzmRy7vtUZ51pU+AVQ0uVNf8lIbBBjbYEazm4xkVES6LlnjwEgJRIF4pikL
         YlcVuqKNXgkzQ==
In-Reply-To: <68081ede-21a0-48be-aecc-d959f317bcb5@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The system is IPv4 and intranet only, suppose I'm going to increase the has=
h size,=20

1. What is the potentially maximum size needed?
2. How much kernel memory is needed accordingly?

------- Original Message -------
On Sunday, June 18th, 2023 at 5:14 PM, Reindl Harald <h.reindl@thelounge.ne=
t> wrote:


>=20
> Am 17.06.23 um 05:22 schrieb public1020:
>=20
> > I have a simple nat configuration to forward certain access to a gatewa=
y:
> >=20
> > iptables -t nat -A PREROUTING -p tcp -m set --match-set http_port dst,d=
st -j DNAT --to-destination XXX:80
> > iptables -t nat -A POSTROUTING -j MASQUERADE
> >=20
> > Can I do that without nat? Just trying to avoid the "conntrack table fu=
ll" issue.
> > Is there a non-stateful solution?
>=20
>=20
> conntrack don't depend on NAT at all but nearly any useful setup depends
> on conntrack
>=20
> i can't think of a useful ruleset without RELATED,ESTABLISHED rules and
> ctstate is conntrack
>=20
> in other words: without explicit "CT notrack" in the RAW-table there is
> always conntrack
>=20
> fix your config instead trying to work aorund it
>=20
> [root@firewall:~]$ cat /etc/modprobe.d/iptables-conntrack.conf
> options nf_conntrack hashsize=3D524288 expect_hashsize=3D2048
