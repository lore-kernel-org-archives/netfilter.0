From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: Re: Limit module accept negation?
Date: Thu, 13 Jan 2005 19:08:53 -0500
Message-ID: <41E6C745.7555.2118F01@localhost>
References: <41E2E0CB.18071.252B3E2C@localhost>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <30044.142.169.215.10.1105539632.squirrel@142.169.215.10>
Content-description: Mail message body
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

Hi Samuel

Yes, I want to limit (drop) as soon as we receive more than 1/s packet
regardless of the source address?, Is there any other way to do that without using
limit match with negation?

Regards
 
On 12 Jan 2005 at 9:20, Samuel Jean wrote:

> On Mon, January 10, 2005 8:08 pm, Jorge Agrelo said:
> > Can I replace this two rules
> >
> > iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j
> > ACCEPT
> > iptables -A INPUT -p tcp --syn -j DROP
> >
> > For only this one? (Using negation)
> >
> > iptables -A INPUT -p tcp --syn -m limit ! --limit 1/s --limit-burst 4 -j
> > DROP
> 
> Unfortunately, you can't without a bit of hacking.
> If it happens you would, just grab ipt_limit.c and search for:
> 
> /* We're underlimit */
> 
> Change the return codes so it returns 0 when 'underlimit', otherwise, 1.
> Am sorry if this is straigh, I am at work.
> Note that this won't add '!' support but just doesn't match unless it
> bursts the limit.
> 
> By the way, do you want to limit as soon as you receive more than 1/s packet
> regardless of the source address?
> 
> >
> > Thanks in advanced
> 
> HTH,
> 
> Samuel
> 
> 




