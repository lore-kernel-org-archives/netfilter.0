From: "A System Admin" <asysad@gmail.com>
Subject: Triple Duplicate Acks
Date: Thu, 19 Jun 2008 09:47:18 -0400
Message-ID: <89622f200806190647h4a4418d2o7cc584e01c389a6e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=oYrwEp5pEVoFrqCc6X3jEJmAC02x7bOOagK66Nen0ng=;
        b=bVqltb7TXax87l77g1qK0/rK2++Kihil+d0WxQgmiQBN2oghGDSnpXBOzoEeeH68Qx
         UaNXuoIDFs82T0uiKEu7bucXUqnuwfrGdYfO3m2bBDq9pioIZ4z3WopA0DwNZiZNgQD+
         kEakKLZb8woBnrPc1UE2yXamzZvdhcT6EfSZA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Netfilter list,

We are seeing a fair amount of Triple Duplicate Acks between a
webserver that is using the following nat table prerouting redirect
and an application server....

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -d <another hosts IP address>  -j REDIRECT
COMMIT

Here is our conntrack tcp parameters:

# for i in `ls /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp*` ; do
echo "$i" && cat $i ; done
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
0
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose
3
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_max_retrans
3
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close
10
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait
60
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
432000
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait
120
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack
30
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_max_retrans
300
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_syn_recv
60
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_syn_sent
120
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_time_wait
120
#

Is there anything that can be done from the conntrack perspective to
lessen/eliminate the Triple Duplicate Acks?
