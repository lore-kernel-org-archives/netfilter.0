From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Nat and firewall holes
Date: Mon, 22 Mar 2010 21:16:27 +0530
Message-ID: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=uxyqIBazKB7ix4n4LCLerW0VW3rbSpl6+69KYL/bkOI=;
        b=EiNpo9luDEFGFDfMObWyyYGOKEVHsJ8RFokrkSRjyqs15uYqUPpNuYdgf/LGW/Drzl
         y2NAontoDtY/kQg9pObLMi6YPieif8gwCi6Jn2wNQ+MOpDaDzW4KdlHqFjmJgMc4jqbe
         LBNXgDc/RHYZW7KFr7L0smCi1t3PtA4+6BoFw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi ,

I have a linux machine'( say B )  with two interfaces ( eth0
-192.168.1.1  and eth1 - 192.168.55.1 ) .This linux machine works as a
gateway machine . eth0 is connected to LAN network and eth1 is
connected to WAN network . below rules are applied on the gateway
machine .,

    iptables -A  INPUT -i eth0 -j ACCEPT
    iptables -A INPUT  -i eth1 -j DROP

    iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
    iptables -A FORWARD -i eth1 -o eth0 -j DROP

    iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE .


LAN ---> eth0 : Gateway linux machine :eth1 ---> WAN

We have machine called A , connected to LAN network and is assigned an
ip 192.168.1.100 and its gateway is machine B's eth0 interface (
192.168.1.1 ) .
if i access "google.com " from machine A , syn packet with dest ip as
a.b.c.d ( google.com ip ) and  dest port 80 will go to machine B
(default gateway ) . Since we are masquerading all the packets , it
will change  source ip with 192.168.55.1 and source port with some
random port ( say portx ) . Packets from server will be having
192.18.55.1 ip and port as portx . This will be changed to original ip
and port by conntrack module .

 My qustion is : if i create a packet with source ip as 192.168.55.1
and dest port as portx , can i get into the machine B from WAN side .

Thanks,
Ratheesh.
