From: David Vogt <beunlovable@gmail.com>
Subject: Re: Query
Date: Fri, 10 Feb 2006 14:46:24 +0100
Message-ID: <859616420602100546w2f9870abi@mail.gmail.com>
References: <20060210043532.26157.qmail@web8510.mail.in.yahoo.com>
	<56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

iptables provides facilites to queue packets that traverse the kernel
to a user space application. You can specify rules that define which
packets are sent to user space. Furthermore, you can modify packet
data to be reinjected into the kernel.

I would suggest reading the manpage of libipq, providing a simple API
to receive the packets. A very simple example application can be found
there as well.
As to reinjection, read the ipq_set_verdict man page.
Hope that helps a little bit.

David

2006/2/10, Rob Sterenborg <rob@sterenborg.info>:
> On Fri, February 10, 2006 05:35, aparna misri wrote:
> > hello,
> >   I am doing a small project in networking.I read
> > somewhere that I can use iptables to capture network
> > data.I want to capture IP packets so that I can
> > compress it and then send it to the receiver.Receiver
> > decompresses it at its side.Is it possible to do it
> > with iptables?
>
> I'd capture it with tcpdump, ethereal or something like that. These are p=
acket
> sniffers, iptables is not. I'm not sure if iptables can capture (and log)=
 all
> packets just like a sniffer can.
>
>
> Gr,
> Rob
>
>
>
>

