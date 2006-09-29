From: Don Gould <don@bowenvale.co.nz>
Subject: Traffic Accounting on Small System and User Limits.
Date: Fri, 29 Sep 2006 15:42:43 +1200
Message-ID: <451C9633.1020805@bowenvale.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

This is a requirement for a small system I'm building for a local motel 
to be able to give internet access away free to their customers.

I have looked in to a bunch of different stuff but don't know the best 
way to go.  I know this might not even be the right list to ask on, so 
please be kind. :)

OPEN SOURCE GPL PLEASE - I have already done some work on some systems 
to get me what I want...  all the work I'm doing is on open source stuff 
and is/will be made available back to the community, so, if you have a 
need for this work as well but can't help, then please feel free to drop 
me a line and I'll keep you informed.

1. I want to keep a record of the amount of data each user uses over a 
given amount of time.  I know the users IP number and their MAC address. 
  I modified DNSMasq [1] to tell me this each time the user issues a 
DHCP request.

2.  It is proposed that each MAC will be given 50mb of data to use. 
After this the user/MAC will have to be authorised to have more.

The servers I'm using will run Debian Saige and are only small - p2 or 3 
with ~30 to 64mb ram and 2 - 3gb hard disk.  Each server only has to 
look after < 50 clients and in most cases wouldn't get more than 10 
using it at a time.

My problem is that I don't know how I should count the data used in a 
light weight way.

I've read that packet counting programs can be CPU intensive.

vnstat looked good but doesn't count by IP or MAC (from what I can see).


I read in some of the netfilter documentation (which is fantastic btw) 
that iptables can place limits on accounts, but didn't fully understand it.

Can anyone make any recommendations?

TIA

Cheers Don

[1] The code is rough and still have debug statements in it, see: 
http://www.tcn.bowenvale.co.nz/content/view/44/35/

I'm no C programmer so please don't flame me :)  Be kind :)

-- 
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz - 
www.bowenvale.co.nz - www.hearingbooks.co.nz - SkypeMe: 
ThinkDesignPrint - Good ideas:  www.solarking.co.nz


