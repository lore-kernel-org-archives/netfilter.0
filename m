From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: IPSec Protocol 4 (ipcomp) traffic dropped
Date: Fri, 19 Jan 2007 09:18:50 +0100
Message-ID: <BAY103-DAV86A191E36A821C4BB0869B2A90@phx.gbl>
References: <4430.10.11.1.250.1169140123.squirrel@www.dpdo.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew J. Millar" <am@dpdo.com>
Cc: netfilter@lists.netfilter.org

Andrew J. Millar wrote:

> Basically, IPtables is seeing, and dropping protocol 4 (IP Payload
> Compression Protocol) packets relating to an OpenSwan IPSec tunnel as

Yes, it a know problem to the netfilter
team since 2.6.16-rcX
(https://lists.netfilter.org/pipermail/netfilter-devel/2006-February/023
387.html)

> Only when I add a rule to allow protocol 4 on HOST-A as follows, is
the
> attempt to reach HOST-A:22 successful.
>
> iptables -A INPUT -s BBB.BBB.BBB.BBB -d AAA.AAA.AAA.AAA -p 4 -j ACCEPT

Yes, this is a good workaround (for now).



