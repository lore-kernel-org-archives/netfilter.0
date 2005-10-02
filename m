From: Lore <skizzo82@yahoo.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Sun, 2 Oct 2005 14:15:54 +0200 (CEST)
Message-ID: <20051002121554.65988.qmail@web52801.mail.yahoo.com>
References: <Pine.LNX.4.61.0510011907310.15331@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510011907310.15331@filer.marasystems.com>
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

Hey man.
It works.
Thank You very much, Henrik.
It was about my degree thesis, You can't figure out
how much helpfull and important this was to me.

Thank You again.
thank you all.

Lore

--- Henrik Nordstrom <hno@marasystems.com> ha scritto:


> On Sat, 1 Oct 2005, Lore wrote:
> 
> > Hi, At the moment I'm not able to run the program
> as
> > root. But what follow is the code that shows me
> the
> > wrong IP.
> 
> >    printf("S_ADDR:%s,D_ADDR:%s\n",
> >                    inet_ntoa(iph->saddr),
> >                    inet_ntoa(iph->daddr));
> 
> inet_ntoa can not be used like this. Each call to
> inet_ntoa overwrites the 
> result string. (see man inet_ntoa)
> 
> The following will give better results:
> 
>      printf("S_ADDR:%s", inet_ntoa(iph->saddr));
>      printf(",D_ADDR:%s\n", inet_ntoa(iph->daddr));
> 
> Regards
> Henrik
> 



		
___________________________________ 
Yahoo! Messenger: chiamate gratuite in tutto il mondo 
http://it.messenger.yahoo.com

