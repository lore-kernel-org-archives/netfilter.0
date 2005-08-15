From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Mon, 15 Aug 2005 01:51:38 -0500
Message-ID: <43003B7A.4040404@riverviewtech.net>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>	<42FBB957.30003@rosi-kessel.org>	<42FC2D70.7000701@riverviewtech.net>	<42FC9F1B.4060204@rosi-kessel.org>	<42FD95F9.4070504@riverviewtech.net>
	<20050813131224.GD25192@bostoncoop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050813131224.GD25192@bostoncoop.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Interesting. Are there any pre-packaged ways to do this? This sounds like
> perhaps the least complex solution, once it's actually implemented.

Pre-packaged solutions?  Um, sure, it's called Linux.  :P  No, I don't know of any ""pre-packaged solutions.  What there are is pre made building blocks that you can put together in to your own solution.

> That could work. I'm really only worried about DNS, HTTP, HTTPS, SMTP,
> POP3, IMAP, and SSH. So I could redirect all those ports to different
> ports on on faketarget (DNAT), then back to the real ports on realtarget
> (using REDIRECT target?).
> 
> Can you give me an example (or point me to a URL) of what rules I would
> need to run on realtarget to MARK the connections and then decide which
> routing table to use?  Are we just talking about iptables commands, or is
> there something additional that is required?

This is the command that you would need to run on the fake target to do the up and over part:

iptables -t nat -A PREROUTING -i $INet -d $FakeTargetIP -p tcp --dport 22 -j DNAT --to-destination $RealTargetIP:2222

This is the corresponding command that you would need to run on the real target to do the down and in part:

iptables -t mangle -A PREROUTING -i $INet -d $RealTargetIP -p tcp --dport 2222 -j MARK --set-mark $Mark
iptables -t nat -A PREROUTING -i $INet -d $RealTargetIP -p tcp --dport 2222 -j REDIRECT --to-ports 22

I'm not sure if you want the MARK target or the CONNMARK target as I have not worked with either of them.  But I think you see what I'm trying to accomplish with them.  As far as the rule, a little bit of reading should explain that (I'd have to do the reading my self at this hour).



Grant. . . .

