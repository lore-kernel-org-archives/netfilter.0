From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: forward udp broadcast packets on same subnet /interface with diff source
Date: Wed, 14 Jul 2004 07:57:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e5040713225778147c4d@mail.gmail.com>
References: <20040714050247.94067.qmail@web90110.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040714050247.94067.qmail@web90110.mail.scd.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Tom Thumb <tomthumb888@yahoo.com>
Cc: netfilter@lists.netfilter.org

One more thingg, you'll have to set ip_forward to 1

On Tue, 13 Jul 2004 22:02:47 -0700 (PDT), Tom Thumb
<tomthumb888@yahoo.com> wrote:
> Hi,
> 
> Can I use iptables to forward UDP broadcast packets on
> the same subnet and interface but just change the
> source IP?
> 
> That is, the forwarding machine is 192.168.1.5, with
> mask 255.255.255.0 and has a single NIC.
> 
> A machine with IP 192.168.1.6 with the same mask sends
> a UDP broadcast to 192.168.1.255.
> 
> The forwarding machine receives this packet. Can it be
> configured to resend it out on the same interface that
> it received it on (its only interface) and just change
> the source IP to be a 3rd address, like 192.168.1.7,
> but also as a UDP broadcast to 192.168.1.255?
> 
> Is there any way to do this without adding a physical
> NIC?  Do I need to add a "virtual" NIC to do it? How?
> 
> Thanks
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail Address AutoComplete - You start. We finish.
> http://promotions.yahoo.com/new_mail
> 
>

