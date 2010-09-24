From: Greg Oliver <oliver.greg@gmail.com>
Subject: string and u32 modules
Date: Thu, 23 Sep 2010 19:52:58 -0500
Message-ID: <AANLkTin8Uvd7z0ty6urts2oy53mL=TCE0=r7O7g902HH@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=9LrWcHDiqTm/LN53SPyrWUBFfV9EyCzkmZY9rZCP69E=;
        b=U2DRE7veVFJcJxVgD+15YEghy3HSpxjOR1l0aO9tA0mHZwL4uczIdHbiicGSLePb1U
         LHcsI7Ed2queGaYvNhOmQ4lVTe9/QZY98vrjrtVGM4BicmcLb6bXxIwNuw/MsnzIJMmP
         Yw8UUKNulR1B67tuPIBzAU99OGQTRtZllJUgg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am pretty new to iptables, but understand all of the concepts very
well.  I am trying to drop a specific RTP packet with a certain
payload type (1st 2 bytes of payload will tell me in the rtp header).

I compiled everything in centos and all appears to work (no  errors,
etc when loading the module) from a system standpoint.

The u32 module has made no matches for me though, and I cannot get the
string module to match hex strings.  I plan to use u32, but tried
string just to see if I was an idiot :)

I guess I am!

I am using tcpreplay to send the packet I want to drop:


19:40:13.666679 IP ghost.29364 > ccs1.25862: UDP, length 13
	0x0000:  45b8 0029 95cd 0000 3d11 9c86 c0a8 6476  E..)....=.....dv
	0x0010:  c0a8 64f1 72b4 6506 0015 bbc9 800d 9f6b  ..d.r.e........k
	0x0020:  7c06 b562 a690 c613 6400 0000 0000       |..b....d.....

800d is what I want to catch in bytes 27,28...

LOG        all  --  anywhere             anywhere            STRING
match "|800d|" ALGO name bm TO 65535LOG level debug prefix `PT-13 :::
'

This string filter (which I now have wide open on --from and --to
never catches it though.  I cannot get u32 to catch anything though.

My laptop runs *buntu, and I can successfully get u32 to match on
specific IP, etc, but I cannot get it to match on this packet.  I am
using:

-A INPUT -m u32 --u32 "0>>22&0x3C@6=0x800D" -j LOG --log-prefix "CNOISE: "
-A INPUT -m u32 --u32 "26&0xFFFF=0x800D" -j LOG --log-prefix "CNOISE: "

It never matches though..  And since I am unsure as to when 0 counts
and does not, I have tried starting form every byte in the area!  :)

I get no errors from the modules, but my hex-foo must suck, because I
clearly cannot get this to work..

Any pointers would be greatly appreciated..

Oh - kernel 2.6.18, with iptables 1.3.5 (POM'ed from 20100811 snapshot
and recompiled)..

Thanks for any pointers

-Greg

Thanks

-Greg
