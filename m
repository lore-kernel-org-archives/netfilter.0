From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: IPSec through my firewall
Date: Wed, 16 Feb 2005 09:03:06 -0500 (EST)
Message-ID: <34572.142.169.215.10.1108562586.squirrel@142.169.215.10>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Ola Nilsson <ola@fam-nilsson.org>
Cc: netfilter@lists.netfilter.org

On Wed, February 16, 2005 7:46 am, Ola Nilsson said:
> So, going back to my initial question; How can I go about finding out
where my packets are droped? Since it's most likelly not because of any
netfilter rule entry, who else can decide that a packet can not be
NATed?

Sorry, I haven't followed the thread at all.

To answer this question, some malformed, suspicious packets can be droppe=
d
by the netfilter code itself, and even the networking code.

I don't pretend it's your case but anyway, you can patch your kernel with
the dropped-table patch (available from patch-o-matic).

This will let you log dropped packets.

Also, if you're worried about where in your ruleset the packet gets
dropped, use nf-log, raw table, TRACE patches to get a complete packets
traversal logging.

Hope am not way off the subject.

>
> --
> /Ola Nilsson
>
>
>

Cheers,
Samuel




