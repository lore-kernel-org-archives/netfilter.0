From: "David Vogt" <mail@davidvogt.de>
Subject: Re: libnetfilter_queue conditions required to rewrite packets...
Date: Tue, 11 Apr 2006 16:49:36 +0200
Message-ID: <859616420604110749g158d9c56x98c1a87112a4a341@mail.gmail.com>
References: <44348A27.60602@gmail.com>
	<859616420604052330gc251080q95738ef1d112b465@mail.gmail.com>
	<859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
	<443B8BF1.2090907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <443B8BF1.2090907@gmail.com>
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
To: Mike Auty <mike.auty@gmail.com>
Cc: netfilter@lists.netfilter.org

2006/4/11, Mike Auty <mike.auty@gmail.com>:
> Ok,
>         So yesterday I needed to use a small program to rewrite packets f=
lowing
> through my transparent bridge.  I started using the an ipq
> implementation and after a bit of jiggery pokery fixing up all the
> checksums, it seemed to be working a treat.  I then knocked up an
> nfqueue implementation using the code I'd been writing that did exactly
> the same job, and using the the subversion copies of libnetfilter_queue
> (0.0.12) and libnfnetlink (0.0.16), I did manage to mangle the packets
> successfully...
That's good news. I took a holiday this week, so I haven't been
working on this issue anymore, but will try to check if the subversion
copies solve my problems as well.
Thank you very much!

David

