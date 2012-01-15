From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.11 released
Date: Sun, 15 Jan 2012 17:16:51 +0000
Message-ID: <4F130A03.7080208@googlemail.com>
References: <alpine.DEB.2.00.1201141542490.26282@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=5CIr+TsPENLYootLrm9XkgzqsxbLMohwyHezm4aOA58=;
        b=sgngWvB4d6rVJJ1bgYttfFTMRULeZYW3VVr7PQP5R6XCz5WhepxRxBUO8gwGPBbPU3
         hgpTIjr96iO3mFvv690UR5eGY1OwbFm1PKXrtU2HxN+mJjaQSvuSX4C6UlNJ5NPw5f2E
         mx0ew0UmD4mCh8fwbXn5zXsyYKqdfmxKFlmLo=
In-Reply-To: <alpine.DEB.2.00.1201141542490.26282@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> Kernel part changes:
>  - hash:net,iface timeout bug fixed
>  - Exceptions support added to hash:*net* types
>   
Any chance of fixing this bug soon:

~# ipset n test hash:net family inet timeout 0
~# ipset a test 10.1.0.0/16
~# ipset t test 10.1.12.12
10.1.12.12 is in set test.
~# ipset t test 10.1.12.0/24
10.1.12.0/24 is NOT in test.

