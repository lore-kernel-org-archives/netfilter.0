From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Re: NAT Reflection on Gateway with DHCP Address
Date: Thu, 12 Apr 2012 14:37:00 -0700
Message-ID: <CAEH2fGy3SLnKUMRzzdBqE6pMg=zndT3gcBL+9Z2tKjFbmLRAPg@mail.gmail.com>
References: <CAEH2fGxT9-F48ZT5zTm4HFY2U6ywZXxGKSXMwEaM1oRO2gK6Hw@mail.gmail.com>
	<20120409010844.GT3502@harrier.slackbuilds.org>
	<034990BB-E6AA-495C-A990-23279E5077B6@gmail.com>
	<20120409023114.GV3502@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=aAZqwL6tvXqp51KcMVC+pHWI+oSQltcH/bLZ2f97UcU=;
        b=GSxwxR21aDUQs5zvNog2GkGR60kPb1h0DQ3BxNtccc1Iy67dIn7MudczGM8OPEM04O
         vjQ7Ll/R5MmSwYxUTgbgFE7Tcr6S4VVhtg/FWm9poOrSrMaJ9uJ8WsV8TqrnwehXbZgJ
         ga5Wy7OcxSSNHlUwlrFS4l1WmY4B48kcdRJh9+rlvUNXc8BDk3/Yx0zIHk/4UezzL5A6
         gHiRRirji5G47n0PyJ1AMjLqyAQpwV6jwcDPZOLPU48t8Eqth5rij89ZQDr5fZkz4Z4u
         KiPRa4S6mtcAhF07XKyIJ73YaxeQqASLGAOGZqt2aYinkOdiupE7KAuYSxUtxVfWd8qW
         1Kkg==
In-Reply-To: <20120409023114.GV3502@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Apr 8, 2012 at 19:31, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Sun, Apr 08, 2012 at 06:42:51PM -0700, Aaron Clausen wrote:
>> Hence the need of reflection/loop back/whatever-you-call-it.
>
> And I gave you two links to tell you how to do that.

Okay, I've written rules in the form specified by the links you
provided. I have run up against another issue, one probably specific
to my situation.

To support the old subnet address range (192.168.1.0/24) as well as
the new range (10.0.0.0/23) I have created two IP addresses for my
internal interface; the primary being 10.0.0.1 and the old subnet
address being 192.168.1.254.  ifconfig shows it this way:

eth1      Link encap:Ethernet  HWaddr 00:1f:f2:04:d5:8f
          inet addr:10.0.0.1  Bcast:10.0.1.255  Mask:255.255.254.0
          inet6 addr: fe80::21f:f2ff:fe04:d58f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:202969887 errors:0 dropped:144568 overruns:0 frame:0
          TX packets:205166492 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1293204194 (1.2 GiB)  TX bytes:1956912187 (1.8 GiB)
          Interrupt:18 Base address:0xde00

eth1:1    Link encap:Ethernet  HWaddr 00:1f:f2:04:d5:8f
          inet addr:192.168.1.254  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:18 Base address:0xde00

What I've noticed with the rules from the links is that I can, from
the 10.0.0.0/23 subnet, access any port forwarded back to an internal
server providing the server is on the 192.168.1.254 subnet, but no
host sitting on the new subnet gets the loopbacked port forwarding.
They are all sitting on the same physical segment, it's just two
different addresses spaces.

Any explanation?


-- 
Aaron Clausen
mightymartianca@gmail.com
