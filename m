From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Tightening up outgoing traffic
Date: Tue, 15 Oct 2002 15:31:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021015153147.E3805@funkyjesus.org>
References: <1034686034.15446.38.camel@localhost.localdomain> <1034687894.8681.53.camel@Wiggum>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1034687894.8681.53.camel@Wiggum>; from list@laasby.com on Tue, Oct 15, 2002 at 03:18:14PM +0200
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Oct 15, 2002 at 03:18:14PM +0200, Kjetil Andreas Laasby wrote:
> Problably because yahoo.com lies in your local DNS cache or on an cache
> server behind your firewall.
> 
> add
> iptables -A OUTPUT -p tcp --destination-port domain -j ACCEPT
> iptables -A OUTPUT -p udp --destination-port domain -j ACCEPT

Note the rules for tcp and udp here, it's worth opening both up in case your
DNS query needs a large reply.

> You should also open up RELATED ICMP to minimize delay for errors.

Seconded.

-- 
FunkyJesus System Administration Team


