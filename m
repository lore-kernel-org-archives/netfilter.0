From: Jay Schulist <jschlst@linux-sna.org>
Subject: Re: [PATCH] flow statistic match
Date: Wed, 18 Sep 2002 03:46:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44L.0209180343220.10390-100000@hunger.screamingdaemon.com>
References: <20020918214152.SWHP295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020918214152.SWHP295.mta06-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Wed, 18 Sep 2002, Antony Stone wrote:

> > flow v1.2.7a options:
> >    --lt-packet  num             Match on less than 'num' packet.
> >    --lt-byte    num             Match on less than 'num' byte.
> >    --gt-packet num              Match on greater than or equal 'num' packet.
> >    --gt-byte   num              Match on greater than or equal 'num' byte.
>
> Consistency with other languages would suggest that --gt- means "greater
> than".   If you want "greater than or equal" use --ge-
>

We should probably add the syntax --eq- like the ttl match, to make things
even more conistent.

jay-s.


