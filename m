From: JC <bikkit@gmail.com>
Subject: Questions regarding routing in the stack
Date: Thu, 21 Jul 2005 07:30:48 -0700
Message-ID: <a60102c3050721073024051dd2@mail.gmail.com>
Reply-To: JC <bikkit@gmail.com>
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

I was hoping someone could possibly shed some light into this or at
least point me to the right direction...

I am trying to develop a kernel module level solution for dynamic host
multihoming. This requires that I mangle packets from specific
applications running on the system right in the stack and basically
change the interface the packets are sent from (at least two
interfaces).

I understand that I need to register my mangling function with one of
the 5 netfilter hooks (the ROUTING one?), grab the interesting packets
and change..... something in the skbuff.

What really evades me is where/when does routing *exactly* happen. If
I know at which point it happens, I should tap right after it and
change the interface to the one I want. Or this whole idea could be
bad and I end up breaking something in the
packet and it gets dropped...

Of course, that needs to happen for both locally generated traffic and
incoming traffic, so that I link the incoming packets to the right
applications.

regards,
JC

