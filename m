From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: [netfilter-core] ip6tables question
Date: Thu, 31 Mar 2005 14:07:47 +0200
Message-ID: <1403218a05033104077989a922@mail.gmail.com>
References: <200503301301.j2UD10rV019959@future.co.kr>
	<20050330152316.GH21867@sunbeam.de.gnumonks.org>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050330152316.GH21867@sunbeam.de.gnumonks.org>
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
To: Harald Welte <laforge@netfilter.org>, netfilter@lists.netfilter.org

On Wed, 30 Mar 2005 17:23:16 +0200, Harald Welte <laforge@netfilter.org> wrote:
> On Wed, Mar 30, 2005 at 10:19:11PM +0900, kesan wrote:
> > When is support NAT table for Ip6tables?
> 
> Only over my dead body.  We will never implement ipv6-to-ipv6 network
> address translation as long as I have any say in netfilter/iptables
> development.  NAT is evil and causes horrible breakage of end-to-end on
> the internet.  IPv6 has enough addresses and therefore no justification
> for NAT.
> 
> --
> - Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
> ============================================================================
>   "Fragmentation is like classful addressing -- an interesting early
>    architectural error that shows how much experimentation was going
>    on while IP was being designed."                    -- Paul Vixie
> 
> 
> 

One of the benefits of IPv6 is that we get ride of NATing, so, don't
think to re-use NATing in IPv6 networks.


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

