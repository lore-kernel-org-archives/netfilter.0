From: Bill Prochazka <billprozac@gmail.com>
Subject: Re: NAT table bypass for local traffic
Date: Wed, 28 Apr 2010 16:50:52 -0400
Message-ID: <h2i812495871004281350j23f2bdefhe18b60101fcf5acc@mail.gmail.com>
References: <n2h812495871004281019nb633c037i7dc04336bc47bd59@mail.gmail.com>
	 <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>
	 <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=DrMXb4S5QyvyE8Zn/ex7s/yzbAs7o7D2Co3EUF+hfOQ=;
        b=fWpXOCoywtzejUMPHwa4yOcJn7kHGtALMIqrFLnYkDWnI6itMMrkhrbuZBaPB85r1T
         YwWG6300OgoeTmNYHL9FrvKQQPZS6b65k990zyLY9MWJUI4DffOcTaGdBEjh+HlodUED
         nog/J/YIkP75+vTIi6s5oeUDel54+vEswRA4c=
In-Reply-To: <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Steve Fink <sphink@gmail.com>, netfilter@vger.kernel.org

Steve,
Thanks for the info.  I have been playing around with it and that
helped...a little.  I played around with the raw table and found that
that fixed the issue of traversing the nat table for related
connections, but it does not fix the initial problem when acks are not
properly dealt with.  A more simple example is that ICMP echo requests
go out the nat table's output chain, but ICMP echo replies do not.

Bill

On Wed, Apr 28, 2010 at 3:46 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Wednesday 2010-04-28 19:59, Steve Fink wrote:
>>
> >From the iptables manpage, in the description of the nat table: "This
>>table is consulted when a packet that creates a new connection is
>>encountered."
>>
>>I don't know what mechanism makes related packets in an established
>>connection follow the translation actions set up by the initial
>>packets. There's a magic sheep bit in there somewhere.
>
> A ct entry with mappings already exists when a related packet shows up,
> so there is no need to do a relookup in the table.
>
