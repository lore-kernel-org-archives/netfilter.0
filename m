From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Sat, 1 Oct 2005 19:46:17 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510011907310.15331@filer.marasystems.com>
References: <20051001161831.75220.qmail@web52810.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051001161831.75220.qmail@web52810.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Lore <skizzo82@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Lore wrote:

> Hi, At the moment I'm not able to run the program as
> root. But what follow is the code that shows me the
> wrong IP.

>    printf("S_ADDR:%s,D_ADDR:%s\n",
>                    inet_ntoa(iph->saddr),
>                    inet_ntoa(iph->daddr));

inet_ntoa can not be used like this. Each call to inet_ntoa overwrites the 
result string. (see man inet_ntoa)

The following will give better results:

     printf("S_ADDR:%s", inet_ntoa(iph->saddr));
     printf(",D_ADDR:%s\n", inet_ntoa(iph->daddr));

Regards
Henrik

