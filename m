From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables & ifconfig wrong packet accounting
Date: Mon, 13 Dec 2004 16:04:22 -0500
Message-ID: <1102971862.3629.23.camel@hubcap.ljm.dom>
References: <c65016fb041212222114c8a41f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c65016fb041212222114c8a41f@mail.gmail.com>
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

On Mon, 2004-12-13 at 01:21, jorge alonso wrote:
> i'm trying to do traffic accounting with iptables but the received
> packets from iptables (iptables -L -v) and packets from ifconfig dont
> match.
> ifconfig counts more packets is it normal ?

my guess would be that 'ifconfig' counts packets such as arp and dhcp 
requests/replies that never make it up to the netfilter hooks.

-j

--
"Default! The two sweetest words in the English language!"
	--The Simpsons


