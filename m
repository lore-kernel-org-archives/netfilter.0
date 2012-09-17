From: <joydeep@infoservices.in>
Subject: iptables port redirect question
Date: Mon, 17 Sep 2012 11:03:00 +0530
Message-ID: <20120917110300.5e546d0c@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

How can I redirect all packets exclude the packets for lan ( 192.168.0.0 ) and
all packets to/from lo (localhost) ?

I have done something like

[.......]

    # Traffic on the loopback interface is accepted.
    iptables -A INPUT -i lo -j ACCEPT

   # Internal network connections are accepted. 
    iptables -A OUTPUT -d 192.168.0.0/255.255.0.0 -j ACCEPT


 iptables -t nat -A OUTPUT ! -o lo -p tcp -m tcp -j REDIRECT --to-ports 8080
 iptables -t filter -A OUTPUT -p tcp -m tcp --dport 8080 -j ACCEPT
 iptables -t filter -A OUTPUT ! -o lo -j DROP

[...............]

But this also redirect all local lan packets naturally, as it compares with lo . How can I combined both lo and local lan ?
Can a customized chain help ?

Thanks
