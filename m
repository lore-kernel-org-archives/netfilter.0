From: Steven M Campbell <SCampbell@Analysts.com>
Subject: Re: dnatting
Date: Wed, 13 Jul 2005 12:39:55 -0400
Message-ID: <42D543DB.6050002@Analysts.com>
References: <57F9959B46E0FA4D8BA88AEDFBE58290742E@pxtbenexd01.pxt.primeexalia.com>	
	<42D52A20.3090709@SCampbell.net>
	<12984bb00507130933624dd6e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12984bb00507130933624dd6e4@mail.gmail.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Donald Murray wrote:
>If the webserver is on the internal LAN, split DNS should resolve
>differently for internal versus external users. Because the internal
>users receive an IP for the internal LAN, the firewall is bypassed. No
>DNAT or SNAT duct tape required.
>
>If the webserver is in a DMZ... split DNS should again resolve
>differently for internal vs external users. Because the internal users
>receive an IP on a different subnet, their webserver traffic is routed
>through the firewall. Again, no DNAT/SNAT duct tape required.
>
>Does this sound correct?
>  
I concur.


