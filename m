From: "David Burrow" <dnburrow@gmail.com>
Subject: ipset: Kernel configuration error? "Protocol unavailable"
Date: Sat, 22 Jul 2006 23:20:07 -0600
Message-ID: <edc15fb60607222220r6cd7ff6aw2439beedf0872b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

All,

I've got ipset patched in and running on a SUSE 10 box (vanilla 2.6.17
kernel from kernel.org).  I think, however, that I've misconfigured
something somewhere, as I'm getting the following error when I try to
creat a set of either iphash or nethash type:

I type in the example rule from the website http://ipset.netfilter.org/tips.html

>ipset -N foo iphash --resize 0

And I get the following error:

ipset v2.2.9: Error from kernel: Protocol not available

Any ideas where I should look for what I've done wrong?  I apologize
if you need more information from me, if so, just let me know and I'll
include it.

Thanks,

David

