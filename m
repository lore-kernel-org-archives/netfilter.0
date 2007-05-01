From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Forking inside netfilter queue
Date: Tue, 1 May 2007 10:32:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705011030220.18504@yvahk01.tjqt.qr>
References: <4635EC8E.4090905@saudi.net.sa>
	<Pine.LNX.4.61.0704301547010.29151@yvahk01.tjqt.qr>
	<4636DE7E.80600@saudi.net.sa>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4636DE7E.80600@saudi.net.sa>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rayed <rayed@saudi.net.sa>
Cc: netfilter@lists.netfilter.org


On May 1 2007 09:30, Rayed wrote:
>
> Thanks Jan for the reply.
>
> I know how preforking works (almost), what I want to know if multi processes
> can access the same queue API without breaking anything.

Well, you should be aware that calling ipq_read() [or whatever it's
called now] in a thread may return a packet that does not actually
belong to the connection you created a certain thread for.
Maybe you even need to pthread_mutex_* around calls to ipq_*,
I am not sure if libipq (or whatever we use now) does that by
itself.


Jan
-- 

