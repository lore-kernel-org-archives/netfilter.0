From: Matt Rivet <mattr@penguinfoo.com>
Subject: xt_socket.c only PRE_ROUTING and LOCAL_IN hooks
Date: Tue, 28 Mar 2017 21:55:15 -0700
Message-ID: <CAPvR+tj50maiWLqnyvTVxuKT4b6Qn4VicrkTypVbhkHQw1_X9w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguinfoo-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=WhZryU9dB1M7pDpnKYdpHJq4bjYC/LvVJjW8QNGYS/w=;
        b=sfIsvTdGTWfu+B1NAZC1NESCVt8FjKckQFr63Q63jO7uFs2R3JTUluY6bNj6k7jPi+
         e8/2tw3MLvvn75n0A8HmBa0p2A7RNZlzqGbUVVMrIaPyRxhlJ1g7Sle6eoTTXaK7azLo
         92+rlX5v0h9mPIMRwn1f4PIOqJLj6/5v1Y1NfN5IXRJsjPF+i6UR60h+MmlZBiwfEFeX
         aIN/7IQ0QN24y2cktCqEWZFDsAIXDXNDZNBYosbAdAaWVIrPKP44cfZmTKfIOXPiTvd3
         WzDALvnRR4ixlZ8+655GYTqSWg9mTOWxhJfiNZ0uEOrv4/QRaqjmajbrB9QKZVdgYqZC
         0mwg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Is it a safety concern for not allowing socket to register in OUTPUT
and POSTROUTING hooks?

I have modified the socket match module to allow OUTPUT and
POSTROUTING rules, but wonder if there is a reason for explicitly
registering these hooks.

net/netfilter/xt_socket.c
static struct xt_match socket_mt_reg[] __read_mostly = {
...
...
  .name  = "socket",
...
...
  .hooks  = (1 << NF_INET_PRE_ROUTING) |
                  (1 << NF_INET_LOCAL_IN),
           ---> add OUTPUT OR POSTROUTING or remove .hooks
},


My goal is to read the SO_MARK on tx.
example:

iptables -I OUTPUT -m socket --restore-mark -j SET-DSCP
iptables -I SET_DSCP -t mangle -m mark 5 -j DSCP --set-dscp 5

instead of going through all the work of restoring the mark, I added a
match option to socket.

example.
iptables -I OUTPUT -m socket --match-skmark 5 -j DSCP --set-dscp 5

If there isn't a reason for not using socket on tx, does the team have
interest in me submit a patch for --match-skmark?
