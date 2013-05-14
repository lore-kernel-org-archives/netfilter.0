From: Alex Flex <aflexzor@gmail.com>
Subject: syncookies load testing
Date: Mon, 13 May 2013 19:15:38 -0600
Message-ID: <5191903A.20708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=b1wmgHuhO8jAOG1NtqGbg6Nn/JQlLc5wPZ2C4QXf5eo=;
        b=dZK+QgmqVRx8EBAGAzWKPlfazgoM1Fd8DctGP5TDqqHh1ffwHtAWKTMTlW/B9j661M
         e8+Ot+ie0tAF0BRjDlxPOGvSfY8kMYhPkYt1NrGVgRr4jwhp71feOD1xHTbXPspihs9e
         okDn3UF51v2+qmjwgBNFsTWtldlCaaSj41nmsm0KXt2MZx4JnB1+XTZIROqVeQpO/ITD
         PjpJW9Gsb0dWAvIvZx8q7r3x0Pz7aGl8IK2OCMY84WyggzXP3Xnkp6Gt7R4sG3RYfu/h
         Lo/324Mev1kBMCUXzcc9oULVjmqZHplvZxwgbtOW6CWWi4JrM4LjrqbKuhEf5ZamaI0D
         CSOg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Netfilter,

As some of you may know iam doing some work with syn cookies in my LAN.. 
Id like to understand the process better which is why i have a few 
questions:

Assume the system has conntrack off.

a.) I noticed that while creating a synflood with syn cookies enabled 
VRS syn cookies disabled the output of netstat remains exactly the same 
(even on different hardware architecture) ... :

[root@cl-t055-211cl ~]# netstat -nat | awk '{print $6}' | sort | uniq -c 
| sort -n
[...]
     256 SYN_RECV

Could anybody explain to me why this is so?

b.) From my understanding the syn back log is the memory of half open 
connections, could anybody tell me what effect this has on syn cookies? 
and if there is anyway to monitor its usage?

Thanks
Alex

