From: Jason Opperisano <opie@817west.com>
Subject: Re: locally access server behind firewall
Date: Wed, 01 Sep 2004 14:08:02 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094062082.1824.49.camel@wolfpack.ljm.dom>
References: <41360CA0.6090109@tomdp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41360CA0.6090109@tomdp.com>
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

On Wed, 2004-09-01 at 13:53, Tom wrote:
> This works really well when I try to connect from the outside to my 
> webserver. But, if I try to connect to http://myserver.com:8888 from the 
> internal network (or from my server itself), I always get 'connection 
> refused'. I'm pretty sure I need some other rules, but can someone 
> please help me in the good direction here? Thanks a lot!!

because your server doesn't listen on port 8888--it listens on port 80. 
that's why you had to create the DNAT rule.

as far as trying to connect "from the internal network"--these packets
will go directly from LAN client to WWW server and never traverse your
firewall, so no DNAT can take place.  if you must be able to do
this--configure your WWW server to listen on port 8888 ("Listen 8888" in
apache).

NAT-ing of locally-generated packets on your firewall would require a
rule in the OUTPUT chain of the nat table:

        iptables -t nat -A OUTPUT -p tcp -d $EXTIP --dport 8888 \
          -j DNAT --to-destination $SERVER:8888
        
note:  i don't even know if that will work, as it requires the output
interface to change from external to internal and i vaguely recall that
this doesn't work cleanly without a patch.

-j

-- 
Jason Opperisano <opie@817west.com>


