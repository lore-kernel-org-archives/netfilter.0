From: Alan Garrison <alang@cronosys.com>
Subject: Using the "recent" module to stop ssh/ftp attacks
Date: Wed, 27 Sep 2006 10:28:53 -0400
Message-ID: <451A8AA5.7010301@cronosys.com>
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

I've used the "recent" trick to keep out bulk login attempt, 
particularly for some publically accessable FTP sites my company runs:

-A INPUT -p tcp --dport 21 -m state --state NEW -m recent --set
-A INPUT -p tcp --dport 21 -m state --state NEW -m recent --update 
--seconds 600 --hitcount 10 -j DROP
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

It works fine on basic server setups, however I've seen this not work 
properly on machines that have ethernet aliases ("eth0", "eth0:1", etc). 
   Basically it blocks either too soon or just blocks the port 
completely even on the first attempt.  Does the exact network alias need 
to be specified in the rules for these cases, or is there some other 
limitation I may not be aware of?


-- 
Alan Garrison <agarrison@cronosys.com>
(216) 221-4600 x 308

