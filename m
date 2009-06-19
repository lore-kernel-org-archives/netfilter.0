From: =?windows-1252?Q?David_Bala=9Eic?= <xerces9@gmail.com>
Subject: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 10:31:22 +0200
Message-ID: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=arYmLIfn73QwUWtuUfT6OxZxigoiDyJNZCk/jROoxq0=;
        b=Wj+YF2qLRfvbNsa1R8TiuVs9ncXWJoYsP/xR96Lm6hYbwTVIY7MCbLemoSh9hkZumX
         B+MS0a6nCUTJuv4hLNKmjMhf7PaHcBXH37Pdv6V/CTea6NSi6t3hLxYpK8reHcwW/6T5
         OlSMzSp5iha7jkyr6xA+xjD4upmZnqUemzKT8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

I have set up a (SixXS[1]) IPv6 tunnel on my linux router and have the
problem, that after a while I become unavailable over IPv6 for the
outside world.
Then I I perform some IPv6 activity, like "ping6 ipv6.google.com" I
become accessible again for a while.

A SixXS FAQ entry[2] suggests adding an iptables rule:
 iptables -t nat -A POSTROUTING --proto ! 41 -o [Your IPv4 Interface]
-j MASQUERADE

This way I get (iptables -t nat -L ...):

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
postrouting_rule  all  --  anywhere             anywhere
MASQUERADE  all  --  anywhere             anywhere
MASQUERADE !ipv6 --  anywhere             anywhere  # the added rule

I am not an iptables expert, but to me it seems the first MASQUERADE
rule matches all packets and the new one does not make any difference.
Can someone confirm that ?


More info:

kernel 2.4.30 (OpenWRT 1.0 - update is not really an option, unfortunately)
iptables v1.3.3

tunnel set up by AICCU 2007.01.15-console by Jeroen Massar
tunnel config excerpt:

# Protocol and server to use for setting up the tunnel (defaults: none)
#protocol <tic|tsp|l2tp>
#server <server to use>
protocol tic
server tic.sixxs.net

ipv6_interface sixxs

Tunnel type: 6in4-heartbeat

Regards,
David


[1] https://www.sixxs.net/
[2] https://www.sixxs.net/faq/connectivity/?faq=conntracking
