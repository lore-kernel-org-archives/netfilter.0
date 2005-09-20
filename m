From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: some addresses won't route
Date: Tue, 20 Sep 2005 09:06:27 -0500
Message-ID: <200509200906.27491.rob0@gmx.co.uk>
References: <432DBC78.8070504@theorb.net> <200509190912.51338.rob0@gmx.co.uk>
	<432F59FF.6010003@theorb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432F59FF.6010003@theorb.net>
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

On Monday 19 September 2005 19:38, iptables-user wrote:
> Thanks /dev/rob0!!!  I laughed so hard I felt like *I* was full of
> grog. (I'm part of a small circle of friends who talk like a pirate
> on a regular basis. P)

That's a good idea! I get rusty waiting for just one day a year. Brings 
to mind another holiday which should really be more than just one day: 
April Fools' Day.

Alas, me hook an' pegleg an' eyepatch an' cutlass are all stowed away.

> Everything now works without delay.  Apparently specifying the output
> interface in a FORWARD chain is not enough.  By modifying the rule to
> include -i AND -o things go where they're supposed to.  Everything

I wondered about this. I usually just do this by -i interface, and the 
return is covered by the RELATED,ESTABLISHED rule. But I thought your 
way should have worked too.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

