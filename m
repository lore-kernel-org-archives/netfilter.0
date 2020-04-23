From: Fatih USTA <fatihusta86@gmail.com>
Subject: conntrack traffic statistics and connlabel
Date: Thu, 23 Apr 2020 17:41:20 +0300
Message-ID: <f7328e62-e490-19e5-75b1-c657236ccb9a@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=p2gZVth7C4gvvJX1zPrMOzKOnJYlvbugyzEHLMZJzMU=;
        b=Qs6bPdEO/TafzdhQ5b6FKLA2sXxTRt5fwMb33nSzATdjVkOBaiyg0DGOUrAVWsiu6W
         g38kOWs4SJCScaNhqOnMezkoS1DiCyFqeHhCPmsy122d2T9GnGesD6oPdabq/El2YLTq
         BcJ9HpbPm1nmT7uqErtPMD0X62GvL0wHYuRVkpqpl36SgwEWq6CyDpuw1KPtNu4tbtSw
         gQL9PRLdch5WNA/wnV/ss3DrHvXR4z1ZS6JdKa6qrabM2KlurBvsmS0imBYD7Qkp1Zqz
         KHsxm1Ts4/xSQWqwqP8J7hiyhLIFOnoPRKzC6Q4DGf8bYAdoTUBgZLtBXE8vBNDkQLBl
         JT9w==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi
I'm trying to get traffic statistics from conntrack which matched with 
iptables rules.


I'm using this method.

echo -e "0 Rule0\n1 Rule1" > /etc/xtables/connlabel.conf

iptables -t filter -N Rule0
iptables -t filter -N Rule1

iptables -t filter -A Rule0 -m connlabel --set --label Rule0
iptables -t filter -A Rule0 -j LOG --log-prefix "Rule0 ACCEPT "
iptables -t filter -A Rule0 -j ACCEPT

iptables -t filter -A Rule1 -m connlabel --set --label Rule1
iptables -t filter -A Rule1 -j LOG --log-prefix "Rule1 ACCEPT "
iptables -t filter -A Rule1 -j ACCEPT

iptables -t filter -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -t filter -A FORWARD -m state --state NEW -m set --match-set 
Rule0_src src -j Rule0
iptables -t filter -A FORWARD -m state --state NEW -m set --match-set 
Rule1_src src -j Rule1

Conntrack event looking like this.

ipv4     2 tcp      6 432000 ESTABLISHED src=10.200.200.1 
dst=10.200.200.21 sport=41090 dport=22 packets=202 bytes=16085 
src=10.200.200.21 dst=10.200.200.1 sport=22 dport=41090 packets=148 
bytes=20737 [ASSURED] mark=0 delta-time=62 [start=Thu Apr 23 11:58:23 
2020] use=1 id=2928336586 labels=Rule0


I have some issues my setup.
1- Conntrack couldn't pass label information when event state is 
DESTROY. I need this. ( iptables v1.6.1, conntrack v1.4.4)
2- Connlabel limit is 127 in kernel "xt_connlabel.h" header file. This 
is so limited for my design. If I increase this value in kernel what is 
the effect?

Is this method good design or are there any other suggestion?

Thank you.

-- 
Fatih USTA

