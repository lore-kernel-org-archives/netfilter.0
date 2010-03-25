From: Ajay Lele <ajay.lele@gmail.com>
Subject: Can arptables be used to SNAT TCP/UDP traffic?
Date: Thu, 25 Mar 2010 14:56:03 -0700
Message-ID: <bf5857901003251456n4b52eaa3n532fd13ab6ba573a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=om0VNXxxD3KAGPvfDhFhl33DjKevtT+ZkOAl6luh3ZU=;
        b=omIwisRf8mH3iRCrarMAGg4HFlPtXC9uzXpK3iDd3diSiNIkFe+NWy7bLHJumdW+gj
         M3bM838jjaHBuEEK5H+hp2PTBCJhlT1vGwynhNhDtKHZTlkqkgPI1N6lJCUxTc/2Zflg
         6noMXNLSQBmfXqJaCI0zkAeZT37r1S5wEoyBs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Forgive my ignorance, but I have a basic question regarding use of
arptables. For a peculiar VPN address management scenario, I want to
change source address of incoming packet destined for the box (inner
IP packet in the IPsec tunnel terminated on the box) to a certain
value. With iptables, SNAT can be configured only for POSTROUTING
chain which won't be hit in this case as the packet is destined for
the box. Is there a way this can be done with arptables (tried command
below, but it's not making any difference), or do arptables rules
apply only to ARP packets?

arptables -A INPUT -s 192.168.103.1 -d 172.16.2.1 -i eth0 --proto-type
"ipv4" -j mangle --mangle-ip-s 172.16.4.1

Thanks in advance

Regards
Ajay
