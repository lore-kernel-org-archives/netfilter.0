From: "Alexis" <alexis@attla.net.ar>
Subject: Re: Please explain the limit match
Date: Sun, 1 Feb 2004 18:28:22 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c3e90a$52986650$0200000a@heretic>
References: <002101c3e908$0eb37d00$c800a8c0@klintan.cjb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

suppose a limit for pings with limit=1/s and limit burst=5

first 5 pings will pass, then, if you have a 2s timeout with the ping, youll
get 3 of 5 pings

this is first you need to "full" the burst counter, then if no activity is
received the burst will start to decrease until a new unit could match.

did you saw this?

http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html#ss7.3




----- Original Message ----- 
From: "Michael Klinteberg" <micke@klintan.se>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, February 01, 2004 6:12 PM
Subject: Please explain the limit match


> I have read the man page over and over again for the iptables limit
> match. Don't quite understad the --limit and --limit-burst.
>
> Can anyone please give me some easy LOGing examples with diffrent
> time-intervalls.
>
> -- 
> Thank you
> Michael K
>
>



