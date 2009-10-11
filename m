From: jen140@gmail.com
Subject: Re: Port Forwarding
Date: Sun, 11 Oct 2009 03:00:43 +0100
Message-ID: <15653324.20091011030043@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:x-priority
         :message-id:to:subject:mime-version:content-type
         :content-transfer-encoding;
        bh=onO/zu7nvism1hErlthWkeiZ56mq1AP85koUBfeAgLs=;
        b=KH9Yj6TG4MmNA2u54x5pui4o9VgyL+jLhOaTy9liHWC6/H7htk/9KFq+85zt8iZFCg
         g/L0yZ0C7LmANho3O644rtRfm4T529AahoLBoHnTcq7WZuebhqntWZU5vuQgST1u0FSw
         b4KXmfEmfKof54hDrvhjRf8E9BEO2Vvg4ft6g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for your fast responses.
First of all i checked all the next rules:
iptables -A tcp_packets -p TCP -s 0/0 --dport 139 -j ACCEPT
iptables -A udpincoming_packets -p UDP -s 0/0 --source-port 139 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -d 83.132.157.x --dport 139 -j DNAT --to 192.168.0.200:139
//filtered <-
iptables -t nat -I PREROUTING -p tcp -i eth0 --dport 139 -j DNAT --to 192.168.0.200:139
//filtered <-
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 83.132.157.x --dport 139 -j DNAT --to 192.168.0.200:139
iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.200 --dport 139 -j ACCEPT
//closed <- host down
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 139 -j DNAT --to 192.168.0.200:139
iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.200 --dport 139 -j ACCEPT
//filtered <-
iptables -t nat -I PREROUTING -p tcp -i eth0 --dport 139 -j DNAT --to 192.168.0.200:139
iptables -A FORWARD -p tcp -i eth0 -d 83.132.157.x --dport 139 -j ACCEPT
//filtered <- host down
iptables -t nat -I PREROUTING -p tcp -i eth0 --dport 139 -j DNAT --to 192.168.0.200:139
iptables -A FORWARD -p tcp -i eth0 --dport 139 -j ACCEPT
//filtered
With my friend's help.
And none of them directed the output.
There  is  no  problem  to  forward  the  port 139, because it will be
forwarded to a honeypot machine =) (running on virtualbox).
When  started  to  test  with the ipmasq the host stopped to listen on
other  ports  (ssh  for  lan for example),but connection sharing still
works.
And my friend couldnt connect to the host.

