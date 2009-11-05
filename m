From: Sandy Sumitro <sandysumitro@gmail.com>
Subject: [HELP] forward ppp0 to eth1
Date: Thu, 5 Nov 2009 20:32:37 +0700
Message-ID: <fe4bdfcf0911050532h5a954b63s43f01a7eff0b4aa9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=RnTVS6J768jRq8uD42RixLwrS8Q7T97nkBNd/PaqCQ0=;
        b=C2PKbp2bxGladBiPAEswrmKJgLTVQi3axQTUrzL22iRw6vEwDm/sBoUfRYa/HN1Ye4
         XW/nbVPMZDalpjtWdIYkjVTG2sBPG8HnDyxyB40PjWPSvRoonlx/PsaoymCTPFEVAapd
         wmY6IExyHh56YSdW+e2pL3yPz0GK4sE34q7lA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear All,

My current situation:

I have one computer:
- eth0 -> connected to and dial DSL modem (pppoe), no IP
- eth1 -> connected to LAN, IP: 192.168.1.251
- ppp0 -> up after dialup (dynamic IP)

I have another computer with IP: 192.168.1.252

What i want is:
- i want to redirect all request to ppp0 to eth1, which will forward
to another computer (192.168.1.252).

I am using these rules, but not working:

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -F
iptables -t nat -A PREROUTING -i ppp0 -j DNAT --to-destination 192.168.1.252
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.252 -o ppp0 -j MASQUERADE

PS: i have set /proc/sys/net/ipv4/ip_forward to 1
(echo 1 > /proc/sys/net/ipv4/ip_forward)

Please help.
Best regards,
Sandy
