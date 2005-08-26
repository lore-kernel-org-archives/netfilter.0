From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: disabling conntrack ...
Date: Fri, 26 Aug 2005 08:16:36 -0500
Message-ID: <200508260816.37081.rob0@gmx.co.uk>
References: <B81183566FF73947875C3A207CD60AA61DFAE4@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B81183566FF73947875C3A207CD60AA61DFAE4@LONEX01.tideway.com>
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

On Friday 2005-August-26 07:20, Kerryn Wood wrote:
> I need to disable connection tracking and, although I've seen an old

Oh my, what a strange need this is! Tell us why you think you need it, 
and we can answer your questions more effectively (likely explaining 
why you are wrong.)

> I *think* I've removed all the connection tracking modules from
> /lib/modules/<kernel version>/kernel/net/ipv4/netfilter/ (I removed
> all ip_conntrack* files).

Ouch. This is a reckless approach to system administration. Do not 
delete files whose purpose you do not understand.

> When I try and start iptables again I get an error from
> iptables-restore. The error message is: "line 57 failed".

The rule on line 57 of your iptables-restore rules (check your OS 
documentation to find out where that file is) depends on connection 
tracking. My crystal ball tells me it's a MASQUERADE rule.

> I'm running FC3, kernel version 2.6.10-1.766 with iptables version
> 1.2.11.

As was suggested already, use the raw table NOTRACK target to bypass 
connection tracking for the traffic you specify.

> Is there a FAQ or information documented on how to do this (that's
> I've missed and will be wholly embarrassed when you point it out)?
> Does anyone have any experience doing this they could share?

Good heavens no! Connection tracking is the jewel in netfilter's crown. 
Why would I want to disable it?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

