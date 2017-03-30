From: Sun Paul <paulrbk@gmail.com>
Subject: NFT NAT rule did not take action on the incoming traffics.
Date: Thu, 30 Mar 2017 11:01:40 +0800
Message-ID: <CAFXGftKVb0Sv=r3yGQhV=u-Nj7JnsrUH=CdZw3Kw-g2oNP_Cfg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=K1diugKIpkuYLItb9jaFurLK1dR/fNUXIdEtR9dF6NY=;
        b=UzbO0LWFA+54r6BWpu5AT7W3xM6PURgrBPtqLpMqctW4v9umUr+DVyB0vBU3AdRz6Y
         hr/lxnnn+5Blyb2wfVoGypJgQ/LwuFWNLp78kGhD7hY6HiAjFEw15JWz4eW97AhbMe7V
         CBIxmQXTFRA4C+KuR3Yizw7Cqqr4k5l2OZuEm7aS30JIE581mjwNFFwM2RVxefLBMQPF
         KqXHWL9NS8dskvnQ3n57k8Jr/AYW84LndB7eCS3HMRMg+NXu32IGi5GDt7M34pe3dUNA
         I43ZU3KLeeX+uT5e0++ZBuYB7QCVIHBBCHQ+RfkUnXPxQLYiLMR+l02Fuyrt9UrBvJVw
         7F+w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

we are using NFT on CentOS7, and we have setup NAT rule inorder to
translate the destination address.

Below is our rule

# nft list table nat -a
table ip nat {
chain PRE {
type nat hook prerouting priority 0; policy accept;
sctp dport diameter ip saddr 192.168.0.13 ip daddr 192.168.0.25
counter packets 4 bytes 336 dnat 10.165.249.15 # handle 9
sctp dport diameter ip saddr 192.168.1.13 ip daddr 192.168.1.25
counter packets 0 bytes 0 dnat 10.165.250.15 # handle 10
}

chain POST {
type nat hook postrouting priority 0; policy accept;
sctp sport diameter oif exsctp1 snat 192.168.0.25 # handle 4
sctp sport diameter oif exsctp2 snat 192.168.1.25 # handle 5
}
}

we have traffics with source IP 192.168.1.13 to 192.168.1.25, however,
we did not see it is forwarded to 10.165.250.15.

Is there anyway to troubleshoot the reason?

- rbk
