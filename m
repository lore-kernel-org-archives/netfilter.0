From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 08 Jun 2011 02:17:00 +0100
Message-ID: <4DEECD8C.6050302@googlemail.com>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=nPivRlXLrnzJxHZ92iSGZAanugy8C9pnrFje9pH7ZQ8=;
        b=GM7Ppgl9CbX29eDCVElgHLNg/S/fkL64S0Us3JVchitLwGTXT4UJpVjDwQdq1d3dmj
         iTNWI7ykn1yZqh2AJAtn3JHdvwOx4aI1gmrxEBtYfXGpwtRut5I7vCBYXk+TwctSGbq/
         sVfXr92B6Ej0Ky8nh4BrD2fWy75f7bWLv6ejo=
In-Reply-To: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

[root@test1 ~]# ipset n test hash:net family inet timeout 0
[root@test1 ~]# ipset a test 10.16.0.0-10.16.255.255
[root@test1 ~]# ipset l test
Name: test
Type: hash:net
Header: family inet hashsize 1024 maxelem 65536 timeout 0 
Size in memory: 16832
References: 0
Members:
10.16.0.0/16 timeout 0
[root@test1 ~]# ipset t test 10.16.224.0/24
10.16.224.0/24 is NOT in set test.
[root@test1 ~]# ipset t test 10.16.224.1   
10.16.224.1 is in set test.

That is plainly wrong!
