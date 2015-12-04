From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Fri, 4 Dec 2015 08:18:01 -0800
Message-ID: <CAKmUPx7x2EP_O26K8UC4SKQqPC11uM2sNSpNPSV3=jbqq4GdyQ@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<CAEzD07JQmLe_SetqcEg-EetvD=Et=2Zy47V53nA37q75FBv_NA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=sYNoqPw4YvWoB2gZWF81gojUJZhvEUDXvZftlVqGZdc=;
        b=y/jwkFK3RCbTxX72hANY5MhSwGSIaw5/jM6jCpLL0HJMiZss6qy871g2Isl3txz4rr
         JLvvmxbYVzMo4pg+AzCJ9k8rBdexFVRH94/ib34kRpX2LKQzN19EG4c9jS4Y2Idi7mVW
         cEd7yGpVIs7KAu+u0uc2GtPpl2lpZU5GgvjnIcV/wx6IJ9VpzpTxaUaa4T97N+dU5LUq
         /dKPCGwE7VdhfVQoPr22N8kDyrEG3d6ehcB2SDUdYuey45qPclCWspJiI34xDQjr/Lsi
         AYNDK5OHvl+oh7HAWztc2Q2Mz+uTR5f2zq3FehKRMOIiHYYSFIOxs+TfqhoI/XIGkB3k
         B8Zg==
In-Reply-To: <CAEzD07JQmLe_SetqcEg-EetvD=Et=2Zy47V53nA37q75FBv_NA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Dec 4, 2015 at 3:55 AM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> Have you enabled the ip forward?

Yep, alas.  Connections from the host and the public IP work great.
It's just connections from the VM where the packet disappears.


I also should have mentioned that this is on Centos 7, and:

[root@ex ~]# cat /proc/version
Linux version 3.10.0-229.20.1.el7.x86_64
(builder@kbuilder.dev.centos.org) (gcc version 4.8.3 20140911 (Red Hat
4.8.3-9) (GCC) ) #1 SMP Tue Nov 3 19:10:07 UTC 2015

[root@ex ~]# iptables --version
iptables v1.4.21
