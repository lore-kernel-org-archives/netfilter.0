From: Michael Hakimi <yalakvar@gmail.com>
Subject: Using libnetfilter_queue and ebtables
Date: Mon, 24 May 2010 15:01:50 +0300
Message-ID: <AANLkTinp6nMC9CoOKh9wjQSlp17rQYZIxH37THJxqSx-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=kfhHOUqnfV46TSIUE3juJnU8F0yjVsLXH84UHRzUzxI=;
        b=dT+iHvadD5nDae2TaQqb6UdIW7D8SsWX/3TQDVLcIGkWj1CYmywEnEHmeqQj6pdPJA
         b3NPWpb3PXs5Sx5XGKWiQhlv4fW0DOxd3AN1IpMZrNDGIbk3AuhHjBzet+BobX3ZEapM
         zHF6ItXL0u5QsQjy8cT/gA8OcNw/d+d9rCwJk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I want to capture Ethernet frames at kernel space and manipulate them.
As I see it libnetfilter_queue is the easiest way to do it. Combined
with iptables I get all IP packets, but I have a problem with non-IP
packet (like ARP).
I found ebtables with does handle non-IP packets, but I can't find a
way to tell him to forward all the traffic to my netfilter queue (like
I do with iptables). Is there a way to do it?

Thanks in advance for any help.

Regards,
Mickey
