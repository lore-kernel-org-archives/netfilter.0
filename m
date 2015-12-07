From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Sun, 6 Dec 2015 23:07:51 -0800
Message-ID: <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<5662BD03.60004@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=YrnyjDGfNO4VaGCIvtRMyGMas/CIytGuRkuje/CVPj0=;
        b=N0AaNsQnJOrPo/pEZV3G6su0/HqesKK+G6C85YQHHWqvaL9P6NX6HLbScodAoke4RZ
         7xMa1LleszHGsaR8nz7WEJ46dwmHV3yiwvVris3eorTEb6EgfE8cijrGbB4e9GmXldmW
         xSbWXXGOhA2P+VXEAv5nIpzRNvVFIL1s//ZzpDp4rAJCWQS64/18nHtZExpJaHwza/WL
         mIURy+WheiUj7MqAwY2Bk3ASpdnbQhiMOtgEc9wraQ+U00EnYGeXqVAJ98QqdwuDDl4L
         uQoYpeI8weTZhb8Z8+V2MrjDxXoIGgt/Xq2Le8DPxKTQdSMnCgVSBA55X+UVb6UTFHn2
         HqKQ==
In-Reply-To: <5662BD03.60004@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Sat, Dec 5, 2015 at 2:31 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> IIUC, you're looping back traffic on a bridge interface.

That sounds right.  The packet arrives on virbr0, and I want to send it
right back where it came from.

> Bridge-nf is
> enabled by default and can cause weird behaviour with NAT. Try to
> disable it :
>
> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
>
> Without that, after DNAT, the packet is not routed but bridged. But I
> suspect that the bridge code won't forward it back to its original port
> due to its source MAC address.

It still times out.  Is it worth installing the logging to see if the
packet is still disappearing at the DNAT step?  Guessing no.

Maybe I can DNAT the source MAC too?  :)
