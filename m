From: Zheng konia <konianet@gmail.com>
Subject: About nftable nat rule
Date: Wed, 24 May 2017 16:40:13 +0800
Message-ID: <CAG1z+7_ngCZQcT7WSU+pzCeb2S8DS4kHe6+Z1+R0+ccPs6dWJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=z+ywQMY5k8xnJK7dJ+vyw+rQqoq1mGLmTu4S0uolVco=;
        b=ekgD2gXrudefe4EieprM3m+TL3fP5E3NO3ZWbZDjqnJLivtznOGbdZOYYvb0Ci2uYS
         XZhUbKnZ3Q8yg/ttihxZcNc6NjNwysGxVRDAWs8BTQz7cncSWfBKzg7PKZUrIHOeN/pZ
         AeLJIOWYT3YZepbGoka6otleXdhObtU6QbBT+xHBJwBmVg3iK/no26CcGhGt0ACH19dI
         3xzuOvhvScsX99X5AfXP+1KdCT4/fS0imU7IiQ4ihtyJWA0I8QsK+SzXsDR8gsT1mIH5
         pBZmqGjjvY5VXvFyxHSI7VlmG27kM28d211OXym+TnsEnaQ/8r7LPK8lMP4hMq2TY/Ct
         i1iQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

   I am tranferring Iptables-nat to nftables-nat for testing the nat
forwarding efficiency. However, I have some doubles, hope you can help
me.


  nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100:4040
  nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100:4050
  nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100:4060
  nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100:4070
  ...

  How can I put these rules in one to get load balacne? I have tried
bellow, not work.

 nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100 :
{4040, 4050, 4060, 4070}  persistent

 or using jhash


 nft add rule nat prerouting tcp dport 80  dnat  192.168.1.100 :
jhash ip saddr . tcp dport mod 4 map {0 : 4040, 1 : 4050, 2 : 4060, 3
: 4070}


 Can you show me how to do that? Thanks.



Konia Zheng
2017.05.24
