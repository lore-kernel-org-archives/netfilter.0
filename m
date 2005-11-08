From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables on DLink DSL-502T Modem/Router
Date: Tue, 8 Nov 2005 15:16:20 -0600
Message-ID: <200511081516.21132.rob0@gmx.co.uk>
References: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
	<200511072031.46307.rob0@gmx.co.uk>
	<cc8f3f150511081239x4bd4d8favd7e2807f0748711c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc8f3f150511081239x4bd4d8favd7e2807f0748711c@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Please do not top-post. Thank you.

On Tuesday 2005-November-08 14:39, Paul Goodyear wrote:
> Thanks for the reply, that would explain a few things. I did try the
> rule in both INPUT and FORWARD chains, but neither worked, I took a
> guess that it would be INPUT to use so I posted with that chain.

There is no need to guess when we have "man iptables" at our 
fingertips. :)

> Order, when I do a iptables -L -n I can see my rule, but it is always
> at the bottom of the pile, so this might be the whole issue. How do I
> know what <ruleid> the other rules are so I can add above them?

"iptables -h" gives a brief syntax overview. The "--line-numbers" 
option, available in recent versions of iptables, can help. With older 
versions, I just list the rules and count them manually!

> I have read the -A param is "to add a rule at the end of the chain"
> how do I add at the begining of the chain?

In Jim's reply and also in "iptables -h" and "man iptables".
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

