From: "curby ." <curby.public@gmail.com>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Mon, 27 Jun 2005 09:53:01 -0600
Message-ID: <5d2f379105062708534de71258@mail.gmail.com>
References: <5d2f379105062511588033857@mail.gmail.com>
	<002e01c579e1$4d326d00$4206a8c0@loki>
	<Pine.LNX.4.61.0506262243380.15156@yvahk01.tjqt.qr>
	<000c01c57af0$c58cb5c0$4206a8c0@loki>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c57af0$c58cb5c0$4206a8c0@loki>
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
Cc: sfrost@snowman.net

On 6/27/05, Marius Mertens <marius.mertens@gmx.de> wrote:
> If you are afraid of somebody trying to DOS you, the recent match with th=
e
> added TTL check might be an even better choice.

I've been wondering about recent's TTL check and its ability to
prevent or even reduce DOSing.

To test if the TTL option is used, the attacker can send regular
(nonspoofed) ssh requests until they start becoming unresponsive (call
this number n), then try sending another request with a different TTL.
 If that request returns, TTL match is being used so simply send n-1
requests with different TTLs and the spoofed address.  Unless the
route from the attacker to the sshd is longer than the route from the
spoofed client IP to the sshd and the client uses a TTL of 255 (or
something similarly high), the legitimate client will still be DOSed.=20
Knowledge of the client system's OS or TCP stack is also reasonably
easy to acquire, and can help narrow down the TTLs that need to be
sent.  Or the attacker can be lazy and send 250 or so SYN packets with
different TTLs and the spoofed IP.

In short, if an attacker know's you're using recent to track ssh
requests, and is not so clueless that he doesn't know about the TTL
option to recent, you're dead whether or not you use the TTL option.

On a related note, I really hope ISPs are doing some egress filtering
to prevent these packets with source IPs not on the expected subnet
from getting out.  I wonder how many do...

