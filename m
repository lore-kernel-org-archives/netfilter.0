From: Eric Leblond <eric@inl.fr>
Subject: Re: your mail
Date: Mon, 28 Jul 2008 16:14:09 +0200
Message-ID: <20080728141409.GC27519@khasse.inl.fr>
References: <009301c8ef85$a7389050$f5a9b0f0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <009301c8ef85$a7389050$f5a9b0f0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Boulding <davidboulding@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

On Saturday, 2008 July 26 at 21:11:08 -0400, David Boulding wrote:
> Hey all,
> 
> I'm developing with libnetfilter_queue, using "iptables -A FORWARD ." to
> capture packets of interest on a bridge for analysis (firewall). 
> I use nfq_get_payload() to grab everything from the IP layer and on, but I
> was wondering if there was any way to get the raw MAC layer. 
> Is there any command like nfq_get_payload() that will return everything
> similar to what you would get using wireshark or ethereal?

You can use nfq_get_packet_hw():

	Retrieves the hardware address associated with the given queued packet.
	For ethernet packets, the hardware address returned (if any) will be the
	MAC address of the packet source host.  The destination MAC address is not
	known until after POSTROUTING and a successful ARP request, so cannot
	currently be retrieved.

	The nfqnl_msg_packet_hw structure is defined in "libnetfilter_queue/libnetfilter_queue.h" as:

		struct nfqnl_msg_packet_hw {
			u_int16_t	hw_addrlen;
			u_int16_t	_pad;
			u_int8_t	hw_addr[8];
		} __attribute__ ((packed));
.

http://lists.netfilter.org/pipermail/netfilter-devel/2006-February/023286.html

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
