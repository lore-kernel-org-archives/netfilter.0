From: Manuel Scheub <manuel.scheub@kraftcom.de>
Subject: iptables deactivate "getportbyname"
Date: Tue, 15 Jan 2013 13:14:52 +0100
Message-ID: <50F5483C.9050807@kraftcom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

after an upgrade of iptables from version 1.4.3.2 to 1.4.16.3, some 
rules doesn't work anymore.
e.g. all rules with protocol UDP an port information:

#iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
#iptables v1.4.16.3: Port "67" does not resolve to anything.

If I replace the port with the resolving name defined in /etc/services, 
all rules will be accepted:

#iptables -A INPUT -p udp -i eth0 --dport bootps --sport bootpc -j ACCEPT

I saw a "getportbyname" in the source code - is it possible to 
deactivate this "feature"?
I would like to still use numbers instead of names, because if there are 
some special portforwarding rules in my network, it is not guaranteed 
that there is an entry in /etc/services for that port.

Any help would be greatly appreciated!

Greetz
Manu

