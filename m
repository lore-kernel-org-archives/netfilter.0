From: a.ledvinka@promon.cz
Subject: Re: dnat with mac instead of ip address?
Date: Tue, 13 Jul 2004 13:46:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFECC7C3D2.669FB086-ONC1256ED0.003D8BE2-C1256ED0.0040B575@promon.cz>
References: <200407131200.03000.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407131200.03000.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

net with dhcp + dynamic dns updates of local zone + router with masquerade 
and single external address.

i am looking for regular DNAT behaviour to rewrite destination ip address 
of incoming packet but with single exception to current implementation: 
destination in rule is not explicitly ip address but hw address and i 
expect router to fetch ip address for this hw address from neighbour 
cache, etc. every time such packet comes.




Antony Stone <Antony@Soft-Solutions.co.uk> 
Sent by: netfilter-admin@lists.netfilter.org
13.07.2004 13:00
Please respond to
netfilter <netfilter@lists.netfilter.org>


To
netfilter <netfilter@lists.netfilter.org>
cc

Subject
Re: dnat with mac instead of ip address?






On Tuesday 13 July 2004 10:38 am, a.ledvinka@promon.cz wrote:

> has anyone seen it yet and where?

What are you trying to do?

Change the destination MAC address on a packet, without changing the IP 
address?

Netfilter can't do this sort of thing for you - either you need to put 
some 
static entries in your ARP table, or you need to configure the required 
MAC 
address on the destination machine.

I'm puzzled as to why you think you want to do this, though - what's the 
application?

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the 
list;
                                                           please don't CC 
me.






