From: Marco Talunzo <marco.talunzo@googlemail.com>
Subject: How iptables/CLASSIFY works? Via TOS, VLAN tags?
Date: Fri, 13 Feb 2009 01:14:25 +0100
Message-ID: <8096031a0902121614t3dcc46a8x61873f82aafcd985@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=1eH5OGVJ2ovrbcqCki4N8RR1RsUYh+ZYz9+ocL2ZTsI=;
        b=Hxb3NySWMB5ZdQImu4q2i3LAueccRXTBBNSX1Tj++2MzOdYKnp3t0bjuDUiN5sTCST
         7TfExnADI1X/DqhsL3i0B4E69EjuQ5N3AGqadTtfJUr+YHxbfPIm/DPWF1hWYuOs1cDQ
         Jjmov1mpWNVF3zEpIWZRLiXAe5ZYB/8CnYnP4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a wireless card with 4 priority queues (QoS/WMM). From
practice, I know that if I do the following commands, all my UDP
packets going out from the given source port will be put by the
wireless driver in the voice queue (AC_VO) (User Priority "7" is
mapped to AC_VO).

iptables -A POSTROUTING -t mangle -m mark --mark 7 -j CLASSIFY --set-class 0:7
iptables -A OUTPUT -t mangle -p UDP --source-port 33234 -j MARK --set-mark 7

Can anyone explain me, how this works on the protocol levels? What
exactly "CLASSIFY --set-class" command does? Does it set the mark "7"
to the TOS field in the IP packet, and then the wireless driver maps
somehow all packets with this TOS field to the voice queue? Or maybe,
CLASSIFY sets a VLAN tag at the MAC layer? Is this possible? However,
I don't see any field for VLAN tags in the 802.11 MAC frame, where
there is only "QoS Control Field". And I don't think that CLASSIFY
goes so deep in MAC and sets "QoS Control Field".

Thanks for any help!
