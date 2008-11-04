From: "Jianqing Zhang" <arrow.jianqing@gmail.com>
Subject: Can iptables/netfilter capture an incoming IP packet which is not addressed to the local machine?
Date: Mon, 3 Nov 2008 23:07:28 -0600
Message-ID: <8a38e1330811032107j5edfb76s19073e3618622537@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=g4ixkWMatbrOJn/qHHnKq4uPaPsESLOWeUIwpgwWFyY=;
        b=RVNGA1wdAEqllgUdHHlbjsH7a2MxdemfH7IODTP4xpMbqIy9CfJGltgX78op69YDy+
         pKuYoH2bh/ldMTyD8ZuS6ldiDerwMTNfc/fR1X45J1Vr3Q0jzM+hWrh45Bz/MC3TIn3W
         qJ3bkuXyy5VFRyCaWyVgmKn5LXJB+YuINxzak=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Can I use netfilter or iptables to capture a packet which is wrapped
by a Ethernet frame with multicast mac address, but the destination IP
address (a unicast address) is not the local one? According to my
experiments, a local application can get such Ethernet frames by a raw
socket, but the payload, the IP packet with unmatched IP dest., cannot
be delivered to upper layers. Can iptables capture it and put it in
QUEUE?

Thanks
