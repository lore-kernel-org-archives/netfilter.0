From: Clist <clist@uah.es>
Subject: Re: LOG Rate Limit Problem
Date: Tue, 5 Oct 2004 12:25:34 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410051225.34091.clist@uah.es>
References: <Pine.LNX.4.58.0410042052580.10057@ris713.UniXpress.com>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0410042052580.10057@ris713.UniXpress.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

duplicate the rule that limits, first log and then drop with the same=20
limitation (2/s).=20
I use this setup to limit syns logging them and dropping them and it runs.

jumping to LOG doesnt ACCEPT de packet as i understand...


El Martes, 5 de Octubre de 2004 03:04, Lucky Leavell escribi=F3:
> iptables v1.2.8
> OS: SuSE 9.1
>
> After reading several references here on rate limiting logging I tried the
> following short chain which was intended to log a packet subject to the
> rate limit and then drop it unconditionally:
>
> -A LogDrop  -m limit --limit 2/s -j LOG --log-prefix "ICMP:Drop "
> -A LogDrop -physdev --physdev-in eth0 -j DROP
> -A LogDrop -physdev --physdev-in eth1 -j DROP
>
> However, the first statement not only logged the packets subject to the
> rate limit but also acted as an implicit ACCEPT.  My understanding was
> that the logging should take place but then the packets should be dropped
> unconditionally by one of the following DROPs. When the LOG statement was
> commented out, the packets were dropped as desired.
>
> I have reread my documentation and still do not see where my mistake is.
> Could someone please enlighten my understanding>
>
> Thank you,
> Lucky Leavell

=2D-=20
=2D------------------------------------------------
Clister UAH
=2D------------------------------------------------

