From: Thierry Du Tre <thierry.dutre.tch@gmail.com>
Subject: How to mark RTSP child connections with different value.
Date: Mon, 23 Jun 2014 15:48:19 +0200
Message-ID: <CALUesLixvZPSeJOr7-0KXTKkmagUW4N5Xb88XqrOVLgCchrshg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6s4ix2g2fONu2Ke3EEeiWqG8SfemNcC76BOd3NPHr4w=;
        b=NVIiEO/8ONsjazW+QVHjEQoZ36cid14LoFj8OXRPoM/NLFqV67fgG0VJlwC+59/YCl
         +/Ynt7JsnujwaQzmC3fdYhBEAbwNtRTVaGICMhoDV4cXodiW/WYH09ToZQ3S+lHjJaAj
         PgmWo3B4It5dghoZnMNuke3XzHIYZkSK+7E0xBjqJZTbVCYfhUZ+k9GqbMKV+Gde86rd
         XB7l94w+PTrgSE4Rq/LR/saVDrFim9FWxESZKZjfw8U/xMoZouqygE782dCDGGBnWXko
         yFDUcfSQeF4Qb7FAIfjlUUJRnWMZgdnyhzyfVC1kx2Vsu3roPDJLNmITtnuhje42aY/n
         A2jg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to apply some QoS for RTSP traffic forwarded by an OpenWRT
gateway (Attitude Adjustment + patches).

The RTSP helper is loaded and succesfully expects the incoming
streams, which arrive at the client in the NAT'ed lan.
Multiwan is also active, this is using part of the marking bits (i.e.
0xF0000000 ) to select the appropriate routing table.

In this product, interface drivers sort outgoing frames in different
queues based on part of the marking bits (i.e. 0x0F000000).
Netfilter rules are present in the forwarding chain to mark streams
destined at tcp port 554 with specific qos value (i.e 0x08000000).
This mark is saved as connmark at the end of the forwarding chain, and
restored at the start. If after restore, the mark is still 0, only
then all qos rules are being evaluated.

When RTSP helper succesfully predicts incoming streams, these childs
automatically inherit the connection mark, and as such will be marked
with the same mwan and qos bits as the parent connection. For mwan
this is ok, but for qos a different (higher) value would be prefered
(i.e. 0x0A000000).
Ideally, the child streams should be assigned a specified connmark
value when RTSP helper is predicting them.
A generic solution that would be applicable to parent-child
connections handled by other helpers would be nice :-)

So ... what are my options ?

--
Thierry
