From: "Becskei Robert" <robert@capriolo.com>
Subject: Forward Rule, Client access only specific ip's, rest of world access client unrestricted.
Date: Tue, 26 Apr 2011 14:17:13 +0200
Message-ID: <000501cc040b$e0151090$a03f31b0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello List,

I have a problem here, I have a client, which should only be able to access
a few ip's and not the rest. But the rest of my network should be allowed to
access this client unrestricted (that is if they initiate the connection).

Currently I'm using the following rules, which indeed allows client to only
access a few ip's , the rest is dropped. Which is ok for client , but not ok
for lan since if someone else wants to access the client they are also
dropped.

1. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.55 -j ACCEPT
2. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.15 -j ACCEPT
3. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.49 -j ACCEPT
4. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.51 -j ACCEPT
5. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.44 -j ACCEPT
6. iptables -A FORWARD -s 192.168.220.28 -d 192.168.205.33 -j ACCEPT
7. iptables -A FORWARD -s 192.168.220.28 -j DROP

What I want is :
- Client should be able to only access a few selected ip's (see above)
- Client should not be able to access anything else
- BUT! If someone from the network initiates a connection to the client, be
it ping, vnc, or whatever it should be allowed ( I don't know how to do
this)


If someone can please help me :) . Thank you

Robert

