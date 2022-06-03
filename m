From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Fri, 3 Jun 2022 18:23:27 +0000
Message-ID: <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
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
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com> 
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> 
 <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com> 
 <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com> 
 <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com> 
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654280607;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
        bh=YxNUOPR4EhgtGWKe/UsbCgEFGkhFkYLNQ7D+qnVBaBA=;
        b=QKUEoUzKAOBS5NuW49zh/pdSxEcQ9S1BBFAyj7/0C4x/oDLFHjXh0kEgV3SBt1U7
        ICImkGImnMbqqeVSHL7Mk0ec+iIKP59HOUG2suj06n6J7vRsuM/az8xoxvL2h+XfoOu
        vGFwjbEjHFJNxkuFRipIFCSRIBnZ/+/ppWwjX5Rs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654280607;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
        bh=YxNUOPR4EhgtGWKe/UsbCgEFGkhFkYLNQ7D+qnVBaBA=;
        b=E/67aEEqDg90HjzC7b/dl1LglzKWfB7jKd1teu91TuySdGkU8YbSRYT0SCsPTvSm
        W1AoBTzts1Oynz32VMXwSQzTaLb6J5roMNV2RzHA/KABHf9j48YWsgfVk+Kv+KB3kBm
        3RTpiupm764mgjSkUgxnS+5FOa02V14Z0CX3kZ8c=
In-Reply-To: <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?Alex_Buie?= <alex.buie@datto.com>
Cc: =?UTF-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>, =?UTF-8?Q?h=2Ereindl=40thelounge=2Enet?= <h.reindl@thelounge.net>

>> Whoops - just noticed, XOR should be AND in my message. My apologies!=0D=
=0A=0D=0ANo problem:) Thanks for taking the time and answer so comprehens=
ively!=0D=0A=0D=0A> There is no reinterpretation going on - the rule is s=
imply being=0D=0A> processed exactly as you added it, and the behavior yo=
u suggest would=0D=0A> be introducing reinterpretation.=0D=0A=0D=0AHmm, b=
ut don't other programs do indeed interpret 10.0.0.2/24 differently=3F Fo=
r example systemd-networkd interprets 10.0.0.2/24 as a single Ip address =
in the subnet 10.0.0.0/24. Which makes a lot of sense to me, because why =
would one specify the .2 at the end, if one meant the subnet=3F There is =
the unambiguous 10.0.0.0/24 to identify the subnet itself. In the Wikiped=
ia article about Ip addresses [1] it says:=20=0D=0A=0D=0A>> For example, =
the destination address used for directed broadcast to devices on the net=
work 192.0.2.0/24 is 192.0.2.255.=20=0D=0A=0D=0ASo they too interpret 192=
=2E0.2.0/24 as the network, and 192.0.2.255 as broadcast address, my poin=
t being that those two Ip addresses (i.e. beginning and end of the subnet=
) have two special meanings, the former representing the network.=0D=0A=0D=
=0AI guess my impression is that other user space programs (e.g. systemd-=
networkd), interpret 10.0.0.2/24 as pair: a single ip address and a mask =
identifying the corresponding subnet. I am confused that iptables picks o=
ne of them without telling me to be more specific.=0D=0A=0D=0AWhy would a=
 user space program not take advantage of that fact and unambiguously acc=
ept 10.0.0.0/24 to specify that specific subnet, and nothing else=3F=0D=0A=
=0D=0A=0D=0A[1] https://en.wikipedia.org/wiki/IP_address=0D=0A=0D=0A-----=
Original message-----=0D=0AFrom: Alex Buie=0D=0ASent: Friday, June 3 2022=
, 7:30 pm=0D=0ATo: Stefan Riha=0D=0ACc: netfilter@vger.kernel.org; h.rein=
dl@thelounge.net=0D=0ASubject: Re: Possibly dangerous interpretation of a=
ddress/prefix pair in -s option=0D=0A=0D=0AWhoops - just noticed, XOR sho=
uld be AND in my message. My apologies!=0D=0A=0D=0AOn Fri, Jun 3, 2022 at=
 1:28 PM Alex Buie <alex.buie@datto.com <mailto:alex.buie@datto.com>> wro=
te:=0D=0A>=0D=0A> Underneath, it's all just binary math.=0D=0A> Even thou=
gh you enter 10.0.0.0 or 10.0.0.2, they are converted to=0D=0A> their bin=
ary representation.=0D=0A>=0D=0A> EG:=0D=0A> 10.0.0.0: 00001010.00000000.=
00000000.00000000=0D=0A> 10.0.0.2: 00001010.00000000.00000000.00000010=0D=
=0A>=0D=0A> Then you are providing a bitmask (the /24 or /32 part) to tel=
l the=0D=0A> kernel which parts of the address should be checked for matc=
hing.=0D=0A>=0D=0A> /24: 11111111.11111111.11111111.00000000=0D=0A> /32: =
11111111.11111111.11111111.111111111=0D=0A>=0D=0A> The /24 at the end tel=
ls the kernel "allow 10.0.0.2, but only check to=0D=0A> make sure the fir=
st 24 bits match 10.0.0.2".=0D=0A>=0D=0A> 1- 10.0.0.50: 00001010.00000000=
=2E00000000.00110010=0D=0A> 2- /24:       11111111.11111111.11111111.0000=
0000=0D=0A> -------------------------------------------------------------=
--=0D=0A> XOR 1 with 2  00001010.00000000.00000000.00000000 (result 1)=0D=
=0A>=0D=0A> 1- 10.0.0.2:  00001010.00000000.00000000.00000010=0D=0A> 2- /=
24:       11111111.11111111.11111111.00000000=0D=0A> --------------------=
-------------------------------------------=0D=0A> XOR 1 with 2  00001010=
=2E00000000.00000000.00000000 (result 2)=0D=0A>=0D=0A> Result 1 =3D=3D Re=
sult 2, so the source match passes.=0D=0A>=0D=0A> This is functionally eq=
uivalent to telling the kernel "allow all of=0D=0A> 10.0.0" as 10.0.0 is =
the contents of the first 24 bits of 10.0.0.2=0D=0A>=0D=0A> There is no r=
einterpretation going on - the rule is simply being=0D=0A> processed exac=
tly as you added it, and the behavior you suggest would=0D=0A> be introdu=
cing reinterpretation.=0D=0A>=0D=0A> Hopefully that helps :)=0D=0A>=0D=0A=
> Alex=0D=0A>=0D=0A>=0D=0A> On Fri, Jun 3, 2022 at 1:08 PM Stefan Riha <s=
tefan@sriha.net <mailto:stefan@sriha.net>> wrote:=0D=0A> >=0D=0A> > Sorry=
 - I just realized I did not send the messages to the netfilter list, but=
 replied to Reindl Harald directly. Harald patiently makes the point that=
=0D=0A> >=0D=0A> > >> how do you expect your calculator "error out" when =
you type "1+3" but=0D=0A> > meant "1+2"=3F=0D=0A> >=0D=0A> > I'm not sure=
 I understand the analogy, because 1+3 is correct and unambiguous input. =
Why would the program then invent a different meaningful input, say "1+2"=
=3F Instead, 10.0.0.2/24 for the -s option is ambiguous (and I would argu=
e incorrect), because the correct inputs should have been=0D=0A> >=0D=0A>=
 > 10.0.0.0/24 (that's what iptables assumed I meant)=0D=0A> >=0D=0A> > o=
r=0D=0A> >=0D=0A> > 10.0.0.2/32 (or equivalently 10.0.0.2)=0D=0A> >=0D=0A=
> > The latter is what I actually meant. I guess the question is, why doe=
s iptables re-interpret an incorrect (ambiguous) input, and not error=3F =
10.0.0.2/24 makes no sense, right=3F Picking up the calculator analogy: i=
f I open a python terminal, and type=0D=0A> >=0D=0A> > In [3]: 3)4=0D=0A>=
 >=0D=0A> > python errors due to syntax error. It doesn't just re-intepre=
t it to '3+4' or '3-4'=0D=0A> >=0D=0A> > Thanks again for your patience!=0D=
=0A> >=0D=0A> > -----Original message-----=0D=0A> > From: Reindl Harald=0D=
=0A> > Sent: Friday, June 3 2022, 6:42 pm=0D=0A> > To: Stefan Riha=0D=0A>=
 > Subject: Re: Possibly dangerous interpretation of address/prefix pair =
in -s option=0D=0A> >=0D=0A> > Am 03.06.22 um 18:36 schrieb Stefan Riha:=0D=
=0A> > > But it assumed that when I put in 10.0.0.2/24=0D=0A> >=0D=0A> > =
you braindead moron IT CALCULATED=0D=0A> >=0D=0A> > 10.0.0.2/24 is for a =
computer similar to "1+2" for a human=0D=0A> >=0D=0A> > > I actually mean=
t 10.0.0.0/24=0D=0A> >=0D=0A> > then write it=0D=0A> >=0D=0A> > > That's =
possibly dangerous=0D=0A> >=0D=0A> > operate a firewall as beginner is in=
 generall dangerous=0D=0A> >=0D=0A> > > because what I actually meant was=
 10.0.0.2 (or equivalently 10.0.0.2/32).=0D=0A> >=0D=0A> > then write it=0D=
=0A> >=0D=0A> > > As you said, it can't smell what I meant when I supplie=
d an incorrect=0D=0A> > > input. So the right thing would be to error, an=
d not do anything.=0D=0A> >=0D=0A> > how do you expect your calculator "e=
rror out" when you type "1+3" but=0D=0A> > meant "1+2"=3F=0D=0A> >=0D=0A>=
 > > Instead it re-interprets my incorrect input=0D=0A> >=0D=0A> > FUCK I=
T - it DID NOT interprete - IT IT A CALCULATION=0D=0A> >=0D=0A> >=0D=0A> =
>=0D=0A>=0D=0A>=0D=0A> --=0D=0A> Alex Buie=0D=0A> Senior Networking Softw=
are Engineer=0D=0A> Datto, Inc.=0D=0A> 475-288-4550 (o)=0D=0A> 585-653-87=
79 (c)=0D=0A> www.datto.com <http://www.datto.com>=0D=0A>=0D=0A>=0D=0A>=0D=
=0A> Join the conversation!=0D=0A=0D=0A--=20=0D=0AAlex Buie=0D=0ASenior N=
etworking Software Engineer=0D=0ADatto, Inc.=0D=0A475-288-4550 (o)=0D=0A5=
85-653-8779 (c)=0D=0Awww.datto.com <http://www.datto.com>=0D=0A=0D=0AJoin=
 the conversation!=0D=0A=0D=0A
