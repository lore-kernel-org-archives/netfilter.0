From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Fri, 21 May 2004 11:19:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405211119.14458.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201844.49709.Antony@Soft-Solutions.co.uk> <200405211130.21108.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405211130.21108.liste@zerozone.it>
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
To: netfilter@lists.netfilter.org

On Friday 21 May 2004 10:30 am, O-Zone wrote:

> On Thursday 20 May 2004 19:44, Antony Stone wrote:
> > The same applies to your FORWARDing rules as well, by the way, so these
> > will need changing before the packets can get through your firewall to
> > their destination.
>
> OK ! Thanks a lot...now all works perfeclty. But i still have a problem
> with UDP. My DNS server inside DMZ, 192.168.0.2 ($DMZ_SIENA_IP), is mapped
> to two public ip:
>
> 151.8.47.A ($SIENA_IP)
> 81.113.95.B ($SIENA2_IP)

How do you route reply packets from those two public IPs back to the sender?

Netfilter will correctly apply reverse nat rules to reply packets which are in 
response to original packets matching nat rules in your ruleset - therefore 
if you map both the above public IPs to a single DMZ private IP, reply 
packets will be correctly reverse natted to have the appropriate public 
source IP.   However, you may need to make sure that packets with one source 
IP go via one ISP and those with the other source IP go via the other ISP 
(I'm assuming here that you have two entirely different public IPs because 
you have Internet connections from two ISPs?), as both ISPs may drop packets 
which have source addresses outside the range they have allocated to you (or 
which have been allocated to the ISP).

If you haven't already looked into iproute2 at http://lartc.org now would be a 
good time to find out about it.

Regards,

Antony.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


