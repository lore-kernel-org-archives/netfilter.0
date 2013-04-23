From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nf-queue.c as an example of libnetfilter_queue
Date: Tue, 23 Apr 2013 02:43:44 +0200
Message-ID: <20130423004344.GA5846@localhost>
References: <CAM-TR1qfrCA-SvkfpNbdFr9dYTpc53FmL4WOvzxJs9_M3f6H7w@mail.gmail.com>
 <CAM-TR1qMrqOvWk_Y5fVeY2BzgkQPG6QJR1x-4_pUsu2SRqRQdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAM-TR1qMrqOvWk_Y5fVeY2BzgkQPG6QJR1x-4_pUsu2SRqRQdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Flavio Poletti <polettix@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Apr 23, 2013 at 02:13:22AM +0200, Flavio Poletti wrote:
> Hi,
> 
> The example file nf-queue.c program in the examples
> directory does not seem to use the functions in the library at all.
> 
> Are they deprecated in favor of something else?
> 
> This is a repetition of a question I sent some 10 days ago, sorry
> for bothering again but I'm interested into this. Anyway I won't
> post it again if I get no answers, please accept apologies in
> advance if inconvenient.

Both APIs are currently supported, nf-queue uses libmnl. The former
uses the old libnfnetlink. I needed a rather more flexible API for the
connection tracking support in user-space in conntrackd over libmnl.

The new API also provides also helpers for ipv4, ipv6, tcp and udp,
which seems to be a common requirement for everyone. See the
libnetfilter_queue/src/extra/ directory in case you want to check
implementation details.

You can generate up to date doxygen documentation with the following
command:

libnetfilter_queue$ doxygen doxygen.cfg

Regards.
