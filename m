From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: private to public IP
Date: Mon, 3 Jul 2006 14:21:52 +0200 (CEST)
Message-ID: <59690.193.173.147.3.1151929312.squirrel@webmail.sterenborg.info>
References: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK><1151856182.5609.2.camel@robee.mars.cyberbajt.pl><004b01c69e8d$5f083ab0$7819a8c0@MYNOTEBOOK>
	<57177.193.173.147.3.1151925423.squirrel@webmail.sterenborg.info>
	<002a01c69e98$617e69d0$7819a8c0@MYNOTEBOOK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002a01c69e98$617e69d0$7819a8c0@MYNOTEBOOK>
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

On Mon, July 3, 2006 14:01, Wennie V. Lagmay wrote:
> Thanks you very much Rob, I will take note that It is better to use -A
> rather than -I on this situation, however I have a follow up question.w=
hat is
> the difference between implemeting these rules on FOWRARD chain, rather=
 than
> POSTROUTING and is it important to put  DROP after the rules?

If we're only talking about LOG rules then just use the FORWARD chain wit=
h "-m
state --state NEW". I don't think that, in this case, it differs much bec=
ause
the only thing you want to do is to log and the information would be the =
same
(I didn't try, but of course you are free to do so).

You say you only want to log what source IP is connected to which destina=
tion
IP, not that you also want to DROP it. So, you don't want to use the DROP
target as those packets would get DROPped and a connection cannot be made=
.
AFAIK you cannot see what public IP it used, but if you used SNAT and/or =
have
only 1 public IP, you already know that.
The log output I showed is an example only and is recorded in the INPUT c=
hain
just before the packets are dropped: it has nothing to do with your situa=
tion.

You can find more information in Oskars iptables tutorial. I posted the l=
ink
in a previous post.


Gr,
Rob



