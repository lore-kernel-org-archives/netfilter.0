From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Logging Portscans
Date: Mon, 21 Oct 2002 12:18:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021121814.G3805@funkyjesus.org>
References: <20021021093912.87487.qmail@web40709.mail.yahoo.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021021093912.87487.qmail@web40709.mail.yahoo.com>; from natasha3641@yahoo.com on Mon, Oct 21, 2002 at 02:39:12AM -0700
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

On Mon, Oct 21, 2002 at 02:39:12AM -0700, Tasha Smith wrote:
> Hii,
> I was wandering why iptables is NOT logging to my /var/log/messages/ NMAPS
> stealth port scans or when i telnet any port?.  Here are what the first part of
> my rules look like. How can u add some rules soo i can see (LOG) all ports scans
> or connection attemps on my machine????
> iptables 1.2.7
> kernel 2.4.19

Out of interest, why log all port scans?

Also, do keep a close eye on this when you get it working - depending on the
kind of site you're running iptables on you might find your logs filling up
*very* quickly.

<snip>

-- 
FunkyJesus System Administration Team


