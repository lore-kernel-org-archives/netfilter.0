From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: downlink marked packets dont go to qdisc, uplink ok
Date: Thu, 23 Dec 2004 01:16:40 +0000
Message-ID: <41CA1C78.2030502@dsl.pipex.com>
References: <41B97CCE.2060904@maxent.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B97CCE.2060904@maxent.cz>
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
To: Karel Rericha <karel@maxent.cz>
Cc: netfilter@lists.netfilter.org

Karel Rericha wrote:
> Short:**********************************************************
> 
> On Mandrake 10.0 router with htb shaping I have to use U32 classifier 
> for inserting
> packets to downlink qdiscs, because marking packets only work for uplink 
> qdiscs.
> Downlink packets are properly market, but always reach only default 
> class without
> U32. Why?

The LARTC list is back up now.

Maybe what you see is a quirk of shaping on br0 rather than a real 
interface. If you really need to mark then you could try using IMQ -
www.linuximq.net

Andy.



