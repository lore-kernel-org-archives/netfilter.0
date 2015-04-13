From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Atomic changes to IP sets
Date: Mon, 13 Apr 2015 17:16:32 -0400
Message-ID: <CAPJdpdBXmfsT98tcVE1Yt5Orfk0QihdLmuFMaqQEix0GXHEm2w@mail.gmail.com>
References: <ECC8F67CE961104EB2AFE8F7FD50F5D045F1E6@exchange2010.sirrix.de>
	<ECC8F67CE961104EB2AFE8F7FD50F5D045F21A@exchange2010.sirrix.de>
	<552B9B13.2080906@bergzand.net>
	<201504131220.05412.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=nrRdDsXAnVBNAK0C0J7npPTkqDm007QakEj1zF6A228=;
        b=Z55FpLdFN6ZHZqrM+4LYA4tzFSpw6PjMQrSSvxOOWm3tln+7nABr4oKI1fdGsdYZM4
         cXbEHSKipHiZvBmAiIhbc35+MsMMqs7cPQOBPYR7Cs/Li/BYKLyxDhNN5y7uRAWmoacQ
         AiHpXE46w3BaRjuRyXRHo5LNIZx8LHAeF3aZST5osx382GzRvNFER8KfB6H9fcuyCGwP
         exIHWGj8TIUSr31ulKbAbem081ZiHa+NwIyKptgPVWJvpkFXA2kXPOwLemI5h7HqeWwg
         Tsy+IsOIKpriBTYET8DvAmkWHv089YCLTVx+m5VTlhWQa+SrxLuzbzGYwYl/dRtjpLTg
         4j9w==
In-Reply-To: <201504131220.05412.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Cc: netfilter <netfilter@vger.kernel.org>

take a look at my tool ipset-manager
https://github.com/prmarino1/HadrianWall/tree/master/Tools/IPSet-Manager

This uses a swap method which can update changes sets without deleting them.
documentation is embedded in the script in POD format. It can be
extracted with pod2man, pod2text, pod2html, etc.

It requires two Perl 5 modules  XML::Twig and Getopt::Long





On Mon, Apr 13, 2015 at 12:20 PM, Neal Murphy
<neal.p.murphy@alum.wpi.edu> wrote:
> On Monday, April 13, 2015 06:31:47 AM Koen Zandberg wrote:
>> On 13/04/15 10:23, Anna Fischer wrote:
>> > Hi,
>> >
>> > I'm using ip sets in my iptables firwall rules. I don't just use those
>> > for firewalling, but also for packet mangling (marking). Now I'm quite
>> > frequently changing these sets and also the firewall rules. I know that
>> > I can atomically switch firewall rules by using iptables-restore. But
>> > how can I make changes to ip sets atomic? It seems to be as if packets
>> > are always passing the firewall whilst I do ipset commands. Currently I
>> > flush all ip sets, and then rebuild them. I understand this will cause
>> > problems because at times my ip sets are empty and so the firewall does
>> > not behave how I want it to behave. But what is the correct way to
>> > atomically update ip sets? I have seen that there is a command to swap
>> > an ip set. So I would build up a new set, then swap it with the old one,
>> > and then delete the old one. Is that the right way of changing ip sets?
>> > The other option would be to create a whole new set of ipsets and the a
>> > new set of iptables rules with these sets, and then I use
>> > iptables-restor
>> >
>> >   e to atomically switch the full firewall table. This seems like quite a
>> >   bit of overkill though, doesn't it? Does anyone have an idea about how
>> >   to best work with ip sets without building glitches into my firewall
>> >   whilst reconfiguring ip sets?
>> >
>> > Thanks for any pointers.
>> >
>> > Anna
>>
>> The way I learned to do this atomically was by creating a new set and
>> using "ipset swap $OLDLIST $NEWLIST" to swap your old set with your new
>> set.
>
> I believe it waits for relative quiesence, then atomically swaps the names of
> the two sets. So don't forget to delete set $NEWLIST after the swap (which is
> now the old set).
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
