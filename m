From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 13:09:07 -0700
Message-ID: <41DD9AE3.4060207@utilitran.com>
References: <200501061128.04741.patrick.leduc@novipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501061128.04741.patrick.leduc@novipro.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: patrick.leduc@novipro.com, netfilter@lists.netfilter.org

Hello,

	To run NTOP permanitly you just have to clear the stats nightly. I have 
a php script that makes a HTTP connection, downloads the stats from NTOP 
and saves them in a mysql database. It then makes another connection and 
tells NTOP to reset the stats.

That keeps the memory and CPU usage low ... so you could run it 
continuously.

Michael.


patrick.leduc@novipro.com wrote:
> Hello
> 
> Does somebody know a program for monitoring bandwidth by ip? I have one 
> internet interface and I must monitor many ips adresses on this interface. I 
> tried Ipac-ng and, I worked a lot to do this config but it seems not working 
> this way.
> 
> thanx
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

I make better friends with those who think for them selves

