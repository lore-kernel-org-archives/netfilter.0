From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: How to use ip_queue without linking libipq?
Date: Tue, 21 Jun 2005 08:44:26 -0400
Message-ID: <876ef97a05062105444d5db604@mail.gmail.com>
References: <1119263393.1985.10.camel@labeni.mm.mbigroup.it>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1119263393.1985.10.camel@labeni.mm.mbigroup.it>
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
To: Luca Abeni <lucabe72@email.it>
Cc: netfilter@lists.netfilter.org

On 6/20/05, Luca Abeni <lucabe72@email.it> wrote:
> I think that looking at libipq code for understanding how to use ipqueue
> would be a license violation (I would end up with a code too similiar to
> libipq), right?

I believe it would.
=20
> Is some documentation about directly using ipqueue available somewhere?
> Can anyone help me?

IANAL, but...

You'd have to clean-room it: get someone else to study the libipq
source and write you a document specifying how to interface with the
ip_queue module via netlink. Yourself, you should not look at the
libipq source, only this other person. That would then allow you to
write a non-GPL interface to ip_queue functionality. This is how the
original third-party BIOS was designed and implemented, circumventing
IBM's proprietary license on it.

--=20
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

