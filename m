From: Timothy Ham <timothyham@protonmail.com>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s option
Date: Fri, 03 Jun 2022 23:37:57 +0000
Message-ID: <mI_weL3h1lp4FFWpWqJgYZxIQq8seM3cNR8euOxiT4dtBMTbOQjbjVE5rtGXWzwUgyExLwXhtVTJEJFiEHD4b1Wh0SZ9xRSOAjVXlftILk8=@protonmail.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com> <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com> <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com> <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com> <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com> <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com> <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
Reply-To: Timothy Ham <timothyham@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1654299480; x=1654558680;
        bh=nuwJnvkLjAyzJJxy0qxsbDixNsNqfqY/J1oMJBhbtYg=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=xXChWre3s+PwQ1EIbLSm5kRTBZs59hkEJ2XyuoHyQescbJoLS/VWuaPICBcJetNhN
         PDC88hnZ8h6bJijvujL4QYcyXPkGkW17azUwtXePY5WShEsE6vgsgwLljV33o6ifA0
         M8pyyghcGbFsRLdi8EbjNUDKDQqyakWDDRtt2BSMmI5La8YQ2sRn/iUAGFRoVxA2Nj
         i+RRlIT+6u+X/z53GoNDgUFXxF2sAvt//P2/+C8Z07u3x8MAQdGZ0OpoZLpB3cbRK9
         dkr+yzZzgjXkXICtoLVU20U6nARxNGHSddHUDNTWD+3AOMLiBYK1vACHO8JPdSSyjb
         yRYjTx8Htvizg==
In-Reply-To: <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Here is an example network that wouldn't work with your proposed "syntax er=
ror":

10.0.0.1/25
IP Address:=0910.0.0.1
Network Address:=0910.0.0.1
Usable Host IP Range:=0910.0.0.1 - 10.0.0.126
Broadcast Address:=0910.0.0.127

10.0.0.129/25
IP Address:=0910.0.0.129
Network Address:=0910.0.0.129
Usable Host IP Range:=0910.0.0.129 - 10.0.0.254
Broadcast Address:=0910.0.0.255

This is a bit convoluted, but are perfectly valid subnets. And in order to =
specify them, the current behavior is needed.

Cheers,


Sent with Proton Mail secure email.
------- Original Message -------
On Friday, June 3rd, 2022 at 11:23 AM, Stefan Riha <stefan@sriha.net> wrote=
:


> > > Whoops - just noticed, XOR should be AND in my message. My apologies!
>
>
> No problem:) Thanks for taking the time and answer so comprehensively!
>
> > There is no reinterpretation going on - the rule is simply being
> > processed exactly as you added it, and the behavior you suggest would
> > be introducing reinterpretation.
>
>
> Hmm, but don't other programs do indeed interpret 10.0.0.2/24 differently=
? For example systemd-networkd interprets 10.0.0.2/24 as a single Ip addres=
s in the subnet 10.0.0.0/24. Which makes a lot of sense to me, because why =
would one specify the .2 at the end, if one meant the subnet? There is the =
unambiguous 10.0.0.0/24 to identify the subnet itself. In the Wikipedia art=
icle about Ip addresses [1] it says:
>
> > > For example, the destination address used for directed broadcast to d=
evices on the network 192.0.2.0/24 is 192.0.2.255.
>
>
> So they too interpret 192.0.2.0/24 as the network, and 192.0.2.255 as bro=
adcast address, my point being that those two Ip addresses (i.e. beginning =
and end of the subnet) have two special meanings, the former representing t=
he network.
>
> I guess my impression is that other user space programs (e.g. systemd-net=
workd), interpret 10.0.0.2/24 as pair: a single ip address and a mask ident=
ifying the corresponding subnet. I am confused that iptables picks one of t=
hem without telling me to be more specific.
>
> Why would a user space program not take advantage of that fact and unambi=
guously accept 10.0.0.0/24 to specify that specific subnet, and nothing els=
e?
>
>
> [1] https://en.wikipedia.org/wiki/IP_address
>
> -----Original message-----
> From: Alex Buie
> Sent: Friday, June 3 2022, 7:30 pm
> To: Stefan Riha
> Cc: netfilter@vger.kernel.org; h.reindl@thelounge.net
> Subject: Re: Possibly dangerous interpretation of address/prefix pair in =
-s option
>
> Whoops - just noticed, XOR should be AND in my message. My apologies!
>
> On Fri, Jun 3, 2022 at 1:28 PM Alex Buie <alex.buie@datto.com mailto:alex=
.buie@datto.com> wrote:
>
> > Underneath, it's all just binary math.
> > Even though you enter 10.0.0.0 or 10.0.0.2, they are converted to
> > their binary representation.
> >
> > EG:
> > 10.0.0.0: 00001010.00000000.00000000.00000000
> > 10.0.0.2: 00001010.00000000.00000000.00000010
> >
> > Then you are providing a bitmask (the /24 or /32 part) to tell the
> > kernel which parts of the address should be checked for matching.
> >
> > /24: 11111111.11111111.11111111.00000000
> > /32: 11111111.11111111.11111111.111111111
> >
> > The /24 at the end tells the kernel "allow 10.0.0.2, but only check to
> > make sure the first 24 bits match 10.0.0.2".
> >
> > 1- 10.0.0.50: 00001010.00000000.00000000.00110010
> > 2- /24: 11111111.11111111.11111111.00000000
> > ---------------------------------------------------------------
> > XOR 1 with 2 00001010.00000000.00000000.00000000 (result 1)
> >
> > 1- 10.0.0.2: 00001010.00000000.00000000.00000010
> > 2- /24: 11111111.11111111.11111111.00000000
> > ---------------------------------------------------------------
> > XOR 1 with 2 00001010.00000000.00000000.00000000 (result 2)
> >
> > Result 1 =3D=3D Result 2, so the source match passes.
> >
> > This is functionally equivalent to telling the kernel "allow all of
> > 10.0.0" as 10.0.0 is the contents of the first 24 bits of 10.0.0.2
> >
> > There is no reinterpretation going on - the rule is simply being
> > processed exactly as you added it, and the behavior you suggest would
> > be introducing reinterpretation.
> >
> > Hopefully that helps :)
> >
> > Alex
> >
> > On Fri, Jun 3, 2022 at 1:08 PM Stefan Riha <stefan@sriha.net mailto:ste=
fan@sriha.net> wrote:
> >
> > > Sorry - I just realized I did not send the messages to the netfilter =
list, but replied to Reindl Harald directly. Harald patiently makes the poi=
nt that
> > >
> > > > > how do you expect your calculator "error out" when you type "1+3"=
 but
> > > > > meant "1+2"?
> > >
> > > I'm not sure I understand the analogy, because 1+3 is correct and una=
mbiguous input. Why would the program then invent a different meaningful in=
put, say "1+2"? Instead, 10.0.0.2/24 for the -s option is ambiguous (and I =
would argue incorrect), because the correct inputs should have been
> > >
> > > 10.0.0.0/24 (that's what iptables assumed I meant)
> > >
> > > or
> > >
> > > 10.0.0.2/32 (or equivalently 10.0.0.2)
> > >
> > > The latter is what I actually meant. I guess the question is, why doe=
s iptables re-interpret an incorrect (ambiguous) input, and not error? 10.0=
.0.2/24 makes no sense, right? Picking up the calculator analogy: if I open=
 a python terminal, and type
> > >
> > > In [3]: 3)4
> > >
> > > python errors due to syntax error. It doesn't just re-intepret it to =
'3+4' or '3-4'
> > >
> > > Thanks again for your patience!
> > >
> > > -----Original message-----
> > > From: Reindl Harald
> > > Sent: Friday, June 3 2022, 6:42 pm
> > > To: Stefan Riha
> > > Subject: Re: Possibly dangerous interpretation of address/prefix pair=
 in -s option
> > >
> > > Am 03.06.22 um 18:36 schrieb Stefan Riha:
> > >
> > > > But it assumed that when I put in 10.0.0.2/24
> > >
> > > you braindead moron IT CALCULATED
> > >
> > > 10.0.0.2/24 is for a computer similar to "1+2" for a human
> > >
> > > > I actually meant 10.0.0.0/24
> > >
> > > then write it
> > >
> > > > That's possibly dangerous
> > >
> > > operate a firewall as beginner is in generall dangerous
> > >
> > > > because what I actually meant was 10.0.0.2 (or equivalently 10.0.0.=
2/32).
> > >
> > > then write it
> > >
> > > > As you said, it can't smell what I meant when I supplied an incorre=
ct
> > > > input. So the right thing would be to error, and not do anything.
> > >
> > > how do you expect your calculator "error out" when you type "1+3" but
> > > meant "1+2"?
> > >
> > > > Instead it re-interprets my incorrect input
> > >
> > > FUCK IT - it DID NOT interprete - IT IT A CALCULATION
> >
> > --
> > Alex Buie
> > Senior Networking Software Engineer
> > Datto, Inc.
> > 475-288-4550 (o)
> > 585-653-8779 (c)
> > www.datto.com http://www.datto.com
> >
> > Join the conversation!
>
>
> --
> Alex Buie
> Senior Networking Software Engineer
> Datto, Inc.
> 475-288-4550 (o)
> 585-653-8779 (c)
> www.datto.com http://www.datto.com
>
>
> Join the conversation!
