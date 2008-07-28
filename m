From: "David Boulding" <davidboulding@gmail.com>
Subject: Re: your mail
Date: Mon, 28 Jul 2008 10:42:58 -0400
Message-ID: <5226fb870807280742l156c15fm909ae92c3cb2ad2f@mail.gmail.com>
References: <009301c8ef85$a7389050$f5a9b0f0$@com>
	 <20080728141409.GC27519@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=0X3FOwQBznBAHQ35nxJzg3ldWPiftLGdMIbWCpqAmYQ=;
        b=XxNSsz13taucvo8Sb7jw0tqDbhpZEsFhHMBXkY4hsQvrqEvlrG9BLBb6gNHi97n/9j
         +FRcNyUmHBepUf1TpqGjiMdsnA6dQT1RfI+UrTHKrRv414KdbpPHIzD0vb6C05qwB7t0
         B4cWvLBg0wPV5SIYxoXNinZ/PL5N9f+mj7FHs=
In-Reply-To: <20080728141409.GC27519@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, David Boulding <davidboulding@gmail.com>, netfilter@vger.kernel.org

Thanks for the reply.
I knew of nfq_get_packet_hw(), but I'm looking for a way to get the
raw byte array of the header that I get from the nfq_get_payload()
call. I'm not only looking for the MAC header information (which
nfq_get_packet_hw() will give me easy enough), but whatever else is
there, for example PPPoE and PPP header information. Is there anyway
to get that?

Thanks,

Dave

On Mon, Jul 28, 2008 at 10:14 AM, Eric Leblond <eric@inl.fr> wrote:
>
> Hello,
>
> On Saturday, 2008 July 26 at 21:11:08 -0400, David Boulding wrote:
> > Hey all,
> >
> > I'm developing with libnetfilter_queue, using "iptables -A FORWARD ." to
> > capture packets of interest on a bridge for analysis (firewall).
> > I use nfq_get_payload() to grab everything from the IP layer and on, but I
> > was wondering if there was any way to get the raw MAC layer.
> > Is there any command like nfq_get_payload() that will return everything
> > similar to what you would get using wireshark or ethereal?
>
> You can use nfq_get_packet_hw():
>
>        Retrieves the hardware address associated with the given queued packet.
>        For ethernet packets, the hardware address returned (if any) will be the
>        MAC address of the packet source host.  The destination MAC address is not
>        known until after POSTROUTING and a successful ARP request, so cannot
>        currently be retrieved.
>
>        The nfqnl_msg_packet_hw structure is defined in "libnetfilter_queue/libnetfilter_queue.h" as:
>
>                struct nfqnl_msg_packet_hw {
>                        u_int16_t       hw_addrlen;
>                        u_int16_t       _pad;
>                        u_int8_t        hw_addr[8];
>                } __attribute__ ((packed));
> .
>
> http://lists.netfilter.org/pipermail/netfilter-devel/2006-February/023286.html
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
