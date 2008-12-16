From: "Javi Legido" <javi@legido.com>
Subject: Iptables with Apache - virtualhosts by name
Date: Tue, 16 Dec 2008 15:07:06 +0100
Message-ID: <22552e810812160607m3a2d202dt82ded7d9425fce13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:mime-version:content-type:content-transfer-encoding
         :content-disposition:x-google-sender-auth;
        bh=kG7N61KSc4/gC28LAHNfcwGRgvKDLT1UcwtQqSwfq4w=;
        b=feX8ymESIdTnOeIuuo531aISCfrb7VpnRiIlSfMDGlQqAA1MS7ZN6nEURuhA15mkAR
         JAQEt1eOZb7hw5Fc/6qcCcGgnZXt80WS7rIBn7wvOyr/Hs9e1xkPXmZWL5dG0obaOdM/
         1GAm1QoZ/lwSp1f5IXnk+KCSTzVTlGv1oaliY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi.

i have the following machines:

[Router] <=> [Server]

I have a Apache with virtual hosts by name working properly in the
server. But when i 'turn on' iptables, it's impossible to connect to
ANY page.

iptables -S

-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-A INPUT -s public_ip_pc_132 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s public_ip_pc_132 -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -s 192.168.1.31/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s public_ip_pc_2/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s public_ip_pc_2/32 -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -s public_ip_pc_3/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -s public_ip_pc_3/32 -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -s 192.168.1.30/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --sport 80 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 4080 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 4080 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 21 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --sport 23 -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -p tcp -m tcp --dport 9999 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 6882 -j ACCEPT
-A FORWARD -p udp -m udp --dport 5865 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 5865 -j ACCEPT
-A FORWARD -p udp -m udp --dport 8443 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 8443 -j ACCEPT
-A FORWARD -p udp -m udp --dport 4666 -j ACCEPT
-A FORWARD -p tcp -m tcp --dport 4662 -j ACCEPT
-A FORWARD -j REJECT --reject-with icmp-port-unreachable

Can anybody tells me the right rule to allow iptables filter http
traffic (remember the virtual host setting)?

Thanks in advice.

Javier
