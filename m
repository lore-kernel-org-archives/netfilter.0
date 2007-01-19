From: george <gk@t-t-l.co.uk>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 10:19:27 +0000
Message-ID: <1169201967.4807.11.camel@len.t-t-l.co.uk>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
	<45AF5186.9080201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AF5186.9080201@gmail.com>
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

Thanks Georgi,

I don't think I'd found this before although I do recognise parts of it.

One question arises - in Ch 6 it says connection tracking (coming in)
happens between raw and mangle tables, but in Ch 7 it says it's handled
in PREROUTING.

I'm still left with the "filter in filter table is how it was designed"
but nothing deeper (to answer the "use the source" response in advance,
I certainly don't have the time and I doubt I'd manage to make enough
sense of it either).  Also, the description of the filter table also
says that you may do prior filtering ...

Cheers,
George.

> george wrote:
> <snip>
> > Can anyone explain this to me, or point me somewhere that will tell me
> > please.  I haven't found anything other than a simple statement
> > anywhere.
> 
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES
> 


