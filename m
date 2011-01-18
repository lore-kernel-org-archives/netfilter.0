From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 18 Jan 2011 18:50:10 +0100
Message-ID: <4D35D2D2.3020201@tana.it>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org> <4D2CC740.9090007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1295373010; bh=gIVpMS5//kPTaYX+3RIrI8CzVcM7wrvYflC5/6V6vpA=;
	l=1696;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=I2zY3z+xs27rFn49ZQu4FAB1V0Mbo3MKx63qhyET1PkKd5O33xi+zJrC0f10QGdOu
	 p/2QHYsuMTivZJcoCWfkhXwRJM7xOJxskymgiWs24ppIM0Rm6c/yNAAY+q4LeMjVY6
	 jlUUrnGcxYA3Nqp2N2px/reHNrI0J8dULcnFHBFE=
In-Reply-To: <4D2CC740.9090007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Having tried it, it's rather tricky.  The behavior depends on when the
connection is deleted.  For example, with

   # input rule meant to drop incoming packets
   iptables -A INPUT -m conntrack --ctstate NEW -p tcp ! --syn\
      -j DROP
and
   # output rule to reset connections to the local server
   iptables -A OUTPUT -m conntrack --ctstate NEW -p tcp ! --syn\
      -j REJECT --reject-with tcp-reset

the connection is most likely deleted after the local server has sent
a reply but before the remote client sends a further commands.  In
this case the server will timeout waiting for those dropped input packets.

I tried removing that input rule.  That way the relevant packets are
accepted, but server's reply packets in the OUTPUT table are marked
ESTABLISHED again.

I tried using connmark, as in

   iptables -A INPUT -m conntrack --ctstate NEW -p tcp ! --syn\
      -j CONNMARK --or-mark 8
and
   iptables -A OUTPUT -m connmark --mark 8/8 -p tcp ! --syn\
      -j REJECT --reject-with tcp-reset

However, the latter rule never matched.  Is it the wrong table?

-- 
BTW, I'v added a request for tcp-reset-both to the wish list
http://bugzilla.netfilter.org/show_bug.cgi?id=696 (I hope I'll still
be alive by the time it lands on debian ;-)  For debian users, lenny's
conntrack doesn't work, but v0.9.14 of squeeze does --see
http://marc.info/?l=netfilter&m=127653938407010&w=2 for pinning--
conntrack -D -s 1.2.3.4 works for me despite the bug in
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=496769 mentions 0.9.15.)

N.B. Despite announce of 15/09/10, I couldn't find conntrack 0.9.15 in
http://conntrack-tools.netfilter.org/downloads.html


