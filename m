From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: IMQ and marking
Date: Tue, 21 Jul 2009 16:21:26 +0200
Message-ID: <4A65CEE6.9050004@duet.it>
References: <4A65A1A4.4020805@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65A1A4.4020805@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

In a post in a forum I see this:
iptables -t mangle -A PREROUTING -m owner --pid-owner <PID of process> - 
-j MARK --set-mark 2
iptables -t mangle -A PREROUTING -j IMQ --todev 0

the second rule is used? so, rule matching in mangle table is not blocking?

Fabio
> Hi!
> I'm studying how to introduce traffic shaping in a linux router 
> (debian). I mark packets in prerouting using mac source to forward 
> packets on a selected WAN interface.
> I need to use mangle in PREROUTING to send packects (in input) to a 
> imqX interface.
> Is there a conflict between mark and IMQ?
> If so, how it can be solved?
>
> Thanks in advance,
> Fabio Marcone
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

