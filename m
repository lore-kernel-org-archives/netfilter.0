From: Edmundo Carmona <eantoranz@gmail.com>
Subject: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 00:50:19 -0400
Message-ID: <65aa6af905072021501603cfd5@mail.gmail.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi, guys!

This is my very first post here... and I want it to be meaningful...
at least to myself. :)

I don't think I'm that smart to be the first to need this feature...
so I hope I'm the ONE vote that flips the balance to convince
netfilter developers that this is indeed <i>good and necessary</i>.

Why is the routing decision made before the packets hit OUTPUT? I know
that in OUTPUT it's already necessary to know what network interface
the packet will go through but then is it wrong to do policy routing
on output traffic? I don't think so.

Maybe a new chain could be used to do some PREROUTING actions (like
marking) before the routing decision is made for output traffic.

What do you think?

