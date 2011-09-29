From: Andrew Beverley <andy@andybev.com>
Subject: Re: [SOLVED] Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 08:53:27 +0100
Message-ID: <1317282807.26402.58.camel@andybev-desktop>
References: <1317248412.26402.39.camel@andybev-desktop>
	 <1317279076.26402.52.camel@andybev-desktop>
	 <CAA2qdGUrc31FekJM6r1_s2COoFi5g5iwfpJeozeLED2pYsy3Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317282808;
	bh=1Kh/KrNIk1EFyh2WUMpV5mja/8T/qfF8Eq6mXLct8Hk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=OKze0o4Len18sXX3vRTZCpypdLU0i677bkN5p7VOd82CAf/ClZW+IR6QC9CsV40lm
	 jRZIqpR0INdlipvBLbLaKC0OvRRmJhpdeqkmS1fQ6//I4Y5m6r7ubdQEl3lkB2A/cz
	 h99zvpLychbh9slIjNTMntsaLjzZmVexKfv5Guxw=
In-Reply-To: <CAA2qdGUrc31FekJM6r1_s2COoFi5g5iwfpJeozeLED2pYsy3Fw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

On Thu, 2011-09-29 at 14:32 +0700, Pandu Poluan wrote:
> On Thu, Sep 29, 2011 at 13:51, Andrew Beverley <andy@andybev.com> wrote:
> > On Wed, 2011-09-28 at 23:20 +0100, Andrew Beverley wrote:
> >> Hi,
> >>
> >> I'd like to route locally generated traffic via a particular interface
> >> based on its mark value.
> >>
> >> From what I have researched, this is theoretically possible and lots of
> >> people have tried it, but nobody has got it working.
> >>
> >> Here's my rules:
> >>
> >> # Mark the packets
> >> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
> >>
> >> # Route the marked packets via routing table T2:
> >> ip rule add fwmark 0x800/0xffff table T2
> >>
> >> # Force T2 packets out of the interface ppp1
> >> ip route add table T2 default dev ppp1 via 94.30.127.76
> >>
> >> # Flush the cache, just in case
> >> ip route flush cache
> >>
> >> However, the packets still go out of the default route (ppp0).
> >
> > I've also added the following, which makes no difference:
> >
> > iptables -t nat -A POSTROUTING -o ppp1 \
> >        -j SNAT --to-source 109.224.134.110
> >
> >
> 
> Can you post the complete table, i.e., the output of iptables-save ?
> 

Thanks for that. After I added the SNAT rule, I forgot to remove an
existing earlier rule that was stopping the packets being marked. Your
email reminded me!

So, the reason it wasn't working for me was the missing SNAT rule after
all. It now works correctly.

Thanks,

Andy


