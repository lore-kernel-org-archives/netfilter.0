From: Jason Opperisano <opie@817west.com>
Subject: Re: How to flush the connection state in the linux
Date: Mon, 27 Dec 2004 11:22:28 -0500
Message-ID: <1104164548.6322.20.camel@hubcap.ljm.dom>
References: <000b01c4ebe5$64dab730$aa0ba8c0@l7.com.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000b01c4ebe5$64dab730$aa0ba8c0@l7.com.tw>
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

On Mon, 2004-12-27 at 02:26, Vincent wrote:
> Hello,
> 
> Does any one know how to flush the connection state in the linux (Not
> flush iptables rule -F).
> I used transparent mode in the linux (use brctl to bridge eth & eth1).
> When I tried to use iptables to drop some specified packet and it was
> fail.
> So I doubt there are some established connection state exist in the
> linux to pass these
> Forbidden connections.
> 
> My enviroment
> Linux 2.4.25
> Iptables 1.2.11 

you need to remove the "ip_conntrack" module.

in order to do that--you need to remove all the modules that use it
(like 'iptable_nat' etc).

-j

--
"'Nuke the whales?' You don't really believe that, do you?
 I dunno. Gotta nuke something."
	--The Simpsons


