From: Alex Satrapa <alex@lintelsys.com.au>
Subject: [OT] Re: ISP Software
Date: Tue, 20 Jan 2004 09:58:59 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400C6133.7080703@lintelsys.com.au>
References: <007601c3de5c$2f9865a0$1300000a@lawrencewin2k>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007601c3de5c$2f9865a0$1300000a@lawrencewin2k>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lawrence Tang <ingsiong@daltron.com.pg>
Cc: Netfilter <netfilter@lists.netfilter.org>

Lawrence Tang wrote:
> Hi,
>     Can anybody advice me, which linux O/S is the best for my purpose 
> (providing internet broadband access) ?
>     The features that I need are :-
>     1. Billing base on MB Usage report on each host per month (every 
> port). User can check on the server by themselves
>     2. Firewall with NAT
>     3. Proxy

While strictly off-topic for this list, I'll bite.

We use Debian GNU/Linux for our ADSL services.

1) Billing is done by scripts that read the bytes up/down from each PPP 
interface on an hourly basis. This is stored in a Postgresql database

1a) Usage meters are custom-built - easy enough to do with tools like 
RRDTool or MRTG, or even just a graphics package like Perl GD::Graph.

2) Firewall with NAT - we use init scripts to set up the main firewall 
at system boot and ppp's ip-up scripts to set up per-connection 
firewalls, with the rules dynamically generated from a Postgresql database

3) Proxy - I've previously used Squid and OOPS.  OOPS is much simpler to 
configure, but not as feature rich - but OOPS does do inter-proxy 
communication so it works as a peer or parent to Squid.

Regards
Alex Satrapa
Lintel Intl Communications Systems


