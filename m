From: Wayne Bao <herecomeswaynebao0811@gmail.com>
Subject: Incompatibility when use python3-nftables and iptables-nft
Date: Wed, 9 Aug 2023 23:20:48 -0400
Message-ID: <CAH+uSBVmDF0kUTM2UFKZr2iFeFzMeZ2958sttgZGXftwR6H3MA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691637660; x=1692242460;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBnnVHrO2QgEAbTnX8bORzV091pV5d3C6vHfQ9djyeo=;
        b=rjDjvfhyvhObciwEUT3YmDy0p59/SOrmoXYUo6FGi3/qQLbY4rhicBlinOdYBjJlNV
         RVlbAm1NnQNNMHgCSGrRtTHH4UDZUgiN8WMVGKKF3UXnLkqLndoGUAou9A/NSrVyFMXW
         9WRhMKU3FP+oTvz0W31OfKVK6f5/RC7XiQmm5H4uRh26/4NzOh0ndA8eREC+uuuRuL0l
         O+Ac5JOdMwc0PQM+pJm39nDeXmdkdDxC2SOw62SLea06DgYAAnvmWPNU25TY5PZs2ozA
         BowJ/9txTOnIZNMLvwzH9nGwy3oykk/18XxYvV1AQnbeEpnh/Leh7o2WafdZGgf4pcKa
         0KWw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am using python3-nftables
(https://github.com/ansibleguy/python3-nftables) to programatically
update rules, and at the same time using iptables-nft from commandline
to manage rules. I see incompatibility when I use these two together:

1. If I add a rule using iptables:
iptables -A INPUT -p tcp --dport 443 -s 1.2.3.4 -i eth1 -j ACCEPT

then python3-nftables "list ruleset" does not show dport 443:
{'rule': {'family': 'ip', 'table': 'filter', 'chain': 'INPUT',
'handle': 4, 'expr': [{'match': {'op': '==', 'left': {'meta': {'key':
'iifname'}}, 'right': 'eth1'}}, {'match': {'op': '==', 'left':
{'meta': {'key': 'l4proto'}}, 'right': 'tcp'}}, {'match': {'op': '==',
'left': {'payload': {'protocol': 'ip', 'field': 'saddr'}}, 'right':
'1.2.3.4'}}, {'xt': None}, {'counter': {'packets': 0, 'bytes': 0}},
{'accept': None}]}}

2. If I add a rule using python3-nftables while the filter table and
INPUT chain exists:
{"nftables": [{"add": {"rule": {
                    "family": "ip",
                    "table": "filter",
                    "chain": "INPUT",
                    "expr": [
                        {
                            "match": {
                                "op": "==",
                                "left": {"meta": {"key": "iifname"}},
                                "right": "eth1",
                            }
                        },
                        {
                            "match": {
                                "op": "==",
                                "left": {
                                    "payload": {"protocol": "tcp",
"field": "dport"}
                                },
                                "right": 443,
                            }
                        },
                        {
                            "match": {
                                "op": "==",
                                "left": {
                                    "payload": {"protocol": "ip",
"field": "saddr"}
                                },
                                "right": "1.2.3.4",
                            }
                        },
                        {"counter": {"packets": 0, "bytes": 0}},
                        {"accept": None},
                    ]}}}]}

then "iptables -nL" does not show dport 443:
iptables -nL
------
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  1.2.3.4              0.0.0.0/0

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
-------

Is this a bug when using python3-nftables and iptables-nft?

I am running on a RHEL8 docker instance and my python3-nftables and
iptables-nft version:
iptables --version
iptables v1.8.4 (nf_tables)

python3.11
ansibleguy-nftables       1.0.2
