From: veerasena reddy <veeruyours@yahoo.com>
Subject: ebtables filtering based on destination MAC match doesn't work with FORWARD chain
Date: Tue, 20 Oct 2009 08:32:19 -0700 (PDT)
Message-ID: <697388.24536.qm@web56403.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1256052739; bh=E0R5jSJWQPyy7k5+hSNNVkwciQP8VYYCHpsFgXkyric=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=aTxRlrrmibi6pPLm7TZ7iqS8ES73bLEjUwjwy4dYo95Qkfa4B+Sl6oiGcaJCgY9B43bQuUBdsOZpbn0pHGPoiIYsAGga76IswO7LDaXYPJtYZRCuBc+Dxbtv+z2dv59FrBgmSmTw2qu9Q9wb2tRdLZn7hYY7D09HTjObAn5xnyU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I configured a ebtables rule to DROP all the frames going through FORWARD chain matching the destination entry "0:b:db:da:34:c":
/ # ebtables -t filter -A FORWARD -d 00:0b:db:da:34:0c -i eth0 -o eth1 -j DROP

My test setup is as below:
PC1<--->eth0---My_bridge---eth1<-->PC2
PC2 MAC address: 00:0b:db:da:34:0c

With this, if i try to send PING traffic from PC1 (connected to eth0) to PC2 (connected to eth1) the PING traffic goes fine. I do not see any DROP in the traffic.
My observations are as below:
1. first the ARP request from PC1 (with dmac: ff:ff:...:ff) reaches PC2 and PC2 sends the ARP reply back to PC1.
2. Now the echo request frame sent by PC1 has been received by PC2 and PC2 sending echo replies back to PC1.
3. If i configure ebtables with source MAC match rule as below, it works fine (ARP wont get resolved as all the ARP reply messages from PC2 will be dropped by ebatables).
/ # ebtables -t filter -A FORWARD -s 00:0b:db:da:34:0c -i eth1 -j DROP

Can someone tell if the ebtable confiugration command given above is correct or i need to load some ebtables modules?
Also, please tell if more information is required to understand the issue?

Thanks in advance.

Regards,
Veerasena.



      
