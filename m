From: Jason Opperisano <opie@817west.com>
Subject: Re: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 16:28:58 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015202858.GA8079@bender.817west.com>
References: <20041015200157.GA7982@bender.817west.com>
	<20041015201413.71441.qmail@web21527.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015201413.71441.qmail@web21527.mail.yahoo.com>
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

On Fri, Oct 15, 2004 at 01:14:13PM -0700, kate wrote:
> so the drop-all would be..?
> 
> iptables -A INPUT -p TCP -i eth0 -s 0/0 -j DROP
> 
> or did I just invent my own thing here?
> tia
> Kate

well--the standard way would be to set the policy of the built-in chain
to DROP; i.e.,

  iptables -P INPUT DROP

the same can be achieved by making the last rule in the chain a drop
rule, like

  iptables -A INPUT -j DROP

but that gets messy if you want to append rules "on the fly" so the
policy method is preferred.

-j

-- 
Jason Opperisano <opie@817west.com>

