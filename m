From: David Vogt <mail@davidvogt.de>
Subject: Re: [libipq] Packet Fragmentation?
Date: Wed, 15 Feb 2006 15:48:09 +0100
Message-ID: <859616420602150648y3bd37cc7w@mail.gmail.com>
References: <859616420602150337i530a8c39s@mail.gmail.com>
	<2017dff40602150626q76ecc25bme545fe65a92cee16@mail.gmail.com>
Reply-To: David Vogt <mail@davidvogt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2017dff40602150626q76ecc25bme545fe65a92cee16@mail.gmail.com>
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
To: Sivasankar Sankaran <sivasankar.s4u@gmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

2006/2/15, Sivasankar Sankaran <sivasankar.s4u@gmail.com>:
> Dear David,
>
>               Hai...We have also used the same scenario,but we have captu=
red
> the packet in kernal level.we are not able to push it to the user level..=
.we
> have used the ip_queue module.We are working in 2.6.10 kernal...we have t=
o
> modify the packet in user level or at kernal level.So please help us to
> retreive the values in user level..

I don't really know exactly what your problem is, maybe you can
specify it a little bit more?

So long, I suggest reading the manpage of libipq. There is an example
application that serves as a good starting point (as far as I am
concerned)

David

