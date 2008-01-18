From: Swapnil Jain <swapnil.indore@gmail.com>
Subject: forwarding udp broadcast
Date: Fri, 18 Jan 2008 17:46:06 +0530
Message-ID: <47909886.6010305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
        bh=LvuzdUgwPaoRhaYJlZkiSPBAqhi6GqQjtbm+crYucEI=;
        b=kVxUcUXEDuU+3dnU8KG6u6FPmGu960qbljGExvb9pnckz/quo/82eusPHU8a5BR/BiLW8QcfAhN4mV3NUvAEHV2Tt1oVwHY3VM4OTxitmBsMllcmDZMTuLcrRpk+MbI5okF1TpzFMg+thy84WVCCE6xfCJbuDyK/qVBbEhz+Vt0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

i have 2 LANs say

LAN1) 192.168.1.xxx
LAN2) 192.168.2.xxx

i have a application server on LAN1 which send UDP broadcast on 
192.168.1.255 on port 1234

i want to place a linux box between this 2 LAN and the it should take 
the UDP broadcast of 192.168.1.255 of port 1234 and send it to LAN2 on 
192.168.2.255 on the same port.

How is it possible thru iptables.

___
Swapnil Jain
Indore
