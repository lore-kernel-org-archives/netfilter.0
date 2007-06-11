From: Olivier <olivierk@club-internet.fr>
Subject: Re: --match recent
Date: Mon, 11 Jun 2007 20:12:13 +0200
Message-ID: <20070611181213.GA12937@vvma.net>
References: <mnet1.1181553816.24811.olivierk@club-internet.fr>
	<466D5578.8070905@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <466D5578.8070905@riverviewtech.net>
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

Hello Grant,

Thanks for youy response.

> Just a quick guess, but it looks like you are matching all SSH
> packets, not just those of a connection trying to be established.

I was thinking I was:

 1. Letting NEW packet just pass ('la' stands for log&accept) but
    counting them. (those I take are initiating the client connection
    to the server)

 2. Limiting those NEW paquets at 5 every 60 seconds. ('ld' stands for
    log&drop)

I intend to count/limit only connection initiations, leaving alone the
rest. I can't figure out where I catch more than I think I catch.

Best regards,

-- 
Olivier K

