From: Tobias Andresen <tobiasarp@gmx.de>
Subject: NTP forwarding
Date: Sat, 5 Mar 2016 15:15:49 +0100
Message-ID: <56DAEA15.409@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

i have following network structure:


     NTP-Server (62.214.6.29)
               |
               |
               |
      (eth0: 10.0.0.95)
        Embedded board
    (eth1: 192.168.31.95)
               |
               |
               |
        Ethernet-Switch
         |        |    |
         |        |    |
        PC1       |   PC3 (192.168.31.98)
(192.168.31.96)  |
                  |
                 PC2
(192.168.31.97)


The 3 PCs shall be able to connect to the NTP server (62.214.6.29)
to update their time but i cannot figure out how to configure the 
iptables rules
on the embedded board to achieve this.

I have tried to forward port 123 but it does not work.

Regards
Tobias

