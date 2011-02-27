From: Pandu Poluan <pandu@poluan.info>
Subject: --set-dscp value?
Date: Sun, 27 Feb 2011 23:20:06 +0700
Message-ID: <AANLkTikjDsZn+G+W3KZj7S3vFAmWtCFGjf1=TExhB8a3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello all.

I am planning to do routing based on DSCP Local Use values.

Now, I've put in the values in rt_dsfield e.g.:

...
0x3c  LU03
0x4c  LU04
...

However, when I use --set-dscp 0x4c, iptables complained that 'the
value is greater than 64' (or something to that effect).

Based on analysis of values in rt_dsfield, it seems iproute2 includes
the ECN bits as LSBs '00' in its DSCP value definition.

Will I be okay if I just do a '>> 2' to refer to the similar LUxx in
iptables --set-dscp?

Thanks.

Rgds,


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
