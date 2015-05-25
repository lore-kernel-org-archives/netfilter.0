From: =?UTF-8?B?Tml5YXppIFPEsXJ0?= <nyzsirt@gmail.com>
Subject: SynProxy Problem with Asymmetric dual bridge topology
Date: Mon, 25 May 2015 12:55:48 +0300
Message-ID: <5562F1A4.9080101@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=iHZME41ZiwGs/AEnpyTAm+2OL+zEMBUM/88InjYwjRE=;
        b=0j/ismVQCthlkUvmnMfVWshJspNYlvHKlUMhk/KeLeacmUmUhjkB/VcQH37aAhvpPK
         yAqHgCNf9R/BqMtrOoU7w4znymdplph7ESb0p0RTpWoqF1IZXwTZuyruBJgKF+aACoP8
         AmAJazVchNflufXGnseCe9AlkhJRezGx5QV+XAtd5kP6MywOzFzB97EukyyWHOQn3TV7
         2prNnqGrXDX5PytdXRXghFJlgRAzPnWkPFHOrQC87vosQRVbmfNnGawz65HQiT73xgUM
         j3jNyY5A00UIoO7bbqgIMrJByL+OSVAaR4vY1uhKNhJDwQJDRKJT9iPZOsN1R6ORZI4c
         SnCA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a asymmetric dual bridge topology as shown below:

                       -------
                       |     |
                       ---o--- 172.16.11.5
                          |
                          |
                     -----o----- 172.16.11.6
                     |         |
                     |         | default gw 1.1.1.1
                     |         |
          1.1.1.2/30 --o----o--- 2.2.2.2/30
                       |    |
                       |    |
                       |    | (enp10s0f0)
                   ----o----o-----
                   |             |
                   |     XXX     |
                   |             |
                   |  br1   br0  | synproxy
                   |             |
                   ----o----o-----
                       |    |
                       |    |
                       |    |
          1.1.1.1/30 --o----o--- 2.2.2.1/30
                     |         |
                     |         | default gw 2.2.2.2
                     |         |
                     -----o----- 172.16.10.1
                          |
                          |
                       ---o--- 172.16.10.6
                       |     |
                       -------

On all machines between 172.16.11.5 and 172.16.10.6
"rp filtering" is off and "ip forwarding" is on.
There is a machine at the middle of topology which is
called "XXX" machine. XXX has two bridges and a SynProxy.


When SynProxy is turned OFF on XXX, I can ping from
172.16.11.5 to 172.16.10.6 and icmp packets follow
this path: br1->172.16.10.1->172.16.10.6->172.16.10.1->br0.
In addition, I can access from 172.16.11.5 to
172.16.10.6 with ssh. So the TCP traffic works as I expect.


However, when SynProxy is turned ON on XXX, I can ping
from 172.16.11.5 to 172.16.10.6 and icmp packets follow
the same path. But I can not access from 172.16.11.5
to 172.16.10.6 using ssh. This is because synproxy can
not send syn ack replies through br1 iface. If I add a
route for synack packets on XXX, i can connect from
172.16.11.5 to 172.16.10.6 with ssh.

route add 172.16.11.5 dev enp10s0f0


But this is not acceptable because 172.16.11.0 network
is cloud. So i could not add route all cloud network
to route table and could not add mac address to arp
table.

How can I connect from 172.16.11.5 to the 172.16.10.6
machine using ssh when SynProxy is turned ON on XXX?

Thanks in advance,

Niyazi
