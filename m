From: Philipp Weber <jpp.weber@googlemail.com>
Subject: iptables nat ftp xen Problem
Date: Tue, 7 Jun 2011 13:15:12 +0200
Message-ID: <640D65CF-1C2A-410A-87C6-A96E0859BCCE@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:from:content-type:content-transfer-encoding
         :subject:date:message-id:to:mime-version:x-mailer;
        bh=dyIJBNGq2vvOuUuaG7vzv/Z6NxEW17l+l56Mw0yCOFs=;
        b=OyBDOFEfTnPewht5lDx0ciVQS76SJq5Lu4TuaMEh5TYCC1wGynfloys6U4paq1Uui5
         TmqE/Gr9GlV5gHEDp3uH3+HjIg0pJey88WAMFewbxSh+c4TEFqdbyOwrOvxHFUeAtY7P
         BYTGJ8+pOdl0kaQ0yzepALChphjP1tO7W234U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

ive got a problem with FTP in my NAT.

First the NAT:

Host with Xen ( dom0)
- 188.138.122.XXX - eth0 ( public ip )
	
		domUs ( VMs )
		10.0.0.1 LAMP
		10.0.0.3 Voice
		10.0.0.4 GS_ISP (Gameserver)
		10.0.0.5 GS_HL

So now i want to be able to connect to each VM via FTP and SSH, my idea is this.

Host:
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 20 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 21 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 201 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 202 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 203 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 204 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 205 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 211 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 212 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 213 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 214 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 215 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 221 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 222 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 223 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 224 -j ACCEPT
[0:0] -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 225 -j ACCEPT

[0:0] -A PREROUTING -p tcp -m tcp --dport 201 -j DNAT --to-destination 10.0.0.1:201
[0:0] -A PREROUTING -p tcp -m tcp --dport 202 -j DNAT --to-destination 10.0.0.2:202
[0:0] -A PREROUTING -p tcp -m tcp --dport 203 -j DNAT --to-destination 10.0.0.3:203
[0:0] -A PREROUTING -p tcp -m tcp --dport 204 -j DNAT --to-destination 10.0.0.4:204
[0:0] -A PREROUTING -p tcp -m tcp --dport 205 -j DNAT --to-destination 10.0.0.5:205
[0:0] -A PREROUTING -p tcp -m tcp --dport 211 -j DNAT --to-destination 10.0.0.1:211
[0:0] -A PREROUTING -p tcp -m tcp --dport 212 -j DNAT --to-destination 10.0.0.2:212
[0:0] -A PREROUTING -p tcp -m tcp --dport 213 -j DNAT --to-destination 10.0.0.3:213
[0:0] -A PREROUTING -p tcp -m tcp --dport 214 -j DNAT --to-destination 10.0.0.4:214
[0:0] -A PREROUTING -p tcp -m tcp --dport 215 -j DNAT --to-destination 10.0.0.5:215
[0:0] -A PREROUTING -p tcp -m tcp --dport 221 -j DNAT --to-destination 10.0.0.1:221
[0:0] -A PREROUTING -p tcp -m tcp --dport 222 -j DNAT --to-destination 10.0.0.2:222
[0:0] -A PREROUTING -p tcp -m tcp --dport 223 -j DNAT --to-destination 10.0.0.3:223
[0:0] -A PREROUTING -p tcp -m tcp --dport 224 -j DNAT --to-destination 10.0.0.4:224
[0:0] -A PREROUTING -p tcp -m tcp --dport 225 -j DNAT --to-destination 10.0.0.5:225

On VMs ( Example LAMP )
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 21 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 20 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 201 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 211 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 221 -j ACCEPT
 
-A PREROUTING -p tcp -m tcp --dport 201 -j REDIRECT --to-ports 20
-A PREROUTING -p tcp -m tcp --dport 211 -j REDIRECT --to-ports 21
-A PREROUTING -p tcp -m tcp --dport 221 -j REDIRECT --to-ports 22

Pastebin of Host iptables save:


Pastebin of Lamp iptables save:
http://pastebin.com/8VZH1ZA8

And now my Problem, i tried this, and it worked for one time, then a few days later i have the time to make it complete for all maschines, but now, it fails by cant connect to anywhere.

So i have to say, thats the first time i get deep intouch with iptables, but i want to learn.
The routing for all other services works fine.

It would be wonderful if you can help me =)

Best Regards
	Phil





