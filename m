From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: dnatting
Date: Mon, 11 Jul 2005 13:38:39 -0500
Message-ID: <42D2BCAF.4040906@gmx.co.uk>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
	<Pine.LNX.4.61.0507111720230.26881@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507111720230.26881@yvahk01.tjqt.qr>
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

Jan Engelhardt wrote:
>>I have a rule on my friend's broadband connection to redirect traffic 
>>from outside to an internal machine like,
> 
>>iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 80 -j DNAT  \
>>--to-destination 192.168.10.10:80
>>
>>But she complained that people from inside the network cannot do
>>http://1.2.3.4 in their browser and see the site. Is she correct?
>>What is wrong with my rule because I can see the site from outside?
> 
> The packet must pass the machine the DNAT rule is on to make the dnat 
> effective.

And then there should be a filter table rule to ACCEPT those packets, or 
at least nothing to DROP or otherwise not accept them.

With a typical (Packet-Filtering-HOWTO-inspired) firewall with default 
DROP policy in FORWARD, you need a corresponding ACCEPT rule in FORWARD 
for every DNAT. In crafting such rules remember that the destination has 
already been rewritten in nat/PREROUTING.

The Web proxy suggestion has me puzzled. :)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

