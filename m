From: Yun Lin <overcloud@gmail.com>
Subject: nf_conntrack entry lost after using ipq_set_verdict() with NF_ACCEPT
Date: Sun, 29 Mar 2009 18:08:45 +0200
Message-ID: <49CF9D0D.6070108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=j0YhysilgKIN8SePZgtQuhk+FAzWodY3WjAROiqdb84=;
        b=Ruhsf/nY2ErW77h4BWKq7+96BjhMrSF+x0lt0xElg1fr/oTm0pIuVlA+IIoCTiQqkB
         7ScJ22QEJJ/NMvCLNQjvbcL7freydzHy3ygt2qS6WQWB1QYAMnZolxma8y380O0+KAv/
         enWqpLuvlfyeoGTtexI272Rirn/H+J4Zw4u+Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am going to conntrack and NAT for a udp traffic with destination port
4.
in the conntrack helper() i did so:

if (ct->status & IPS_NAT_MASK){
    printk("going to ALG part after NAT\n");
    ret = NF_QUEUE;
    }

The first query (with dport 4) packet after MASQUERADE goes into the
application layer gateway with NF_QUEUE into userspace, where the
payload can be further changed.
Then i use ipq_set_verdict() with verdict NF_ACCEPT to forward it. But
when the response in the other direction comes, it cannot be recognized
as the reply of the query.
I think the entry of nf_conntrack of the first query packet has been
lost, because when i just use MASQUERADE without userspace processing,
the response will be marked correct as IP_CT_IS_REPLY.

I have printed out the conntrack tuple when the helper()is called,
for the Query,
ctinfo = IP_CT_NEW;
the original tuple is:
10.21.22.21:4 -> 10.23.24.24:4 l3num:2 protonum:17
the reply tuple:
10.23.24.24:4 -> 10.22.23.22:4 l3num:2 protonum:17
10.21.22.21 is the ip address of querying node, 10.22.23.22 is the NAT
and 10.23.24.24 is the responding node.

As for the Response:
ctinfo = IP_CT_NEW(which should be IP_CT_IS_REPLY)
original tuple:
10.23.24.24:4 -> 10.22.23.22:4 l3num:2 protonum:17
reply tuple:
10.22.23.22:4 -> 10.23.24.24:4 l3num:2 protonum:17

Is there someone could help me figure this out??

best regards!!
