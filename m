From: "" <kfm@plushkava.net>
Subject: Re: nftables equivalent for iptables -m recent
Date: Mon, 20 Jan 2020 20:29:50 +0000
Message-ID: <5aa1a916-0bc3-80cd-efd5-b0d5ce0c3af3@plushkava.net>
References: <kcEE.pOI45menO0OHYgWymsen8Q.gO9QrKDP1QE@exchange64.corp.itserv.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=f
        gdwOHMJ3AW8Y1T8f4A3IIHo8ddACpwNcT4WqR71Qpg=; b=VT6IMc/tKQoXxk2f3
        x+Yfe7Ds6ebixs46SU8SU78BDkObEWV8tFXKXZDWBDLxbTA9FeHjRo+/YEHaz0V+
        o9RVA1M/zjayUzX8vxhYBOPfe/AUrYQpv1fB3wlI6ExQuXguuHfnHjGTcXCc2PF3
        J5ZG0bX5wcrAgqnTHPJ8MA9bh1DMyuDNzCwRTyFqjMUHuA+X5qWYFLWeLASMpJlH
        tt5OK/iOms9hm3raP7oAXPIyPlU8JVcFf57VYCBD5X4YDmu2ccIpbhKyiYIdp+Cz
        C0jyHXfpo/boNuo32ELOzQEbLIUKuFfLxV1gPTn6JAekujv5wNt1bJpu48PHLG2H
        7aVVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=fgdwOHMJ3AW8Y1T8f4A3IIHo8ddACpwNcT4WqR71Q
        pg=; b=HiXiN+q2DF1S+AeiuXgOiTiiSFAHUkBEtXAn67clCJAdRtR77ih4ntNVg
        AWiKzCyGF7aOA92cdMC7ZW8SLGr11Q9xXNUci80c/On7R2Da0XYzrTDY8TwamoXQ
        gYGGD0ct5J4W4krAqBzD39mSWMH+1jdy+CuzoqxMU5WA7yRfVCrWOrcAoQyvlITc
        yYLMY10ntEMHLFpsycVXwWKFPQgnOhohunLXEdc2W5FqXpSChDJ4UnbJQg+s5VTq
        89yXfB45ewmCUzzKnqD/I12AJqUfumORjLA/HU4bKdGpE/hoiof+YMzVeG67PGL2
        u2dyNz2gpLYHdLdBAeFD5fJoYCiXg==
In-Reply-To: <kcEE.pOI45menO0OHYgWymsen8Q.gO9QrKDP1QE@exchange64.corp.itserv.de>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 20/01/2020 14:48, Sig Pam wrote:
> Hello, world!
>=20
> I'd appreciate your help with the following issue on my Debian 10 with co=
nverting the ruleset from iptables to nftables.
>=20
> I'm using iptables to blacklist incoming packets for a short while. If so=
mebody tries to scan my host, his IP address gets blacklisted for ten minut=
es.
>=20
> The following rules are in use:
>=20
> [=85]
> iptables -A Enemies -m recent --name psc --update --seconds 600 -j DROP
> iptables -A Enemies -i eth0 -m tcp -p tcp --dport 1:21 -m recent --name p=
sc --set -j PORTSCAN
> iptables -A Enemies -i eth0 -m tcp -p tcp --dport 23:24 -m recent --name =
psc --set -j PORTSCAN
> iptables -A Enemies -i eth0 -m tcp -p tcp --dport 26:79 -m recent --name =
psc --set -j PORTSCAN
> [=85]

This should do it:

table ip filter {
	set enemies {
		type ipv4_addr
		flags dynamic
		timeout 10m
	}

	chain portscan {
		iifname "eth0" tcp dport { 1-21, 23-24, 26-79 } \
			update @enemies { ip saddr }
		iifname "eth0" ip saddr @enemies log drop
	}

	# ...
}

See=20
https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_pa=
cket_path.

--=20
Kerin Millar <kfm@plushkava.net>
