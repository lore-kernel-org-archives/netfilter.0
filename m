From: paulo bruck <paulobruck1@gmail.com>
Subject: CONNMARK not working ?
Date: Mon, 23 Oct 2017 20:15:17 -0200
Message-ID: <CANSGRxTdrVG_-1uMA40bKXO0QxjDsKfWEJ27nLVOR6eXXUE5tQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qeZIePjMB6O4Wok7sTG1v0rNtHu6dBb1PU+4HAPQwh4=;
        b=aHUw1T+SikA5lYgIWC05ojpVfNjscs9zGfciM2oL0eLWuLNt6AypH94w3hcNOB6Ztr
         /CKD2af66X7gUUqwFOr+D8FZXdFOp3Q01hjohxQelO89BdJQGrNvYG2FxFodnVolX2ME
         SPDf3QrPd6uLryqbp+7Y3Ja7apByGHlq76SAJQuf1n0aCKGPKpDffMHprb9cQhdJuab+
         pZQZDLLXQyo2WRK9jCUu1ejDxzjkOTn+rNaRYtB0XQfh7aPXPWbv6PcXuoh64hLydmhu
         q3XDNOxIEmypBhrtaItYVf55iU9+kNMT9NoP0KqN0QhxW7KvqkCJ2yrhAU+XTrKhUamp
         JXYA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Guys

After 4 days testing and looking at google I decided to ask a litle
help using CONNMARK/MARK .




debian strech w/ 3.16.0-4-amd64

What I have

lan------- firewall--------- wan1------internet
                       |-----------wan2 -----internet

All interfaces as bridges

Firewall  runs an apache inside for reports.

What I have tried

net.ipv4.conf.all.rp_filter = 0


iptables  -P INPUT        DROP
iptables -P OUTPUT     ACCEPT
iptables -P FORWARD DROP


----cut----

iptables -A  INPUT -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT
iptables -A  OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT
iptables -A  FORWARD -m conntrack --ctstate ESTABLISHED,RELATED  -j ACCEPT

iptables -t nat -A POSTROUTING -o wan1 -j SNAT --to 192.168.1.2
iptables -t nat -A POSTROUTING -o wan2 -j SNAT --to 201.6.110.xxx

# open  to apache
iptables -A INPUT -p tcp --dport 80 -j ACCEPT


iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW
-j CONNMARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark


iptables -t mangle -A PREROUTING -i wan2 -m conntrack --ctstate NEW
-j CONNMARK --set-mark 0x2
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark


I can reach apache  but looking at conntrack -L  I see :

tcp      6 107 TIME_WAIT src=192.241.152.243 dst=192.168.1.2
sport=53545 dport=80 src=192.168.1.2 dst=192.241.152.243 sport=80
dport=53545 [ASSURED] mark=0 use=1
tcp      6 103 TIME_WAIT src=192.241.152.243 dst=192.168.1.2
sport=53544 dport=80 src=192.168.1.2 dst=192.241.152.243 sport=80
dport=53544 [ASSURED] mark=0 use=1


Should be mark=1 ?? How can I force mark=1

Things that I've already tried:

a)
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW
-j CONNMARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark

b)
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW
-j MARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark


c)
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW
--mark mark=0  -j MARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark

d)
iptables -t mangle -A PREROUTING -i wan1 -m connmark --mark=0 -j MARK
--set-mark 0x1
iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate
ESTABLISHED,RELATED  -j CONNMARK --restore-mark

Certanly I am missig something.

Could you help me ?

Thanks in advanced


Btw what should be  the best solution ?

-m connmark --set-mark (+) -j CONNMARK
-j CONNMARK (+) MARK --set-mark
-m conntrack -j CONNMARK
or another one?

-- 
Paulo Ricardo Bruck consultor
