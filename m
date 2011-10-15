From: Corey Quinn <corey@sequestered.net>
Subject: IPSEC tunneling-- traffic can't hit the far gateway
Date: Sat, 15 Oct 2011 14:31:08 -0700
Message-ID: <8C003199-D4B1-4CEB-AAEF-C3179C691D5D@sequestered.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've got a (working) IPSEC tunnel going from "here" (192.168.8.0/24) to "there" (192.168.7.0/24) with gateways on the respective .1 IPs. 

Unfortunately, from here, I can't hit 192.168.7.1 directly; I have to bounce through another box in the 192.168.7.0/24 to then hit 192.168.7.1; is there a way to rectify this via iptables on the 192.168.7.1?  

Output of iptables -nvL --line-numbers  at http://www.sequestered.net/~cquinn/iptables.txt, iptables -t nat -nl --line numbers at http://www.sequestered.net/~cquinn/iptables-nat.txt

Regards,
Corey / KB1JWQ