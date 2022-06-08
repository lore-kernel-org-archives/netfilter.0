From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 8 Jun 2022 14:34:05 +0000
Message-ID: <0102018143bca3f1-ec4843ce-f6b1-464b-a9c6-ccd61b399815-000000@eu-west-1.amazonses.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> 
 <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com> 
 <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com> 
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com> 
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> 
 <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com> 
 <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com> 
 <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com> 
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com> 
 <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com> 
 <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org> 
 <mail.629aff89.73ff.3ae87c7606a48613@storage.wm.amazon.com> 
 <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com> 
 <4df0f9c3-5617-e798-56d9-d24725250906@thelounge.net> 
 <efe54ba7-fca1-e95-2ded-d83c5e144987@netfilter.org> 
 <mail.629b6720.3649.7e2693125cedf4ea@storage.wm.amazon.com> 
 <010201812f0adc45-929753b5-ff42-41a8-a922-fdb605cde46f-000000@eu-west-1.amazonses.com> 
 <eef7aaa0-e8f4-2672-956b-47ec49547b33@netfilter.org> 
 <mail.62a0b35b.5c1c.42faef732ab2e9b5@storage.wm.amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654698845;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
        bh=spMIexatp0FgyKRThECsOyBYgYI4eK71IUnptyOpEYc=;
        b=IiBQoh7YSm5gCR0j/59yDprqFYcr2u4R0FyP9lHAOUgyvAA3WlEaZN7idonEK51m
        2uRNzgcD/sjKlw8FIWLZ9tdxJH7zNYY8wd4i9yzy4QPg7DIy04+OXyCwWKf9EpJM6LS
        him2ojAjAlExpjA3o/Uc9cwknDe9QVGK7L8IeB2A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654698845;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
        bh=spMIexatp0FgyKRThECsOyBYgYI4eK71IUnptyOpEYc=;
        b=tJFcErACVeb+igc7mpt3MtqAJq1oHqb0/lPXFz+e0MvqZSvSjn4ZUh0tXoLdz7Um
        fah6WDzMq7NYxRL2gglsfS+JLTpweHMjtHhsmWcKVskuqZUPZS2DPsEkFO16/UiBkbD
        KUfKZhPy0i6mrfAyGgv566GjilIkgnKOROIRdbNc=
In-Reply-To: <eef7aaa0-e8f4-2672-956b-47ec49547b33@netfilter.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?Jozsef_Kadlecsik?= <kadlec@netfilter.org>
Cc: =?UTF-8?Q?Reindl_Harald?= <h.reindl@thelounge.net>, =?UTF-8?Q?Alex_Buie?= <alex.buie@datto.com>, =?UTF-8?Q?netfilter=40vger=2E?= =?UTF-8?Q?kernel=2Eorg?= <netfilter@vger.kernel.org>

> The mask is unconditionally applied to the IP address.=0D=0A=0D=0AYes. =
Note again that it is unconditionally applied by other programs too, yet =
they do not discard the full ip address. When I use 10.0.0.2/24 in the "A=
ddress=3D" keywork of a systemd-networkd configuration, then the the mask=
 is used to compute a prefix route (which is automatically added if not o=
therwise declared). Yet the full Ip address is kept, and assigned to the =
nic. My point is that I (as a beginner) would have thought iptables is "s=
mart enough" to figure out that when I submit 10.0.0.2/24 instead of 10.0=
=2E0.0/24, then I actually mean 10.0.0.2, and that the additional informa=
tion that 10.0.0.2 is part of a network 10.0.0.0/24 would be discarded.=0D=
=0A=0D=0A> Please note, we support non-continuous netmasks too.=0D=0A=0D=0A=
Interesting, I didn't know and had to look up what that is.=0D=0A=0D=0A> =
When specified, the mask always applied to the network IP address part be=
fore processing the rule.=0D=0A=0D=0AHow about=0D=0A=0D=0A> When specifie=
d, the mask is always applied to the IP address before processing the rul=
e, and the masked-out part of the IP address is subsequently ignored (or =
"discarded" instead of "ignored").=0D=0A
