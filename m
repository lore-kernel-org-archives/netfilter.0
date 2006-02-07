From: David Vogt <mail@davidvogt.de>
Subject: Re: packet data
Date: Tue, 7 Feb 2006 07:33:01 +0100
Message-ID: <859616420602062233i753bced9v@mail.gmail.com>
References: <503e0f9d0602062159p568106cak4ddf528aff6eab39@mail.gmail.com>
Reply-To: David Vogt <mail@davidvogt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <503e0f9d0602062159p568106cak4ddf528aff6eab39@mail.gmail.com>
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
To: tim tim <tictactoe.tim@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

Try reading the manpage of libipq
(http://www.cs.princeton.edu/~nakao/libipq.htm, for example) there is
an example how you can access the packet data. If you want to modify
data, read the ipq_set_verdict manpage
(http://www.die.net/doc/linux/man/man3/ipq_set_verdict.3.html)

David

2006/2/7, tim tim <tictactoe.tim@gmail.com>:
> hai all...
>                  i captured packet using netfilter hook and queued to
> user space.. can some body tell me how to access the packet data using
> libipq ..bye
>
> it's me. .. the unknown gye..
>
>

