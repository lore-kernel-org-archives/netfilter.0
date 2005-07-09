From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Sat, 9 Jul 2005 12:23:00 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507091222140.17775@yvahk01.tjqt.qr>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
	<20050708200937.GA7325@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050708200937.GA7325@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


>> This chain has 30 characters... the max.. if I reduce it to 28, it's added 
>> wihtout any problem.
>
>(note:  your OP said the error was with the 28 char chain)
>
>it looks like 29 characters is the max:

It's documented:

       --log-prefix prefix
              Prefix  log messages with the specified prefix; up to 29 letters
              long, and useful for distinguishing messages in the logs.

So I guess there's more places with the 30 limit (read: 1 for the '\0' char).



Jan Engelhardt                                                               
--                                                                            
| Alphagate Systems, http://alphagate.hopto.org/


