From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Total dropped packet count
Date: Fri, 17 Feb 2006 11:15:38 -0800
Message-ID: <BAY106-F3432AE74D95FBC338D3533D6F80@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

Is there a way to get from iptables/netfilter the total number of dropped=20
packets?

The way we do this at the moment is with a script that:

1) Lists all the rules
2) Finds within that list all rules whose target is DROP
3) Adds up the packet count for each of those rules

This seems to work okay but it is cumbersome.

I'm hoping there's some nice little /proc counter or iptables command that =

will give me the total count of dropped packets.

Thanks,

Andrew Kraslavsky

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/


