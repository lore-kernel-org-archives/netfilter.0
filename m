From: billycrook@gmail.com
Subject: Re: Reject on a Bridge
Date: Thu, 4 Sep 2008 11:44:37 -0500
Message-ID: <a43edf1b0809040944j673af28ard764d3da1503386f@mail.gmail.com>
References: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
	 <48C00A5F.2080104@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=+60ql+DpF71gsXPA2sRJTFa0W5kaZrkkE6D4luzTuT4=;
        b=lcOnFzC48A7P8kvuE41S8DWgjD+8QLewtw1iFDmezywDbuRIdYSe+pYmC8SgQcmSRp
         YP8dQ0SJGMipxYdmz9dPLWeGXtinDAZZqp506J7xBmnf5qiUTYZYwoSTuqzohUdJlDNn
         gkY0jl6xR5BgoJU/WeMWP15Q0fQE3s3udEyG0=
In-Reply-To: <48C00A5F.2080104@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2008-09-04, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 09/03/08 17:41, Gilad Benjamini wrote:
>> I am using iptables to run a firewall on a bridge. The bridge
>> consists of eth1 and eth2. Neither interface, nor the bridge itself,
>> have an IP address. eth0, which is not on the bridge, does have an IP
>> address.
>>
>> Am I missing something, or is this a real problem ?
>
> I'm not sure where the rejection is going to come from.  At least as I
> understand it the rejection comes from a system (with an IP) in the path
> that is refusing to pass the packet.  Thus I don't see how the bridge
> can reject the packet because there is no source IP to send the
> rejection from.  Can you add an IP to the bridge interface that is with
> in the subnet that is being bridged through it so that there is a source
> IP for the rejection?

That does make it pretty clear.  Rejecting an IP packet is done with
another IP packet.  Packets have to come from a layer-3 interface, of
a machine with an IP, so it doesn't make sense that an interface
that's not participating in IP itself could send a
ICMP-host-prohibited message if it doesn't have an IP from which to
send the message.

I understand you want to reject with an RST packet, but that packet
still has to come from somewhere.  It sounds like you want the rule to
fabricate an RST packet from the intended recipient of whatever you're
blocking.  I doubt the kernel will send any packets (let alone forged
ones) from an interface where IP is not bound.

Perhaps an easier solution would be to just DROP the unwanted traffic,
rather than REJECT.
