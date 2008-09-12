From: "Partha Majumdar" <pmajumdar.kernel@gmail.com>
Subject: Changing IP destination in NF_IP_PRE_ROUTING hook
Date: Fri, 12 Sep 2008 16:58:33 +0530
Message-ID: <f4a980250809120428l14a26a31j1a08725404470fc4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=+j6GdeKluCj261R3WejxVO6pfhQjZ2laECzGY1xquek=;
        b=dv4L4SMl0wqgWqAnCg5RoiiFVlrBNJ+hHQhxzulTlYH3DBYSGw+bHq2qIeCt+xYyRv
         UopaqaXF5EfjnYyErpxzTscSZelCcOVy/TFPK+cG3kLHqOqpnpu3DwcCgR0Yh78Pi279
         I4UleqZnAFjf/15bCzAx/tFwFdpWh4JgSRW6Y=
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I am not very familiar with Linux kernel internals. I am trying to
write a simple netfilter hook but facing some issues and did not find
any clear answer in available docs on packet filter or netfilter
hacking.

I am writing an experimental kernel module that will register a
NF_IP_PRE_ROUTING hook. This hook will change the destination address
of the IP header. After that I'll update the checksum of the IP header
by calling ip_nat_cheat_check as it is done in manip_pkt. Do I need to
update the TCP checksum as well (if it is a TCP packet) since the
pseudo header of the packet has changed? If I need to do update the
tcp checksum as well then why isn't it being done  mainp_pkt after
changing the source or destination IP address?

I also want to do similar modification for IPv6 packets. For IPv4 I
have seen that skb_ip_make_writable is being called before modifying
the IPv4 headers. I did not find anything similar for IPv6. What is
the logic I should follow for IPv6?

Regards,
Partha
