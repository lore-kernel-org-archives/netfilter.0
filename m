From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Fwd: Routing to and from an IP on an interface
Date: Wed, 14 Mar 2007 03:05:03 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703140304470.20730@yvahk01.tjqt.qr>
References: <1173760381.45f6297d9a03d@mail.dreamtoy.net>
	<slrnevcv6v.610.xpisar@album.ics.muni.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrnevcv6v.610.xpisar@album.ics.muni.cz>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Pisar <xpisar@fi.muni.cz>
Cc: netfilter@lists.netfilter.org


On Mar 13 2007 10:28, Petr Pisar wrote:
>On 2007-03-13, Nathan @ Netdigix Systems <lists@netdigix.com> wrote:
>> Hi I have an issue where the internal interface wants to always talk
>> from the primary ip address,  what kind of rule can I add to make the
>> traffic comming from a specific source ip leave the router interface
>> from a specific secondary ip address?
>>
>Source IP address, if not specified by bind(2), depends on routing
>table.
>
>You can add rule which specifies source address explicitly like this:
>
>ip route add default via <MY_GW> dev <OUT_DEV> src <SRC_IP>
>
>Maybe, the dev part is optionable.

You can also use netfilter's SNAT to force a specific IP on outgoing
connections.


Jan
-- 

