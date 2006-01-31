From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: HTTP slower than SSH on client behind iptables
Date: Tue, 31 Jan 2006 16:33:52 +0100
Message-ID: <43DF8360.7070908@prosyst.com>
References: <20060131033519.GA32564@bostoncoop.net>	<43DF299D.9070105@prosyst.com>
	<43DF7017.8030008@rosi-kessel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF7017.8030008@rosi-kessel.org>
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
> (sorry, should have sent this to the list)
> 
> Boryan Yotov wrote:
> 
>>>On the NAT box, my Internet connection goes up to about 700 kilobytes per
>>>second, regardless of the protocol used (e.g., ssh or http). 
>>>On clients behind the NAT box, however, HTTP connections seem to top out
>>>around 70 kilobytes per second. ssh connections (e.g., rsync) get the
>>>full throughput of the Internet connection.
>>
>>Are you sure, you don't have some kind of a traffic shaping
>>active on the NAT gateway's internal interface?
>>For example: If tc is used, you could check that using:
>>tc class show dev <nat_box_internal_interface>
>>and
>>tc filter show dev <nat_box_internal_interface>
> 
> 
> I do have traffic shaping on the *external* interface, but it is not port
> dependent.
> 
> tc class|filter show dev <internal_interface> gives an empty response.
> 
> Also, when I clear the queue (I use wondershaper, so running wondershaper
> clear), it seems I still have the same problem.
> 
> ...But is there some way that outbound traffic shaping on the external
> facing interface could somehow impact *inbound* HTTP traffic on an internal
> client connected to the internal facing interface?

I looked shortly at wondershaper v.1.1a content.

1. In this version of the script I see no "clear" option, but only
"stop" and "status". Could you try "./wondershaper stop" and check
if it fix the problem. Or probably you have a newer one.

2. The wondershaper is using kilobits instead of kilobytes. If you
have a 700 kilobytes uplink, then you'll have to set UPLINK equal
to 5600. The same is valid for DOWNLINK.

3. In wondershaper I see a class with ID 1:30, which is shaping
traffic to a rate of "8*UPLINK/10". There is a filter attached to
it, which in the default config will shape traffic with source
port(s) as defined in NOPRIOPORTSRC (in the version I have it
defaults to port 80).

The main idea here is (no matter how impossible it sounds):

  + If the wondershaper's DEV is accidently set to match your
    internall interface

  AND

  + You did wrote 700 instead of 5600 as UPLINK value

  THEN

  = You'll have these 700 kbytes limited to exactly 70 kbytes for
    all HTTP responses going to your LAN clients.

You already mentioned, that you enable wondershaper on the external
interface only, but it is worth to check. It is not unusuall to have
internal iface configured on eth0 and external on eth1.

Hope some of these will help :)


