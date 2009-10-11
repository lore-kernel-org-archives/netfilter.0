From: jen140@gmail.com
Subject: Port Forwarding
Date: Sun, 11 Oct 2009 01:30:39 +0100
Message-ID: <1572887654.20091011013039@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:x-priority
         :message-id:to:subject:mime-version:content-type
         :content-transfer-encoding;
        bh=MApYxfbJSrB7H3gGapPGYC1VsknZbu5HunF54doO4rE=;
        b=BNYDY6Lhxj3yobj0/tBkLEnztqS6wo3U4wxff9ch7p3X+TWbRICuIU0AcZTuPSd6Yq
         vzeTnSB339O1uJvRZmh/jskBvZvllFGi+36EGdyl+Iqs+iXaEDBy2dGeleNYi+Xx2087
         3zpQZnWTzMiP6OA3UBCNlNDn0ES1aADWLZ6xY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.
I am running Debian(5.0.3), and have kernel version: 2.6.26-2-686.
And I have just installed the iptables v1.4.5.
After  searching for help on debian and ubuntu forums, i didnt get any
response, so I'm writing here.
My network configuration is next:
eth0 is my internet interface and has dinamic ip(83.x.x.x).
eth1 is my intranet interface and has static ip(192.168.0.1).
The server machine(thise pc) shares internet with other machines.
At debian start iptables has the next config:
iptables -P FORWARD ACCEPT
iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
So now getting to the problem.
I  wanted  to configure port forwarding, and forward port 135 from Any
address  that  comes from eth0 (internet) to ip 192.168.0.200 and same
port(135).
I've tryied running the next:
iptables -F
iptables -t nat -F
iptables -P FORWARD ACCEPT
iptables --table nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
iptables --table nat -A PREROUTING --in-interface eth0 -j DNAT -p tcp --dport 135 --to 192.168.0.200:135
But   the   problem   is   that  it  is  filtered  (I  check  it  with
nmap-online.com service).
Am i doing anything wrong or my kernel doesnt support it ?
Thanks in advance.
Have a good day.

