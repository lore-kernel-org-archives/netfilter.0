From: Jason Opperisano <opie@817west.com>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 09:51:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096379474.2330.21.camel@wolfpack.ljm.dom>
References: <20040928051024.692C0BE3@sterenborg.info>
	<008601c4a553$4cd4ce60$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008601c4a553$4cd4ce60$936ffea9@alpha>
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
To: netfilter@lists.netfilter.org

On Tue, 2004-09-28 at 08:04, John Black wrote:
> > You say "it will not let me out". Is that out to the internet ?
> > I can't see the use for the above :
> > - You assign an ip alias to eth0:0
> > - You forward all traffic coming in on eth0 (that is directed to the
> > aliased ip 192.168.1.23) to 161.31.31.23
> > By doing this you won't get access to the internet.
> 
> but, how would you forward outgoing traffic to this address?  So 
> all traffic generated on 192.168.1.23 is see coming from 161.31.31.23?
> 
> john

it sounds like you're trying to do this:

  iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.23 \
    -j SNAT --to-source 161.31.31.23

-j

-- 
Jason Opperisano <opie@817west.com>


