From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: bandwidth monitoring
Date: Wed, 26 Jan 2005 10:33:31 -0800
Message-ID: <20050126183331.GA25316@ranjeet-pc2.zultys.com>
References: <200501061128.04741.patrick.leduc@novipro.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* patrick.leduc@novipro.com (patrick.leduc@novipro.com) wrote:
> Hello
> 
> Does somebody know a program for monitoring bandwidth by ip? I have one 
> internet interface and I must monitor many ips adresses on this interface. I 
> tried Ipac-ng and, I worked a lot to do this config but it seems not working 
> this way.
> 
> thanx
> 

Long term bandwidth usage can be tracked using MRTG. (stored data +
daemon + http server + web based gui)

Instantaneous bandwidth usage can be tracked using iftop. (ncurses)

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely those of
the author. The message contents have not been reviewed or approved by Zultys.


