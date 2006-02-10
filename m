From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Query
Date: Fri, 10 Feb 2006 15:02:37 +0100 (CET)
Message-ID: <60942.193.173.147.3.1139580157.squirrel@webmail.sterenborg.info>
References: <20060210043532.26157.qmail@web8510.mail.in.yahoo.com> 
	<56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
	<859616420602100546w2f9870abi@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420602100546w2f9870abi@mail.gmail.com>
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

On Fri, February 10, 2006 14:46, David Vogt wrote:
> Hi,
>
> iptables provides facilites to queue packets that traverse the kernel
> to a user space application. You can specify rules that define which
> packets are sent to user space. Furthermore, you can modify packet
> data to be reinjected into the kernel.
>
> I would suggest reading the manpage of libipq, providing a simple API
> to receive the packets. A very simple example application can be found
> there as well.
> As to reinjection, read the ipq_set_verdict man page.
> Hope that helps a little bit.

Yes, but still : can you give me a reason why I would use
iptables/netfilter/libipq to sniff and log packets when I can do it with
tcpdump or something ?
The OP says <quote>I want to capture IP packets so that I can compress it=
 and
then send it to the receiver</quote>. If he just wants to capture packets=
, it
seems to me that using iptables for this is a bit more difficult.


Gr,
Rob



