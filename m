From: Christer Ekholm <chrekh@bredband.net>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 03 May 2004 08:15:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86ad0qt4rn.fsf@poke.localdomain>
References: <16533.31553.47397.464571@jane.localdomain>
	<200405030005.33281.Antony@Soft-Solutions.co.uk>
	<86y8oatnsf.fsf@poke.localdomain>
	<200405030045.56089.Antony@Soft-Solutions.co.uk>
	<86u0yytkrb.fsf@poke.localdomain> <20040503021343.GJ4200@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040503021343.GJ4200@samad.com.au> (Alexander Samad's message
 of "Mon, 3 May 2004 12:13:43 +1000")
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

Alexander Samad <alex@samad.com.au> writes:

>
> On a different thought can't you tell your mta to bind to a specific
> interface or use a specific address ( I can with exim)

Thankyou!

The simple logical solution, which i was totally blind for. I just
need to have my postfix configured with:

smtp_bind_address = 217.215.183.181

I works!
And I don't have to do anything magical with routing or iptables.

--
 Christer

