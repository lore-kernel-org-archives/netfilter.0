From: Naruto Nguyen <narutonguyen2018@gmail.com>
Subject: ESTABLISHED tcp conntrack timeout
Date: Wed, 10 Apr 2019 17:47:35 +0700
Message-ID: <CANpxKHGdbN6UYTw=r=r9=usZ3taX05ARpnAQ_StF4Zikcpp5WA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IlOlvllLCb4mFv3NHy4iq6nwncGuxZrWcuLR/98ZkyM=;
        b=j7/2Qn6pkhSXM3IcQ+TQ+dX41h6pHiuntsMNSc3i+lqdbz0QX5PkHpSTe3aKLGCidk
         NtQmwoOA7c2AzkXihIOa0X0wVobi88gMytCaIeKz56doSMPfWrNkYzKifQ8UytbuX5Rj
         mwXM+vZGV3Ay8io2dGsByj90t/bA/sTa7xp7PcTNlBXyLQxFzThLHByyKQqHPr8Mu8Ar
         TkBRiKC9JOhS0o7ynM8vYkx0gGuglDUyaNDRBAnDH60yNTWX1mF/mnU1tUhc/0E+k/XI
         B67e+DP1W0fh5B+Eexf+JdjUJcMVM65m++Zl56YS4xzuSpQQTsldOl5jfn+LPp5H0SeI
         JgLw==
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hello everyone,

When duplicating tcp conntrack from main name space to another network
namespace, I see that sometimes timeout value for an established tcp
connection in another network namespace has been changed from 432000
to 300 like below, even it is in ASSURED

03:05:53.773
tcp      6 300 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:05:56.018
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:05:58.267
tcp      6 300 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:00.511
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:02.767
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:05.024
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:07.318
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:09.578
tcp      6 431999 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:11.833
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:14.082
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:16.315
tcp      6 299 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:25.314
tcp      6 431999 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:27.571
tcp      6 431999 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:29.815
tcp      6 431999 ESTABLISHED src=10.172.1.6 dst=11.35.4.5 sport=70752
dport=7050 src=11.35.4.5 dst=10.172.1.6 sport=7050 dport=70752
[ASSURED] mark=0 use=1
03:06:32.065

In nf_conntrack_proto_tcp.c, I see that 2 constants have 5 mins set

[TCP_CONNTRACK_RETRANS] = 5 MINS,
[TCP_CONNTRACK_UNACK] = 5 MINS,

and the code

if (ct->proto.tcp.retrans >= tn->tcp_max_retrans &&
       timeouts[new_state] > timeouts[TCP_CONNTRACK_RETRANS])
       timeout = timeouts[TCP_CONNTRACK_RETRANS];
else if ((ct->proto.tcp.seen[0].flags | ct->proto.tcp.seen[1].flags) &
       IP_CT_TCP_FLAG_DATA_UNACKNOWLEDGED &&
       timeouts[new_state] > timeouts[TCP_CONNTRACK_UNACK])
       timeout = timeouts[TCP_CONNTRACK_UNACK];
else
       timeout = timeouts[new_state];

but I am not sure this code cause the above issue. For the second
TCP_CONNTRACK_UNACK, it only happens for [UNREPLIED] instead of
[ASSURED]. Could you please let me know how the time out value can be
changed for an established tcp connection and how to prevent this
change?

Thanks,
Brs,
Naruto
