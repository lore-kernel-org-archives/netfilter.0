From: jen140@gmail.com
Subject: Re: Port Forwarding
Date: Sun, 11 Oct 2009 14:56:49 +0100
Message-ID: <143238421.20091011145649@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:x-priority
         :message-id:to:cc:subject:mime-version:content-type
         :content-transfer-encoding;
        bh=w/A7dWYw4yBrg2v+kVhk+5nr5T1SfjD8rQuzQcBWp/s=;
        b=avhLq//LWfZxD3KKc1Ln7D8uR/uDM61Tv886IVeMYUfeAJaLl7/42bALsrD6eKMcNe
         p9fbr3h037VnD83mIWIq/Gf+5gcWTYyHfXRMqm5bJ2M+W4e/uUq0HLGHSJr5UM0GiyOO
         9cCwr79FIVntN5dOhRXuVVt+HEIUHLmE4wETs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Brian Austin - Standard Universal <brian@standarduniversal.com.au>

It is enabled.
jen140@server:~$ cat /proc/sys/net/ipv4/ip_forward
1
But still doesnt work =(.

