From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: displaying connections recognized by the conn.-tracking module possible?
Date: Sun, 22 Aug 2004 22:10:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040823021009.GA7531@tranquility.scriptkitchen.com>
References: <200408211759.50531.shirai@kawo1.rwth-aachen.de> <200408221816.53845.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200408221816.53845.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Sun, Aug 22, 2004 at 06:16:53PM +0100, Antony Stone wrote:
> > nat) I mean perhaps a similar output than "netstat -t" does, when showing
> > all current tcp-connections on a host. Or perhaps is this listed somewhere
> > in the /proc filesystem?
> 
> cat /proc/net/ip_conntrack

On my Mandrake 10.0 machine I get,
# cat /proc/net/ip_conntrack
cat: /proc/net/ip_conntrack: No such file or directory

-Payal

