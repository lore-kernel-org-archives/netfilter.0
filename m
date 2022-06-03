From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Fri, 3 Jun 2022 17:05:20 +0000
Message-ID: <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> 
 <010201812a366a81-2f2bc7f3-e142-4807-9742-bfa7b19dd468-000000@eu-west-1.amazonses.com> 
 <e2ba2738-2eff-3e97-a389-77abd17664dd@thelounge.net> 
 <mail.629a2dfb.57ab.496a0a414c9495b2@storage.wm.amazon.com> 
 <010201812a43a0d9-c4953858-f0e1-48db-a7a3-420d53a11cd7-000000@eu-west-1.amazonses.com> 
 <df64386a-5daf-6f97-3d37-b0c9b7c25537@thelounge.net> 
 <mail.629a3289.7fbb.1b2912350cfc7c1b@storage.wm.amazon.com> 
 <010201812a556c50-7856ee86-1a5a-4135-8acf-869a930d54c8-000000@eu-west-1.amazonses.com> 
 <768e4d99-0c50-01af-4434-20378c06a3cf@thelounge.net> 
 <mail.629a35d7.2a64.4a0b184f3a85fa1c@storage.wm.amazon.com> 
 <010201812a625427-9b51500d-3126-4b6f-95d0-d71702c349a7-000000@eu-west-1.amazonses.com> 
 <b6945516-3120-24f0-9990-294f1653c9a4@thelounge.net> 
 <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com> 
 <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com> 
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> 
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654275920;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
        bh=0h4w7708CjnZl1ocWHIJJft6uN+gz8h+w7e3Qi4e7G4=;
        b=EI3wMKWpJK4v3k1wvpXaJhuMLhewxuS4wEs9Bf9iaAUEV4k3hY5nZ6ams9jVpCuC
        gbe4yYvI7Nyc6CNyCtra98gU4nbU9Bm/+OxEdiiIC/nU64cOykuoqDjiLNzPieZw3aO
        GfWZ6WS91qetTZYB8NmvFWr9CtMBPV+oIx+QN3XA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654275920;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
        bh=0h4w7708CjnZl1ocWHIJJft6uN+gz8h+w7e3Qi4e7G4=;
        b=s61w9dErn0LFbfmrtJy50XW2iRgnsEeIelT9NnxcyRO5P1I280FSyycK+DfTQFLs
        Q/PT3oqv00ru+WFt4krsrIhd1c1P6iUCjU6U2PNezLt+2pI+EGpuwuE74qO0BYa2MAB
        BvhG8jSRUTUMMbtsAqP2XXwrod/vjPXoCxPyjis4=
In-Reply-To: <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>
Cc: =?UTF-8?Q?h=2Ereindl=40thelounge=2Enet?= <h.reindl@thelounge.net>

Sorry - I just realized I did not send the messages to the netfilter list=
, but replied to Reindl Harald directly. Harald patiently makes the point=
 that=0D=0A=0D=0A>> how do you expect your calculator "error out" when yo=
u type "1+3" but=20=0D=0Ameant "1+2"=3F=0D=0A=0D=0AI'm not sure I underst=
and the analogy, because 1+3 is correct and unambiguous input. Why would =
the program then invent a different meaningful input, say "1+2"=3F Instea=
d, 10.0.0.2/24 for the -s option is ambiguous (and I would argue incorrec=
t), because the correct inputs should have been=0D=0A=0D=0A10.0.0.0/24 (t=
hat's what iptables assumed I meant)=0D=0A=0D=0Aor=0D=0A=0D=0A10.0.0.2/32=
 (or equivalently 10.0.0.2)=0D=0A=0D=0AThe latter is what I actually mean=
t. I guess the question is, why does iptables re-interpret an incorrect (=
ambiguous) input, and not error=3F 10.0.0.2/24 makes no sense, right=3F P=
icking up the calculator analogy: if I open a python terminal, and type=0D=
=0A=0D=0AIn [3]: 3)4=0D=0A=0D=0Apython errors due to syntax error. It doe=
sn't just re-intepret it to '3+4' or '3-4'=0D=0A=0D=0AThanks again for yo=
ur patience!=0D=0A=0D=0A-----Original message-----=0D=0AFrom: Reindl Hara=
ld=0D=0ASent: Friday, June 3 2022, 6:42 pm=0D=0ATo: Stefan Riha=0D=0ASubj=
ect: Re: Possibly dangerous interpretation of address/prefix pair in -s o=
ption=0D=0A=0D=0AAm 03.06.22 um 18:36 schrieb Stefan Riha:=0D=0A> But it =
assumed that when I put in 10.0.0.2/24=0D=0A=0D=0Ayou braindead moron IT =
CALCULATED=0D=0A=0D=0A10.0.0.2/24 is for a computer similar to "1+2" for =
a human=0D=0A=0D=0A> I actually meant 10.0.0.0/24=0D=0A=0D=0Athen write i=
t=0D=0A=0D=0A> That's possibly dangerous=0D=0A=0D=0Aoperate a firewall as=
 beginner is in generall dangerous=0D=0A=0D=0A> because what I actually m=
eant was 10.0.0.2 (or equivalently 10.0.0.2/32).=0D=0A=0D=0Athen write it=
=0D=0A=0D=0A> As you said, it can't smell what I meant when I supplied an=
 incorrect=20=0D=0A> input. So the right thing would be to error, and not=
 do anything.=0D=0A=0D=0Ahow do you expect your calculator "error out" wh=
en you type "1+3" but=20=0D=0Ameant "1+2"=3F=0D=0A=0D=0A> Instead it re-i=
nterprets my incorrect input=0D=0A=0D=0AFUCK IT - it DID NOT interprete -=
 IT IT A CALCULATION=0D=0A=0D=0A
