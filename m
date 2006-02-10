From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Query
Date: Fri, 10 Feb 2006 14:30:50 +0100 (CET)
Message-ID: <56244.193.173.147.3.1139578250.squirrel@webmail.sterenborg.info>
References: <20060210043532.26157.qmail@web8510.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060210043532.26157.qmail@web8510.mail.in.yahoo.com>
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

On Fri, February 10, 2006 05:35, aparna misri wrote:
> hello,
>   I am doing a small project in networking.I read
> somewhere that I can use iptables to capture network
> data.I want to capture IP packets so that I can
> compress it and then send it to the receiver.Receiver
> decompresses it at its side.Is it possible to do it
> with iptables?

I'd capture it with tcpdump, ethereal or something like that. These are p=
acket
sniffers, iptables is not. I'm not sure if iptables can capture (and log)=
 all
packets just like a sniffer can.


Gr,
Rob



