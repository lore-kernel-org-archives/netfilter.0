From: Alex Buie <alex.buie@datto.com>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s option
Date: Fri, 3 Jun 2022 13:30:40 -0400
Message-ID: <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a366a81-2f2bc7f3-e142-4807-9742-bfa7b19dd468-000000@eu-west-1.amazonses.com>
 <e2ba2738-2eff-3e97-a389-77abd17664dd@thelounge.net> <mail.629a2dfb.57ab.496a0a414c9495b2@storage.wm.amazon.com>
 <010201812a43a0d9-c4953858-f0e1-48db-a7a3-420d53a11cd7-000000@eu-west-1.amazonses.com>
 <df64386a-5daf-6f97-3d37-b0c9b7c25537@thelounge.net> <mail.629a3289.7fbb.1b2912350cfc7c1b@storage.wm.amazon.com>
 <010201812a556c50-7856ee86-1a5a-4135-8acf-869a930d54c8-000000@eu-west-1.amazonses.com>
 <768e4d99-0c50-01af-4434-20378c06a3cf@thelounge.net> <mail.629a35d7.2a64.4a0b184f3a85fa1c@storage.wm.amazon.com>
 <010201812a625427-9b51500d-3126-4b6f-95d0-d71702c349a7-000000@eu-west-1.amazonses.com>
 <b6945516-3120-24f0-9990-294f1653c9a4@thelounge.net> <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com>
 <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com>
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com>
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com>
 <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datto.com;
        s=mimecast20190208; t=1654277521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BrTGH0mOhLU1CfzyOBwJoMYge/WmBgqQJWTPfWrsmTo=;
        b=hdmNE3yTHtmQuuP6rYNzBQeN9BUh79lNVnOUm1b6df9P66crRjnGAjWG/w5N8MVt1lNNiA
        e08yznEmMcY4eMbySCA0jy4jCnJhY6a6zdPXae1If78ObjloeVbsN2aNGVXkdWodsebte+
        bk8XWkuy0vqak9K72pM0i6eE3wSc8bc=
In-Reply-To: <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Riha <stefan@sriha.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "h.reindl@thelounge.net" <h.reindl@thelounge.net>

Whoops - just noticed, XOR should be AND in my message. My apologies!


On Fri, Jun 3, 2022 at 1:28 PM Alex Buie <alex.buie@datto.com> wrote:
>
> Underneath, it's all just binary math.
> Even though you enter 10.0.0.0 or 10.0.0.2, they are converted to
> their binary representation.
>
> EG:
> 10.0.0.0: 00001010.00000000.00000000.00000000
> 10.0.0.2: 00001010.00000000.00000000.00000010
>
> Then you are providing a bitmask (the /24 or /32 part) to tell the
> kernel which parts of the address should be checked for matching.
>
> /24: 11111111.11111111.11111111.00000000
> /32: 11111111.11111111.11111111.111111111
>
> The /24 at the end tells the kernel "allow 10.0.0.2, but only check to
> make sure the first 24 bits match 10.0.0.2".
>
> 1- 10.0.0.50: 00001010.00000000.00000000.00110010
> 2- /24:       11111111.11111111.11111111.00000000
> ---------------------------------------------------------------
> XOR 1 with 2  00001010.00000000.00000000.00000000 (result 1)
>
> 1- 10.0.0.2:  00001010.00000000.00000000.00000010
> 2- /24:       11111111.11111111.11111111.00000000
> ---------------------------------------------------------------
> XOR 1 with 2  00001010.00000000.00000000.00000000 (result 2)
>
> Result 1 =3D=3D Result 2, so the source match passes.
>
> This is functionally equivalent to telling the kernel "allow all of
> 10.0.0" as 10.0.0 is the contents of the first 24 bits of 10.0.0.2
>
> There is no reinterpretation going on - the rule is simply being
> processed exactly as you added it, and the behavior you suggest would
> be introducing reinterpretation.
>
> Hopefully that helps :)
>
> Alex
>
>
> On Fri, Jun 3, 2022 at 1:08 PM Stefan Riha <stefan@sriha.net> wrote:
> >
> > Sorry - I just realized I did not send the messages to the netfilter li=
st, but replied to Reindl Harald directly. Harald patiently makes the point=
 that
> >
> > >> how do you expect your calculator "error out" when you type "1+3" bu=
t
> > meant "1+2"?
> >
> > I'm not sure I understand the analogy, because 1+3 is correct and unamb=
iguous input. Why would the program then invent a different meaningful inpu=
t, say "1+2"? Instead, 10.0.0.2/24 for the -s option is ambiguous (and I wo=
uld argue incorrect), because the correct inputs should have been
> >
> > 10.0.0.0/24 (that's what iptables assumed I meant)
> >
> > or
> >
> > 10.0.0.2/32 (or equivalently 10.0.0.2)
> >
> > The latter is what I actually meant. I guess the question is, why does =
iptables re-interpret an incorrect (ambiguous) input, and not error? 10.0.0=
.2/24 makes no sense, right? Picking up the calculator analogy: if I open a=
 python terminal, and type
> >
> > In [3]: 3)4
> >
> > python errors due to syntax error. It doesn't just re-intepret it to '3=
+4' or '3-4'
> >
> > Thanks again for your patience!
> >
> > -----Original message-----
> > From: Reindl Harald
> > Sent: Friday, June 3 2022, 6:42 pm
> > To: Stefan Riha
> > Subject: Re: Possibly dangerous interpretation of address/prefix pair i=
n -s option
> >
> > Am 03.06.22 um 18:36 schrieb Stefan Riha:
> > > But it assumed that when I put in 10.0.0.2/24
> >
> > you braindead moron IT CALCULATED
> >
> > 10.0.0.2/24 is for a computer similar to "1+2" for a human
> >
> > > I actually meant 10.0.0.0/24
> >
> > then write it
> >
> > > That's possibly dangerous
> >
> > operate a firewall as beginner is in generall dangerous
> >
> > > because what I actually meant was 10.0.0.2 (or equivalently 10.0.0.2/=
32).
> >
> > then write it
> >
> > > As you said, it can't smell what I meant when I supplied an incorrect
> > > input. So the right thing would be to error, and not do anything.
> >
> > how do you expect your calculator "error out" when you type "1+3" but
> > meant "1+2"?
> >
> > > Instead it re-interprets my incorrect input
> >
> > FUCK IT - it DID NOT interprete - IT IT A CALCULATION
> >
> >
> >
>
>
> --
> Alex Buie
> Senior Networking Software Engineer
> Datto, Inc.
> 475-288-4550 (o)
> 585-653-8779 (c)
> www.datto.com
>
>
>
> Join the conversation!



--=20
Alex Buie
Senior Networking Software Engineer
Datto, Inc.
475-288-4550 (o)
585-653-8779 (c)
www.datto.com



Join the conversation!

