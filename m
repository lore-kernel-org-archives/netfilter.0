From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: two default routes
Date: Mon, 22 Mar 2010 16:05:24 +0530
Message-ID: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=x1lWDwmee9rzL0VLspbrrjsiBa1a6t4AEQEmMZ9b1N8=;
        b=EY94MajztIkC7IRwwGCdrDb1upG3O7L8JJZLQRdjFJ0yvC+mu8JooTuHE7QiWrZsg7
         MwqrQu7MCJDp4mFSZXSN4wJxzeRaGdKBjdOIY7hvgxsU+sHGSvoDwKVV0S+oKADvLNpz
         ye2XwrmYyRnnorQKOf5J7AqfKdkzKjDtTMBw0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ,

 i have two default routes  , I used below two commands to add routes .

 route add default gw 192.168.1.1  dev eth0 metric 0
 route add default gw 10.232.18.5  dev eth1 metric 1

So  10.232.18.5 will become the default route since it is added
secondly . All packets are routed to this address . Suppose
10.232.18.5 machine is down  , will the packets will use the next
default route ? . Could you please mention any case in which packets
will use the route 192.168.1.1 .?

Thanks,
Ratheesh
