From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 17:55:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16628.23121.334610.170889@saint.heaven.net>
References: <20040713205716.58900.qmail@web40707.mail.yahoo.com>
	<200407132218.06134.Antony@Soft-Solutions.co.uk>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407132218.06134.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone writes:
> On Tuesday 13 July 2004 9:57 pm, Real Cucumber wrote:
> 
> > Why should ICMP not be completely blocked? The machine
> > is used strictly as a port forwarding firewall/router.
> 
> Because blocking all ICMP will break networking.   Look up the RFCs explaining 
> what ICMP is for if you do not understand this.

I would like to second this vigorously, although I would phrase it
differently: blocking ICMP makes networks fragile.  Fragile networks
break easily when anything out of the ordinary happens.

--
Dick St.Peters, stpeters@NetHeaven.com 

