From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: SIP connection tracking
Date: Tue, 9 May 2006 10:53:07 +0200 (CEST)
Message-ID: <62884.193.173.147.3.1147164787.squirrel@webmail.sterenborg.info>
References: <20060509053701.45562.qmail@web34211.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060509053701.45562.qmail@web34211.mail.mud.yahoo.com>
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

On Tue, May 9, 2006 07:37, Sagara Wijetunga wrote:
> Hi all
>
> I'm trying to prioritize the out going SIP related
> traffic from my desktop computer.
>
> I tried:
>
> iptables -t mangle -A POSTROUTING -m helper --helper \
> sip -m state --state ESTABLISHED,RELATED \
> -j ...
>
> It simply doesn't detect SIP related traffic!

Perhaps only NEW traffic passes the mangle table, just like the nat table=
.. If
that is the case, ESTABLISHED and RELATED packets are (probably) treated =
the
same way as the NEW packet.
But, I'm not sure about this.. Did you test that ?


Gr,
Rob



