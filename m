From: Supratik Goswami <supratiksekhar@gmail.com>
Subject: Unable to use connbytes
Date: Tue, 5 Apr 2011 19:18:36 +0530
Message-ID: <BANLkTikOa2JciJ6Lhuh721Oo0qdY50tFKg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=IDpBxj08JF7PYFF9iqif8o4x0AbSASHbxv6L8BGHFJo=;
        b=oMSEyGiG+f3HqcuHfVyFy40CxD+XbL82xAmOxPOPPYtVQEpMRIsvMp9wR+iHZllsLH
         40l1XcLy+Qlsj9LuvWP6WtG7mvUlZIHpU42n2YTy6bbGZlqOzT8eQsSNS3Ftx+gCv+to
         YGBecboorDiXpIXW3YpYDmOO4FYgYuRlXV254=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello

I am using CentOS 5.5, kernel version: kernel-2.6.18-194.3.1.el5,
iptables-1.3.5-5.3.el5_4.1.

I checked the connbyes support in my Kernel and it shows the following output.

[root@gateway bin]# lsmod |grep connbytes
xt_connbytes            6465  0
x_tables               17349  11
xt_connbytes,xt_MARK,xt_multiport,xt_CLASSIFY,xt_length,xt_state,ipt_REDIRECT,ipt_TOS,xt_tcpudp,iptable_nat,ip_tables


When I am trying to use it with iptables I am getting the following error:

iptables v1.3.5: Couldn't load match
`connbytes':/lib/iptables/libipt_connbytes.so: cannot open shared
object file: No such file or directory


Can you please tell me what I am missing here ?

--
Warm Regards

Supratik
