From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables based appliances - ipset
Date: Mon, 8 Jun 2015 12:02:42 -0400
Message-ID: <20150608120242.577d3ff1@playground>
References: <20150607155120.43e0eab8@playground>
	<201506081402.t58E2CrZ021258@Mail.Linux-Consulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201506081402.t58E2CrZ021258@Mail.Linux-Consulting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alvin <alvin.sm@Mail.Linux-Consulting.com>
Cc: netfilter@vger.kernel.org

On Mon, 8 Jun 2015 07:02:12 -0700 (PDT)
alvin <alvin.sm@Mail.Linux-Consulting.com> wrote:

> 
> hi neal
> 
> > On Sun, 7 Jun 2015 08:04:40 -0700 (PDT)
> ....
> > > even if the src IP# might be spoof'd, you, i still do NOT want
> > > those incoming DDoS attacks coming in at 1,000 or 10,000 packets
> > > per second
> > 
> > Yes, 1000 rules is a little overboard.
> 
> and if there's 10,000 iptables rules, it's galacticly overboard ?
> 
> 	- it was also a test to see if iptables would fail
> 	and it didnt seem to break iptables

A few years ago, I tested iptables and a similar program. I used each
to add 250 000 rules (don't remember if I tried 1M). I found they had
to be added in batches of 15 000 to 20 000. (And it turned out that the
other program took about 5% less time than iptables to complete.)

> ...
> my other iptables todo would be to AutoExpire the DDoS attackers 
> to minimize the list of active ddos attackers  ... manually deleting
> the attackers that went away is for the birds :-)

IIRC, ipset has a way to auto-expire entries; I think it is a set
setting.

N
