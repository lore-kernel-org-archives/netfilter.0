From: Jason Opperisano <opie@817west.com>
Subject: Re: limiting bandwidth with iptables or squid?
Date: Sun, 24 Oct 2004 11:16:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098631001.9024.23.camel@hubcap.ljm.dom>
References: <web-486910273@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-486910273@mail01.infosat.net>
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

On Sun, 2004-10-24 at 10:20, it clown wrote:
> Hi All,
> 
> I would like to know how to limit bandwidth with iptables.I
> would like to limit bandwidth to ip's and mac address.Do i
> need another program to work with iptables or can iptables
> do it on its own?Does any one know where i can find
> something to read up on this?
> 
> If iptables can not do it can i do it with squid?

first off--you can't do "inbound" traffic shaping--only outbound.  you
cannot control how fast incoming packets hit your machine or how big
they are--you can only control how fast you allow them to leave.

that being said--read chapter 9 of:

        http://lartc.org/howto/
        
-j

-- 
Jason Opperisano <opie@817west.com>


