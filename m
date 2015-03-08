From: "Nima Afshari" <nima.afshari.1389@gmail.com>
Subject: Forward all incoming connection to other address
Date: Sun,  8 Mar 2015 17:25:58 +0100 (CET)
Message-ID: <20150308162558.44F3AD5428@emkei.cz>
Reply-To: nima.afshari.1389@gmail.com
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Folks.
I want to Forward all incoming connection to other address. I use Below iptable rule :

iptables -t nat -A PREROUTING -p tcp -m tcp ! --dport 22 -j DNAT --to 1.2.3.4

But not worked? I added same rule with "udp" protocol too but when I scanning my system With Nmap, Nmap scan my address and not 1.2.3.4

Any idea to solve it?
