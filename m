From: Elison Niven <elison.niven@gmail.com>
Subject: Limiting bandwidth on router
Date: Fri, 23 Jul 2010 16:07:50 +0530
Message-ID: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=RQYJdDM5j+L/6zEsjU/Q8+Krx6OJieazUjPeGMZZ5hw=;
        b=dWw0909TCjm/2G+6ZDqw/3zr6oXtUJss9Xp4JeBWjMlL3roMxPZB80etK0RsB7JFVr
         n4JtCl5wUKkVHCZSNtiamuMk2B7GKhIn9IVMzOBKFJIMzqRV7UtmA1aXcyCVs4CA2p3h
         7JH2Ukr3aiglqlr8gDZ50UxZ2Ld5wzdqk6mfM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: elison.niven@matrixcomsec.com

Hi list,
I have an ARM based board with 2 ethernet interfaces eth0 and eth1.
eth0 - LAN interface. 192.168.2.149
eth1 - WAN interface. 192.168.1.149
I have setup a simple router using iptables that allows PCs on the LAN
to browse the internet via the WAN.
I want to limit incoming bandwidth on the LAN interface to about
8mbit/s as when there are massive data transfers initiating from the
PCs on the LAN, the system is under heavy load and is not able to
execute any applications.

I tried to limit the bandwidth using tc's tbf and ingress but it isn't
really working well.
For example from a PC on the LAN (ip 192.168.2.13, default gw 192.168.2.149)
# ping -f -s 1000 192.168.1.3
This is correctly limited and ping results show the loss.

# ping -f -s 1 192.168.1.3
Here the system is under heavy load and is not able to execute any
applications. No loss in ping.

Also when I create a udp socket from this PC to an address on the WAN,
the rate is not limited.
#./udpclient 20000 192.168.1.3 20000 1000
This utility sends 20000 packets of 1000 bytes each to 192.168.1.3.
Here also the rate is not limited.

Do I need to use some other tools than tc? Or use hashlimit in iptables?
Can anyone help me the tc configuration?

I am using linux-2.6.30 and iptables-1.4.4.

Thanks and Regards,
Elison
