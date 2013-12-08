From: "Nicki P." <xastx@gmx.de>
Subject: ipt_SYNPROXY: kernel panic with nullpointer dereference at
 dst_ifdown()
Date: Sun, 8 Dec 2013 07:59:17 +0100
Message-ID: <645a249c0e76a622fb7bfdc35bd19dc1.squirrel@webmail.interwerk.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

when activating ipt_SYNPROXY with:
iptables -t raw -A PREROUTING -p tcp -d 1.2.3.4 --dport 80 --tcp-flags
SYN,ACK,RST,FIN SYN -j SYNPROXY

and sending a SYN packet to port 80:
hping3 -S -d 64 1.2.3.4 -p 80

I get kernel panic:
http://goo.gl/L6dCz6

I'm using kernel v3.12.2 and iptables v1.4.21. Am I doing something wrong,
or is it a bug?

thank you for help beforehand :)

greetings,
nicki


