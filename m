From: xiuming zhu <xmzhu@cs.utexas.edu>
Subject: ipset binding feature
Date: Tue, 7 May 2013 21:44:09 -0500
Message-ID: <CABoU=UoFp7MsiKSr2khWtdDS8v7z4DceJFa-axh9yJHNmTjj2g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
         :subject:from:to:content-type;
        bh=3s+ENyrNhFQGrCCLgyK1edCbpOMNMIspxTQIvfFZjEo=;
        b=BiuWmYKsdLR3VyfDFFHyxvW4QKrfUYJECibK+LLi2zdmoT1thAG/mjn+NIp0mgb6pY
         YtuGEBSFR92vqe9FLIPmvHoWnNUgYyhC9HUcHnlitom7iZ3K5On1Wf96bjDy1NQMTJHq
         jtbdQeQN5lLDwQO+8k3/ZglqPTPMOq+g2SnbZHEY8Ls6fVUQaVZm+xqd/nSHoC7eaGAC
         mkSm6zlFdZQl5v34uOkHVw6zWkLILIL32pE9XPEd3UyRXP+uOHmJaTAeoONmbVGCXRo5
         7mGJFJSK+EIe30NiLM8Z6/kPtlEEqAjPlKH/gAuwSx5nzE0YpUDZr6WW4dgsuGeh8MJH
         k8xg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

By reading ipset manual, after ipset 4.0, the binding feature is removed. I
wonder there is any other way to implement the examples listed in
http://people.netfilter.org/kadlec/ipset/features.html

Let's see an example:

# ipmap set storing the IP addresses of two machines
ipset -N servers ipmap --network 192.168.0.0/16
ipset -A servers 192.168.0.1
ipset -A servers 192.168.0.2
# portmap set storing the allowed ports for 192.168.0.2
ipset -N ports portmap --from 1 --to 1024
ipset -A ports 21
ipset -A ports 22
ipset -A ports 25
# Binding, which attaches ports to 192.168.0.2
ipset -B servers 192.168.0.2 -b ports

# iptables rule using the set match
...
iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT
iptables -A FORWARD -j DROP



thanks a lot
