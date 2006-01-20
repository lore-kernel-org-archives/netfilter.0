From: Yermo Lamers <yml@dtlink.com>
Subject: Using iptables on a single NIC to map old IP addresses onto new.
Date: Fri, 20 Jan 2006 12:53:04 -0500
Message-ID: <43D12380.6080901@dtlink.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>> I want to map all ports on a.a.a.2 to b.b.b.2 and all ports
>> on a.a.a.3 to
>> b.b.b.3
>>
>> Can something like this be done using iptables if I only
>> have 1 NIC card and I do not have a physically separate
>> subnet?
>
> Why not use "ifconfig" (or "ip addr") to add multiple IP addresses (old
> and new) to the NIC ?
> Then, when the transition is complete, you just remove the old
> addresses.

That was my first thought. I bound a.a.a.2 and b.b.b.2 to the same box.
I obviously have two pipes. If I set the default route on the box to the
a.a.a.1 router I can ping a.a.a.2 from the outside but not b.b.b.2. If I
switch to the b.b.b.1 router the opposite happens.

arp cache has entries for both routers. I can ping both routers from the 
box in question.

I would have expected packets to come down either pipe and go out
whichever one happens to be the default gateway.

I've been assuming either it's some issue on the routers themselves or 
there is some issue with the 2.2 kernel and binding IPs from separate 
networks (old machine which I can't take down yet.) but it's been alot 
of long hours and little sleep so maybe I'm missing something stupidly 
obvious.


-- 
---------------------------------------------------------------------
DTLink Software                                 http://www.dtlink.com
              Internet Business Systems and Software
---------------------------------------------------------------------


