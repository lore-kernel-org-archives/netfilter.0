From: pigi@frumar.it
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s option
Date: Sat, 04 Jun 2022 07:29:28 +0200
Message-ID: <4825064.GzlxMrEDrV@topolinux>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com> <mI_weL3h1lp4FFWpWqJgYZxIQq8seM3cNR8euOxiT4dtBMTbOQjbjVE5rtGXWzwUgyExLwXhtVTJEJFiEHD4b1Wh0SZ9xRSOAjVXlftILk8=@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=frumar.it;
        s=scnd; h=DKIM-Filter:From:To:Subject:Date:Message-ID:
        Organization:In-Reply-To:References:MIME-Version:
        Content-Transfer-Encoding:Content-Type; bh=CjkMN0evgmCsRLBBCzOXY
        eb2ZXQ=; b=qZi/n5c3C4esVrWgyz30jNjGQ34MRBfDKhCLnxcbwuA68a6Th/NSR
        ubc2jNN02fcqTJspirttrWC94w0dApp8iz3yUfcAhDPScQKk48GiB9+Zqbb9qwfs
        x40b5zO1Wfx08HiMmMP9eb5BqNCLiSSwOo8NsZqaGjBpdBQfrZMX7E=
DKIM-Filter: OpenDKIM Filter v2.10.3 orca.frumar.it 2545TK3k011276
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=frumar.it; s=orca;
        t=1654320561; bh=PKJGbaf2XjlFH6qrf43TwXFxO7A=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=FoUggI2B5Pet6vyI9T21oKMguINZzQi/cNXGMkiDDsL++PYwBGlZjhXL42VvxkkBF
         8jmOeosLBMf52stggZqaTUAI9KDy4lvtoVdmHiAnwjgibnviTfzA5RWqgE5LMQa8lm
         FcvD0vRywqxoPJ6kwRz/oA/h8G01Av3K5m+BMLmY=
In-Reply-To: <mI_weL3h1lp4FFWpWqJgYZxIQq8seM3cNR8euOxiT4dtBMTbOQjbjVE5rtGXWzwUgyExLwXhtVTJEJFiEHD4b1Wh0SZ9xRSOAjVXlftILk8=@protonmail.com>
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I think you are wrong:
10.0.0.1/25
IP Address:	10.0.0.1
Network Address:	10.0.0.0  <====== It's "0", not "1"
Usable Host IP Range:	10.0.0.1 - 10.0.0.126
Broadcast Address:	10.0.0.127

10.0.0.129/25
IP Address:	10.0.0.129
Network Address:	10.0.0.128  <===== It's "128" not "129"
Usable Host IP Range:	10.0.0.129 - 10.0.0.254
Broadcast Address:	10.0.0.255

In iptables notation, 10.0.0.1/25 should sound as "syntax error" ( and so should 10.0.0.129/25) 

Just my 2 cents.

Pigi


On Saturday, June 4, 2022 1:37:57 AM CEST Timothy Ham wrote:
> Here is an example network that wouldn't work with your proposed "syntax error":
> 
> 10.0.0.1/25
> IP Address:	10.0.0.1
> Network Address:	10.0.0.1
> Usable Host IP Range:	10.0.0.1 - 10.0.0.126
> Broadcast Address:	10.0.0.127
> 
> 10.0.0.129/25
> IP Address:	10.0.0.129
> Network Address:	10.0.0.129
> Usable Host IP Range:	10.0.0.129 - 10.0.0.254
> Broadcast Address:	10.0.0.255
> 
> This is a bit convoluted, but are perfectly valid subnets. And in order to specify them, the current behavior is needed.
> 
> Cheers,
> 
> 
> Sent with Proton Mail secure email.
> ------- Original Message -------
> On Friday, June 3rd, 2022 at 11:23 AM, Stefan Riha <stefan@sriha.net> wrote:
> 
> 
> > > > Whoops - just noticed, XOR should be AND in my message. My apologies!
> >
> >
> > No problem:) Thanks for taking the time and answer so comprehensively!
> >
> > > There is no reinterpretation going on - the rule is simply being
> > > processed exactly as you added it, and the behavior you suggest would
> > > be introducing reinterpretation.
> >
> >
> > Hmm, but don't other programs do indeed interpret 10.0.0.2/24 differently? For example systemd-networkd interprets 10.0.0.2/24 as a single Ip address in the subnet 10.0.0.0/24. Which makes a lot of sense to me, because why would one specify the .2 at the end, if one meant the subnet? There is the unambiguous 10.0.0.0/24 to identify the subnet itself. In the Wikipedia article about Ip addresses [1] it says:
> >
> > > > For example, the destination address used for directed broadcast to devices on the network 192.0.2.0/24 is 192.0.2.255.
> >
> >
> > So they too interpret 192.0.2.0/24 as the network, and 192.0.2.255 as broadcast address, my point being that those two Ip addresses (i.e. beginning and end of the subnet) have two special meanings, the former representing the network.
> >
> > I guess my impression is that other user space programs (e.g. systemd-networkd), interpret 10.0.0.2/24 as pair: a single ip address and a mask identifying the corresponding subnet. I am confused that iptables picks one of them without telling me to be more specific.
> >
> > Why would a user space program not take advantage of that fact and unambiguously accept 10.0.0.0/24 to specify that specific subnet, and nothing else?
> >
> >
> > [1] https://en.wikipedia.org/wiki/IP_address
> >
> > -----Original message-----
> > From: Alex Buie
> > Sent: Friday, June 3 2022, 7:30 pm
> > To: Stefan Riha
> > Cc: netfilter@vger.kernel.org; h.reindl@thelounge.net
> > Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s option
> >
> > Whoops - just noticed, XOR should be AND in my message. My apologies!
> >
> > On Fri, Jun 3, 2022 at 1:28 PM Alex Buie <alex.buie@datto.com mailto:alex.buie@datto.com> wrote:
> >
> > > Underneath, it's all just binary math.
> > > Even though you enter 10.0.0.0 or 10.0.0.2, they are converted to
> > > their binary representation.
> > >
> > > EG:
> > > 10.0.0.0: 00001010.00000000.00000000.00000000
> > > 10.0.0.2: 00001010.00000000.00000000.00000010
> > >
> > > Then you are providing a bitmask (the /24 or /32 part) to tell the
> > > kernel which parts of the address should be checked for matching.
> > >
> > > /24: 11111111.11111111.11111111.00000000
> > > /32: 11111111.11111111.11111111.111111111
> > >
> > > The /24 at the end tells the kernel "allow 10.0.0.2, but only check to
> > > make sure the first 24 bits match 10.0.0.2".
> > >
> > > 1- 10.0.0.50: 00001010.00000000.00000000.00110010
> > > 2- /24: 11111111.11111111.11111111.00000000
> > > ---------------------------------------------------------------
> > > XOR 1 with 2 00001010.00000000.00000000.00000000 (result 1)
> > >
> > > 1- 10.0.0.2: 00001010.00000000.00000000.00000010
> > > 2- /24: 11111111.11111111.11111111.00000000
> > > ---------------------------------------------------------------
> > > XOR 1 with 2 00001010.00000000.00000000.00000000 (result 2)
> > >
> > > Result 1 == Result 2, so the source match passes.
> > >
> > > This is functionally equivalent to telling the kernel "allow all of
> > > 10.0.0" as 10.0.0 is the contents of the first 24 bits of 10.0.0.2
> > >
> > > There is no reinterpretation going on - the rule is simply being
> > > processed exactly as you added it, and the behavior you suggest would
> > > be introducing reinterpretation.
> > >
> > > Hopefully that helps :)
> > >
> > > Alex
> > >
> > > On Fri, Jun 3, 2022 at 1:08 PM Stefan Riha <stefan@sriha.net mailto:stefan@sriha.net> wrote:
> > >
> > > > Sorry - I just realized I did not send the messages to the netfilter list, but replied to Reindl Harald directly. Harald patiently makes the point that
> > > >
> > > > > > how do you expect your calculator "error out" when you type "1+3" but
> > > > > > meant "1+2"?
> > > >
> > > > I'm not sure I understand the analogy, because 1+3 is correct and unambiguous input. Why would the program then invent a different meaningful input, say "1+2"? Instead, 10.0.0.2/24 for the -s option is ambiguous (and I would argue incorrect), because the correct inputs should have been
> > > >
> > > > 10.0.0.0/24 (that's what iptables assumed I meant)
> > > >
> > > > or
> > > >
> > > > 10.0.0.2/32 (or equivalently 10.0.0.2)
> > > >
> > > > The latter is what I actually meant. I guess the question is, why does iptables re-interpret an incorrect (ambiguous) input, and not error? 10.0.0.2/24 makes no sense, right? Picking up the calculator analogy: if I open a python terminal, and type
> > > >
> > > > In [3]: 3)4
> > > >
> > > > python errors due to syntax error. It doesn't just re-intepret it to '3+4' or '3-4'
> > > >
> > > > Thanks again for your patience!
> > > >
> > > > -----Original message-----
> > > > From: Reindl Harald
> > > > Sent: Friday, June 3 2022, 6:42 pm
> > > > To: Stefan Riha
> > > > Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s option
> > > >
> > > > Am 03.06.22 um 18:36 schrieb Stefan Riha:
> > > >
> > > > > But it assumed that when I put in 10.0.0.2/24
> > > >
> > > > you braindead moron IT CALCULATED
> > > >
> > > > 10.0.0.2/24 is for a computer similar to "1+2" for a human
> > > >
> > > > > I actually meant 10.0.0.0/24
> > > >
> > > > then write it
> > > >
> > > > > That's possibly dangerous
> > > >
> > > > operate a firewall as beginner is in generall dangerous
> > > >
> > > > > because what I actually meant was 10.0.0.2 (or equivalently 10.0.0.2/32).
> > > >
> > > > then write it
> > > >
> > > > > As you said, it can't smell what I meant when I supplied an incorrect
> > > > > input. So the right thing would be to error, and not do anything.
> > > >
> > > > how do you expect your calculator "error out" when you type "1+3" but
> > > > meant "1+2"?
> > > >
> > > > > Instead it re-interprets my incorrect input
> > > >
> > > > FUCK IT - it DID NOT interprete - IT IT A CALCULATION
> > >
> > > --
> > > Alex Buie
> > > Senior Networking Software Engineer
> > > Datto, Inc.
> > > 475-288-4550 (o)
> > > 585-653-8779 (c)
> > > www.datto.com http://www.datto.com
> > >
> > > Join the conversation!
> >
> >
> > --
> > Alex Buie
> > Senior Networking Software Engineer
> > Datto, Inc.
> > 475-288-4550 (o)
> > 585-653-8779 (c)
> > www.datto.com http://www.datto.com
> >
> >
> > Join the conversation!
> 



