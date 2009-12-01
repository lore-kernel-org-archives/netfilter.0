From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: netfilter queue
Date: Tue, 1 Dec 2009 09:45:19 +0530
Message-ID: <cfeab66d0911302015ib8f942v5389f834b23a01b6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=dHc3OqDXfcExo2idTDdAnp9NK5/A/T2CtdL2JeyUFJM=;
        b=WWgOhIDcF4aVkH6QZPJArEFVUa84nyZYymcNXa6fpG6cRpcUBEqMy45Vr+XtNrZXf6
         47cGv3lY0giiXjQKUZVyf7euXjQhaO+pn3ozVPHeeOTE4SaB8C+oVx0//XlRIRue+MnW
         y1S9SfJ7rUuf8xzzV/AJ4flK8EywPqdGqZac8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all ,

               xt_time module is not handling DST . So i am writing a
userspace application to handle time based pkt filtering by queuing
pkts to userspace using  NFQUEUE target .
There are some concerns and doubts

1 ) All packets will be copied to userspace , one pkt at a time ,
based on the iptables rule . But , if i use any system call in my user
space application before reinjecting the pkt back to kernel , will it
severely dampen the network throughput ?

2)  Creating /proc entries and passing DST values to kernel and Handle
Time by xt_time module will be a better solution ?

Thanks,
Ratheesh
