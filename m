From: Jason Opperisano <opie@817west.com>
Subject: Re: [squid-users] squid iptables snmp
Date: Fri, 22 Oct 2004 11:28:06 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022152806.GA14687@bender.817west.com>
References: <1098440013.4380.40.camel@linux.d2visp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1098440013.4380.40.camel@linux.d2visp.com>
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

On Fri, Oct 22, 2004 at 03:43:34PM +0530, Joel n.solanki wrote:
> 
> Dear all,
> 
> I dont know wheather this problem is related to squid or iptables
> netfilter.
> But let me specify my problem. I tried my lots but i cant solve this
> problem. 
> 		
> 		
> Mrtg server	Squid + Netfilter box	Mikrotik Router
> 
> When I try to create mrtg for mikrotik router which is behind Squid +
> netfilter box, it gives me this error.

can you ping "Mikrotik Router" from "Mrtg server" when "Squid +
Netfilter" is between them?

is IP forwarding enabled on "Squid + Netfilter" box?

what is the default gateway of "Mrtg server"?

what is the default gateway of "Mikrotik Router"?

are you trying to NAT the traffic to "Mikrotik Router"?

-j

-- 
Jason Opperisano <opie@817west.com>

