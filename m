From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: NAT & Multihoming Problem
Date: Tue, 05 Dec 2006 09:49:48 -0600
Message-ID: <4575951C.7050209@riverviewtech.net>
References: <117F5E7DA31C17478948DC39E01B948B400F22@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <117F5E7DA31C17478948DC39E01B948B400F22@frost.PlumSoftwareLtd.local>
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
To: Matt <Matt@PlumSoftware.co.uk>
Cc: netfilter@lists.netfilter.org

Matt wrote:
> Thanks for your replies, Grant & Luis

You are welcome.

> Grant - sorry, I attempted to make the rules list shorter so I must have missed out some important rules.

That is ok.

> The aim is that I'm trying to firstly get all traffic arriving at eth1 on the router to be NAT'd to an internal server and then replies sent back out on the same interface. Secondly - likewise for eth2 - all traffic arriving on eth2 to be replied on eth2, including any NAT'd traffic to the same internal server.

This seems fairly reasonable.

> Luis suggested that I mark the packets... So after checking out chapter 11 of the adv routing howto, I added the following lines:
> 
> $IPTABLES -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 11
> $IPTABLES -t mangle -A PREROUTING -i eth2 -j MARK --set-mark 12

It has been my (unsuccessfully) experience that MARKing inbound packets as 
they come in to a system does not necessarily ensure that returning outbound 
packets will be MARKed.  I believe this is where CONNMARK comes in to play 
to help maintain state of packet MARKs.  Rather that is to say that MARK is 
only maintained while packets are passing through the kernel.  Once a packet 
leaves the system any replies do not have the MARK associated with them.

Thus far in my career, I have only barely skimmed the surface of MARK and / 
or CONNMARK as I was able to do everything I needed to with IP Route 2 rules 
or plain routing.  As such, I'm probably not the best qualified to give you 
a complete answer on this topic.

I believe that you have to MARK the traffic as it passes through your router 
inbound to your server and save the MARK with CONNMARK.  Then have CONNMARK 
restore the MARK on the returning outbound traffic so that you can apply the 
usual rules / filters with the MARK.

> These lines occur after the SNAT lines, though I've tried above and below and it seems to make no difference.

Indeed.

> I also added the following routing rules:
> 
> ip rule add fwmark 11 table T1
> ip rule add fwmark 12 table T2

I have had very similar experience with a recent problem.  What I found was 
that outbound packets did have the correct IP SNATed to them.  However they 
were using the wrong interface to send the packets.  So, I wrote an ip rule 
to match based on the source IP rather than a MARK and things worked correctly.

> It still doesn't work.
> 
> There is a broken link in sect 11 of the adv routing howto that mentions that marking "collides" with SNAT and that I must turn off the reverse path filter. Could someone tell me whether this is relevant here?

A quick Google for "IPTables connmark" returns these top two links which may 
help shed some light on things for you.

http://home.regit.org/?page_id=7
http://home.regit.org/?page_id=20

> I would also like to mention that when I tcpdump on eth0, I can see the SYN packets arriving from my dial up account and being sent to the internal server, I can see the reply being sent from the internal server to the router and also a packet that duplicates the reply with the correct public IP of the dial up account... but for some reason this packet does not get sent out on eth2.

(*nod*  See above.)

> So I'm not sure whether this is a question for this list or a routing list... sorry.



Grant. . . .

