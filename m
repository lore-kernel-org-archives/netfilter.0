From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: No internet connection
Date: Thu, 9 Sep 2004 17:00:53 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909160053.GN8419@metastasis.org.uk>
References: <20040909144044.27300.qmail@web50208.mail.yahoo.com>
	<1094742137.14416.3.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1094742137.14416.3.camel@wolfpack.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Thu, Sep 09, 2004 at 11:02:18AM -0400, Jason Opperisano wrote:
> On Thu, 2004-09-09 at 10:40, Giancarlo Boaron wrote:
> > Ok. I made my iptables script and I forgot to handle
> > the DHCP protocol. So, my firewall box gets its IP
> > address via DHCP. Thats a nice thing to test.
> 
> for the sake of the list archives:
> 
>   # DHCP server -> client
>   iptables -A INPUT -p udp --sport 67 --dport 68 -j ACCEPT
> 
>   # DHCP client -> server
>   iptables -A OUTPUT -p udp --sport 68 --dport 67 -j ACCEPT

Not wishing to be paranoid, buuuuuuuuutttttttt..... couldn't you
usefully restrict those by source and destination IP?

-- 
mors omnia vincit

