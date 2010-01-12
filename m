From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: NF_QUEUE and NF_ACCEPT
Date: Tue, 12 Jan 2010 15:17:39 +0530
Message-ID: <cfeab66d1001120147y2771412m4a1ebb8fea63eb76@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=X/cBf0epBuqzlA6E+ho4vSFCp+dnI/c915r8anHA3r8=;
        b=CVlOTEhBml1VkN822i2viASNzS/GWWOAonG/Qyu5P6lpp3F7yD9M2enwsilKvZ856r
         u3JHH8tKuqQ2r7TdXQeYwmhZXsKR7DO95Repfz0UtgbLgqhSsA1Msh62GBB9dflM+Nks
         5YWLlgCGGrOBia2rJpcpU41bywMgtWjC9FW0g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

R1  -    iptables -A INPUT -j NFQUEUE
R2  -    iptables  -A INPUT -p tcp -j DROP .

 Using R1 ,  queue pkt to user space .  If we  set verdict of the
packet as NF_ACCEPT from user space , the packet wont execute R2 .

 But , the funny thing is , if we wont set any verdict  . i can see R2
is getting executed .

 My question is : - > the packet that executes R2 is same packet , tat
is copied to userspace .?????



Thanks,
Ratheesh
