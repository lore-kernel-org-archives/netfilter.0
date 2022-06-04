From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Sat, 4 Jun 2022 14:07:29 +0000
Message-ID: <010201812f0adc45-929753b5-ff42-41a8-a922-fdb605cde46f-000000@eu-west-1.amazonses.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654351650;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
        bh=8170FLjTdpv3crltEfEeX4/K29eswYdMzyUvoX9cnrw=;
        b=he0fa9t87biA9iW19Wvsl3hySE1paoSAaD9T9nCrYHjGJ8A8PCTajkiQoC8wvc3w
        nKAli5+3en17nbXN+pos7b6FyPFQ8hnLcXpphuPlvMRQc1XmbEJnq5r+5pSl9Lx2lxT
        D1o5ABRUxhFTwGe/BKltJKy451AWlhdh9+Aw2lB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654351650;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
        bh=8170FLjTdpv3crltEfEeX4/K29eswYdMzyUvoX9cnrw=;
        b=BjCZkR+Kp5sSBOojUeieoKZP68e107yK35Nbu3s93OSe1OJoxcEBab8U0RyzDCaX
        5fNPncKXHa83gX46GeU8ymf7H4kf+XFhgB8N+mjsl4RQ57OH9ulpTQAqxB3bA1IYft0
        PgBoS33Mhc3uOnw+f1C6n9EzTjyZJCRmZAiHHRKM=
In-Reply-To: <efe54ba7-fca1-e95-2ded-d83c5e144987@netfilter.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?Jozsef_Kadlecsik?= <kadlec@netfilter.org>, =?UTF-8?Q?Reindl_Harald?= <h.reindl@thelounge.net>
Cc: =?UTF-8?Q?Alex_Buie?= <alex.buie@datto.com>, =?UTF-8?Q?netfilter=40vge?= =?UTF-8?Q?r=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

>> It seems people can come to wrong conclusions due to the syntax which =
is used at=20=0D=0Adifferent systems with different internal meanings. Th=
e feature cannot of=20=0D=0Acourse be changed, but maybe it'd worth to up=
date the documentation.=0D=0A=0D=0AI see, are you thinking of adding some=
thing like this to the manpage:=0D=0A=0D=0A-s --source address[/mask][,..=
=2E]=0D=0ASource specification. Address can be either a network name, a h=
ostname, a network IP address (with /mask), or a plain IP address. It can=
 also be a plain IP address with /mask, in which case the mask will be ap=
plied to the plain IP address to compute the associated network IP addres=
s. Note that in the latter case, the plain IP address is automatically re=
interpreted (i.e. modified or re-calculated) by the system as a network I=
P address.=0D=0A=0D=0AI think this would at least raise attention to a be=
ginner to be cautious. Also, I used the terms "modified" and "re-calculat=
ed" as synonyms for "reinterpreted". I get the impression this would be m=
ore agreeable to some users=3F=0D=0A=0D=0A=0D=0A
