From: TheGesus <thegesus@gmail.com>
Subject: Re: QUEUE - ipq_set_verdict overridden?
Date: Sun, 14 Jan 2007 17:24:27 -0500
Message-ID: <5e70f6530701141424i897b404y1aa8a3a22e43ccbb@mail.gmail.com>
References: <5e70f6530701141310t66399aabx6b5d6cdc65b2afa9@mail.gmail.com>
	<45AAA54F.5040905@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AAA54F.5040905@netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@lists.netfilter.org>

On 1/14/07, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> TheGesus wrote:
> > I am aware of libnetfilter-queue but until there is some documentation
> > I'm sticking with libipq.
>
> It would be a good idea moving to libnetfilter_queue since libipq is
> deprecated.
>
> --
> The dawn of the fourth age of Linux firewalling is coming; a time of
> great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris
>

I understand that, but there is more documentation on libipq.  Plus
there is that one, lonely piece of (GPL'd) sample code.  There is
nothing on libnetfilter_queue anywhere, as far as I can tell.

I am also aware of the libipq "compatibility layer" in
libnetfilter_queue and I have tried working with it on an Ubuntu 6.06
VM but got nowhere (I switched over to the vanilla Etch VM primarily
to simplify things).  Since I'm getting more results with libipq I
have decided to "go where the docs are" regardless of what wonderful
things are coming in the fourth age.  I had a lot of pain during the
dawn of the last two ages (and I didn't even jump into the 3rd age
until about 10PM that evening).

I guess it's always darkest before the dawn.

If you have any pointers on getting the compatibility layer to work,
I'm all ears.  Or if there is some libnetfiler-queue sample code "out
there" that I missed, please let me know.

Thank you for your reply.

