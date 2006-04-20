From: "David Vogt" <beunlovable@gmail.com>
Subject: Re: libnetfilter_queue conditions required to rewrite packets...
Date: Thu, 20 Apr 2006 14:56:52 +0200
Message-ID: <859616420604200556x6e9011beyda90d65d93c2be88@mail.gmail.com>
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

For the sake of completeness. After Amin Azez helped me (thanks again)
to compile the current library version from the svn trunk and
installing them, I gave it a quick shot and my application seems to
work fine as well. Thank you as well, Mike.

David

