From: Michael Bellion <mbellion@hipac.org>
Subject: Re: nf-hipac v0.9.0: Couldn't load match
	`physdev':/lib/iptables/libipt_physdev.so: undefined symbol:
	parse_interface
Date: Fri, 7 Oct 2005 20:07:09 +0200
Message-ID: <200510072007.09465.mbellion@hipac.org>
References: <43451646.7040707@artcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43451646.7040707@artcom.pl>
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
Cc: =?utf-8?q?Pawe=C5=82_Staszewski?= <pstaszewski@artcom.pl>

Hi

> Some problems with physdev iptables match :
>
> gcc version 3.3.6
> kernel 2.6.12 (physdev is selected as module in kernel / netfilter)
> iptables 1.3.2 or 1.3.3
> nf-hipac v0.9.0
>
> commands:
>
> nf-hipac -m physdev --help
> nf-hipac -A FORWARD -m physdev --help
>
> i see error like this:
>
> nf-hipac v0.9.0: Couldn't load match
> `physdev':/lib/iptables/libipt_physdev.so: undefined symbol:
> parse_interface

Yes, sorry, the current version of the userspace tool does not export the 
parse_interface function.

I am currently at the netfilter workshop in Seville, Spain and I have a lot of 
hardware problems with my notebook :-(
I will fix your problem as soon as I return to Germany. Expect a patch on 
http://www.hipac.org on monday.

Thanks for your bug report
	Michael Bellion


