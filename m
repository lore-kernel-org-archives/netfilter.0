From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: HTTP slower than SSH on client behind iptables
Date: Tue, 31 Jan 2006 10:06:50 -0500
Message-ID: <43DF7D0A.30605@rosi-kessel.org>
References: <20060131033519.GA32564@bostoncoop.net>
	<43DF299D.9070105@prosyst.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF299D.9070105@prosyst.com>
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

(trying one more time; netfilter archive seems to have scrubbed the whole
message for PGP signature...) ... (sorry, should have sent this to the list)

Boryan Yotov wrote:
>> On the NAT box, my Internet connection goes up to about 700 kilobytes per
>> second, regardless of the protocol used (e.g., ssh or http). 
>> On clients behind the NAT box, however, HTTP connections seem to top out
>> around 70 kilobytes per second. ssh connections (e.g., rsync) get the
>> full throughput of the Internet connection.
> Are you sure, you don't have some kind of a traffic shaping
> active on the NAT gateway's internal interface?
> For example: If tc is used, you could check that using:
> tc class show dev <nat_box_internal_interface>
> and
> tc filter show dev <nat_box_internal_interface>

I do have traffic shaping on the *external* interface, but it is not port
dependent.

tc class|filter show dev <internal_interface> gives an empty response.

Also, when I clear the queue (I use wondershaper, so running wondershaper
clear), it seems I still have the same problem.

...But is there some way that outbound traffic shaping on the external
facing interface could somehow impact *inbound* HTTP traffic on an internal
client connected to the internal facing interface?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

