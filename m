From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: HTTP slower than SSH on client behind iptables
Date: Wed, 08 Feb 2006 18:16:40 +0100
Message-ID: <43EA2778.3020301@prosyst.com>
References: <20060131033519.GA32564@bostoncoop.net>	<43DF299D.9070105@prosyst.com>	<20060202145613.GA12056@bostoncoop.net>
	<20060208004630.GA10508@bostoncoop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060208004630.GA10508@bostoncoop.net>
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

Adam Rosi-Kessel wrote:
> On Thu, Feb 02, 2006 at 09:56:13AM -0500, Adam Rosi-Kessel wrote:
> 
>>On Tue, Jan 31, 2006 at 10:10:53AM +0100, Boryan Yotov wrote:
>>
>>>>On clients behind the NAT box, however, HTTP connections seem to top out
>>>>around 70 kilobytes per second. ssh connections (e.g., rsync) get the
>>>>full throughput of the Internet connection.
>>>>As far as NAT goes, I don't hvae any special settings.
>>>>Can anyone think of an explanation for this behavior? It doesn't make any
>>>>sense to me.
>>>
>>>Are you sure, you don't have some kind of a traffic shaping
>>>active on the NAT gateway's internal interface?
>>>For example: If tc is used, you could check that using:
>>>tc class show dev <nat_box_internal_interface>
>>>and
>>>tc filter show dev <nat_box_internal_interface>
>>
>>I figured it out. Apparently I was missing some kernel modules that were
>>causing wondershaper to behave oddly. I rebuilt the kernel with all QOS
>>and netfilter configuration options enabled (or built as modules) and now
>>internal clients can download HTTP at full speed. I suspect there was
>>some option that was causing tc to not distinguish between interfaces
>>despite the fact that wondershaper instructed it to only throttle the
>>external interface. I'm not sure exactly which kernel setting fixed it,
>>but it is now fixed.
> 
> 
> Actually, I didn't figure it out! Apparently, just rebooting the NAT
> system returns everything to full speed. Something happens, either over
> time, or as the result of some occasional event, that causes internal
> connections to be throttled. Any ideas what this could be?
> 

A good starting point is to retrieve the "tc" status, first
when the NAT gateway is restarted and performs correctly, and
once more when you notice that your client are receiving their
HTTP responses throthled.

To get a complete picture of the "tc" status, first retrieve
the qdisc assigned to each interface:

   # tc qdisc  show

And then retrieve the classes and assigned filters for each
of the interfaces shown in "tc qdisc show":

   # tc class  show dev <NEXT_DEVICE>
   # tc filter show dev <NEXT_DEVICE>

Once you have both states, then check if there is a differense
between them.

The idea here is to make sure your "tc" setup is not becoming
corrupted, when your external link need to be renegotiated (in
case of dynamic IP address assignment found with DSL and Cable
modems).




Another thing worth to try is to check if you use the CBQ based
version of the wondershaper script. If true, then switch to the
HTB version and see if it performs better.

