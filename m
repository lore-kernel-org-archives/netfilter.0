From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec passthrough with iptables
Date: Tue, 15 Oct 2002 09:22:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021015082231.RBQR27697.mta05-svc.ntlworld.com@there>
References: <20021015044722.73838.qmail@web21205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021015044722.73838.qmail@web21205.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 15 October 2002 5:47 am, Thomas Smith wrote:

> I need to be able to connect to clients IPSec VPN from
> behind and iptables firewall. I know the VPN is
> working and my firewall is masquing traffic but IPSec
> doesn't work from systems behind my firewall.
>
> I've got a pretty basic firewall. It's simply masquing
> internal traffic.
>
> Are there some iptables' rules or patches I'm missing?

No patches needed.   No special support in netfilter needed.

Make sure you are forwarding (both ways :-) protocol 50 (ESP), protocol 51 
(AH) and UDP sport 500 / dport 500 (IKE).

Also make sure you are using IPsec in tunnel mode, not transport mode 
(transport mode will not work through NAT).

Hope this helps,

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

