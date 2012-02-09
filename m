From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Masquerade UDP doesn't work
Date: Wed, 8 Feb 2012 23:35:47 -0600 (CST)
Message-ID: <29809830.2793.1328765747294.JavaMail.root@ixer.mx>
References: <9435037.2791.1328765711483.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9435037.2791.1328765711483.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Masquerade do not work at a UDP port, but if it works at a TCP port.

(works) iptables -t nat -I POSTROUTING -m tcp -p tcp --dport 22 -o ppp0 -j MASQUERADE
(not working) iptables -t nat -I POSTROUTING -m udp -p udp --dport 1195 -o ppp0 -j MASQUERADE


Any ideas?

regards

E.Huerta
 
