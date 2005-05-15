From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: Iptables as packet shaper
Date: Sun, 15 May 2005 08:58:28 +0300
Message-ID: <000501c55913$1d8da540$f00aa9c0@winxp>
References: <001901c5587b$53a2ff60$f00aa9c0@winxp>
	<20050514153904.GA24505@bender.817west.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

If  im not mistaken TC require iptroute 2. If im already using iptables for 
my routing, firewall and NAT, do I need to disable iptables for iproute2 or 
iptables and iproutes works hand in hand

thanks,

wennie

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, May 14, 2005 6:39 PM
Subject: Re: Iptables as packet shaper


> On Sat, May 14, 2005 at 02:51:55PM +0300, Wennie V. Lagmay wrote:
>> Hi all,
>>
>> Im using iptables to filter, translate IP address and forward traffic, 
>> Im
>> using squid delay_pool to limit client access per user and per network, 
>> but
>> im having a limitation with the squid delay_pool. I want to have a packet
>> shaper that can can allow my user to have 32 kbps during peer time and 
>> 256
>> during off peek time. Delay_pool is not capable of that. Can IPTABLES do
>> this kind of shaping?
>
> no--bandwidth management is not the job of iptables, it is the job of tc
> from the iproute2 package.  details are at:
>
>  http://lartc.org/howto/lartc.qdisc.html
>
> lartc also has their own ML:
>
>  http://lartc.org/#mailinglist
>
> -j
>
> --
> "Peter: Wow, is that really the blood of Christ?
> Preacher: Yes, it is.
> Peter: Holy crap, that guy must've been wasted 24 hours a day."
>        --Family Guy
> 


