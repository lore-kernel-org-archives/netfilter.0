From: Jason Opperisano <opie@817west.com>
Subject: Re: Multiple Source IP Addresses
Date: Fri, 11 Mar 2005 14:49:51 -0500
Message-ID: <1110570591.4767.57.camel@hubcap.ljm.dom>
References: <201E6F5AC48C274996A5AD8304FAEF869A04@p001ex03.porta.local>
	<20050311114010.7d7207ec.daliev@etecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050311114010.7d7207ec.daliev@etecom.com>
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

On Fri, 2005-03-11 at 14:40, Dennis O. Aliev wrote:
> Baake,
> 
> Thank you for reply.
> 
> What you suggesting will take care of routing incomming packets (from internet) to web server. In my scenario, I have a bot that parses sites and so the packets are coming from webserver to internet and source addresses must be different to load balance between internet connections.

use multiple "--to-source" options in your SNAT rule:

  iptables -t nat -A POSTROUTING -o $EXT_IF -s $WEB_SRV_IP \
    -j SNAT --to-source $EXTIP1 --to-source $EXTIP2  --to-source $EXTIP3

outbound connections will round-robin between the source addresses.

-j

--
"Alright brain, you don't like me and I don't like you. But let's just
 get through this and then I can get back to killing you with beer."
	--The Simpsons


