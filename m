From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sun, 22 Sep 2002 16:15:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c26242$79813670$026410ac@honor>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020922082118.EQR13996.mta05-svc.ntlworld.com@there> <0c0601c2623c$f82fd7c0$c6b22543@repligate> <20020922134852.PSNX6699.mta01-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

From: "Antony Stone" <Antony@Soft-Solutions.co.uk>

> On Sunday 22 September 2002 2:35 pm, Jim Fleming wrote:
>
> > Have you ever calculated how much bandwidth is wasted each year
> > with 4 of the 160 bits in every packet as useless ?
>
> Actually, it's 4 of every 160 bits in the *header* - there's up to another
> 1500 *bytes* (on ethernet) of body in the packet as well, so the wasted
> bandwidth varies from 4/160 = 2.5% for empty packets, to 4/12160 = 0.03%
for
> full ones.
>
> Most people are going to have full packets in one direction (the direction
> that's got saturated bandwidth), and empty ACK packets in the other
direction
> (which has oodles of bandwidth to spare because all the packets are
empty).
>
> Therefore I think 0.03% wasted bandwidth on a full link, and 2.5% wasted
on a
> virtually idle link are very acceptable.
>
> Antony.


i guess 1 more offtopic mails like this compensates all "useless header
overhead" per user for a year.


