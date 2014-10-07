From: Meike Stone <meike.stone@googlemail.com>
Subject: dyn. SNAT based on different source addresses?
Date: Tue, 7 Oct 2014 20:27:49 +0200
Message-ID: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=VXrZuDdHCD5FqgAkagRylvp5d57c1GOpreKpryM5Gdo=;
        b=dTICKr48yplNUHAhisTmslW5RkrgksXf9GSnwgEHGHmc7HaGJlGHDC5Jrq9I0LgSgH
         LOoO7+f2+4HtOPxQJ0R2XQBnn/sjymoWDdAQrmeBQoextFt7kw9ez+tZPzNT1hDhK51h
         LpRqRESjLd+406/Co/L6zcvyE7m8yulu+uHCSCycf9u8NN/QTnDY4xI5PYdxwLmGVKr1
         Kan6zyVqMc4ZTGmee2JHiS3EraT3PYLGNIPtvVkNXd6qolSeFxSPUz7QkCphEHeYT0QU
         0DQb2nqqq3vnhdBmSKHVUEjyz5Fx5BuPJ/GeSKWSG3ZKTZ/OnJesEKjA/0D2PCSMPZFm
         uw/w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello,

we have a lot windows terminal server (TS) and want to access from
that TS to a file server behind a firewall, only NAT is possible. The
problem is that the smb protocol is not NAT compatible:
(msdn.microsoft.com/en-us/library/ee441661.aspx)

Simplified NAT (SNAT/DNAT) scenario I used is:

[192.168.1.0/24] - > Network wit TS
[192.168.2.0/24] - > Network, where the file server is located

192.168.2.142 =3D> Fileserver
192.168.1.20   =3D> "DNAT-IP" f=C3=BCr Fileserver

All packages from the TSs in 192.168.1.0/24 will be translated in the s=
rc IP
192.168.2.222 (SNAT). TSs are connecting to 192.168.1.20 (DNAT) to
open a smb-session.

iptables -t nat -A POSTROUTING -o eth0 --dst 192.168.2.142 -j SNAT
--to-source 192.168.2.222
iptables -t nat -A PREROUTING -i eth1 --dst 192.168.1.20 -p tcp
--dport 139 -j DNAT --to-destination 192.168.2.142
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.1.0/24 -d 192.168.2.142
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -s 192.168.2.142 -d 192.168.1.0/24
-m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A OUTPUT -o eth1 --dst 192.168.1.20 -j ACCEPT

That works fine, but with the described problem, connections are lost
because of imperfection in the smb protocol.


I'm looking for a solution, that each new connection  (to
192.168.1.20) from a different terminal server gets a new (SNAT)
address from a configured dynmaic pool in 192.168.2.0.


Using NETMAP, is a possible solution, following example works for me,
but is it not dynamic, all IP addresses are mapped 1:1

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j NETMAP --to 192.168=
=2E2.0/24
iptables -t nat -A PREROUTING -i eth1 --dst 192.168.1.20 -p tcp
--dport 139 -j DNAT --to-destination 192.168.2.142
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.1.0/24 -d 192.168.2.142
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -s 192.168.2.142 -d 192.168.1.0/24
-m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A OUTPUT -o eth1 --dst 192.168.1.20 -j ACCEPT

If terminal servers are not located in 192.168.1.0 but in different
networks connected via router,
I have a problem ....

Does anyone have a clue?

Thanks Meike
