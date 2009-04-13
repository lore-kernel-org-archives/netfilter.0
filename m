From: no doubt <hell.no.doubt@gmail.com>
Subject: need help on *nat filter for multiple source IP
Date: Mon, 13 Apr 2009 11:05:07 +0800
Message-ID: <5a7ba2310904122005k6606f6falba0b74b118f42090@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=JdxEg+pQ6v+sc/sevL/+qwQYN5hbxCCrsk0LytcwRLk=;
        b=lHw1v5DpOfTLcYpx+Dwpu6qYkSro5j6e1fij+ASNOpWEGQw+g/qda6EJwVjavdxc9m
         /fFYGvVP7DwhSHu9XqRVzi8Z1pYH+SHP/FSJOHw+F84qiXa/0ak8wU7eyq5fWkWkAkVv
         /9IZNAqDiHbAcrKhwarMx/jNde8/LjuRKXZDM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Currently Im running a gw firewall for internal soho network.

I would like to achieve that for all IP's in 192.168.4.0/24 that are
accessing outside internet address port 80, will be directed to
192.168.3.10 port 80 EXCEPT for few IPs namely 192.168.4.10,
192.168.4.100 and 192.168.4.20

my rules in nat filter read like this.
*nat
:PREROUTING ACCEPT [4314:569235]
:POSTROUTING ACCEPT [42:12421]
:OUTPUT ACCEPT [2807:264498]

iptables -A PREROUTING -s ! 192.168.4.10/32 -d ! 192.168.0.0/16 -i
eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
iptables -A PREROUTING -s ! 192.168.4.20/32 -d ! 192.168.0.0/16 -i
eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
iptables -A PREROUTING -s ! 192.168.4.100/32 -d ! 192.168.0.0/16 -i
eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10

-A POSTROUTING -o ppp+ -j MASQUERADE
COMMIT

somehoe it doesnt work. but if I left only 1st line, it works.

is there anything i can modify the rules ?
