From: Jason Opperisano <opie@817west.com>
Subject: Re: [squid-users] squid iptables snmp
Date: Fri, 22 Oct 2004 12:31:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022163135.GA14944@bender.817west.com>
References: <1098440013.4380.40.camel@linux.d2visp.com>
	<20041022152806.GA14687@bender.817west.com>
	<1098460137.5034.23.camel@linux.d2visp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1098460137.5034.23.camel@linux.d2visp.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Fri, Oct 22, 2004 at 09:18:57PM +0530, Joel n.solanki wrote:
> Yes I can ping mikrotik router from mrtg server when squid + netfilter
> box is between them
> 
> I can even trace them.
> Yes IP forwarding is enabled on squid + netfilter box
> 
> No i m not doing NAT coz i have public ip addres so i m using that.
> 
> I have my setup with current scenario in other city and it is working
> fine.
> yes I have recompiled my kernel ...can kernel could be reason for this ?

run a tcpdump on the netfilter box on the interface facing the router
and make sure your snmp queries are making it through.

something like:

	tcpdump -n -p -i $router_side_int udp port 161

-j

-- 
Jason Opperisano <opie@817west.com>

