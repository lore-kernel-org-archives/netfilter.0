From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables traffic accounting...
Date: Tue, 07 Dec 2004 09:02:57 -0500
Message-ID: <1102428176.17387.3.camel@hubcap.ljm.dom>
References: <200412041353.20954.linuxguru@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412041353.20954.linuxguru@mail.ru>
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

On Sat, 2004-12-04 at 08:53, Vladimir S. Petukhov wrote:
> sorry for my english...
> How can I calculate total traffic from/to single process?
> It's easy to calculate outgoing traffic using --owner rule, but what's about 
> ingoing?
> process may be identify by PID & uid/euid/gid...

i *think* the "owner-socketlookup" patch from POM allows you to use "-m
owner" in INPUT.

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
	--The Simpsons


