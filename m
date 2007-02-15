From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Need help with iptables and iprange module
Date: Thu, 15 Feb 2007 13:56:42 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702151356270.786@yvahk01.tjqt.qr>
References: <b6d73fa90702141615y138d3f0dh176f309ca9ea74dd@mail.gmail.com>
	<20070215014932.d5815394.michel@mitch-it.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070215014932.d5815394.michel@mitch-it.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michel van der Klei <michel@mitch-it.com>
Cc: netfilter@lists.netfilter.org


On Feb 15 2007 01:49, Michel van der Klei wrote:
>> 
>> I try to install the crap-patch-o-matic, impossible to install without
>> 100 years of linux knowledge.
>
>Which kernelversion is there installed on your Debian machine. Since kernel
>2.6.18 it's no longer needed to run patch-o-matic. 
>
>modprobe ipt_iprange will do that trick for you.

And iptables will autoload it for you if it's there, so the trick is already
done.

Jan
-- 
ft: http://freshmeat.net/p/chaostables/

