From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: Re: Understanding how nat works
Date: Tue, 21 Sep 2004 07:30:29 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040921143029.95267.qmail@web51308.mail.yahoo.com>
References: <1095776129.3572.1.camel@coati>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095776129.3572.1.camel@coati>
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
To: netfilter <netfilter@lists.netfilter.org>

Oh ya.  That would make sense. :)

I know it doesn't sound like much but it kicked some
thought into gear.

Thanks
--- Eric Leblond <eric@inl.fr> wrote:

> On Tue, 2004-09-21 at 16:02, Dominic Iadicicco
> wrote:
> > "iptables -t nat -A POSTROUTING -s 172.16.12.131
> -o
> > eth0 -j SNAT --to 172.16.12.167"
> 
> so when packet leave your computer they came from
> 172.16.12.167 ?
> This is not an IP of your computer, it can not
> receive the answer.
> -- 
> Eric Leblond <eric@inl.fr>
> INL
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

