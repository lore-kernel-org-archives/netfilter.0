From: Alex Flex <aflexzor@gmail.com>
Subject: Question about behaviour of rule in a syn attack.
Date: Fri, 12 Apr 2013 17:05:30 -0600
Message-ID: <5168933A.30409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=UI6azi+aAzw0TKKB+tKqHKJjQ8vPUZgnhv37gycCN4c=;
        b=Db6S0HWsUPgVvEHK59bl2wIDKQFTpRhTrAKPmeLru5WNBAb7e/NSERSpv5sAE3f0w7
         UJtLSiaGt/YJQaIWtuEg1g9IjjperqWI2Y9BNQmyW2CWxfYN3fNIECOnEI94PAPEvaem
         0n1WBQnhp1EgH8qqOBHfP0Ba2tKFHvYOGGAdY222xSu42Qlfo5VRbse9EQMz5CziQKbl
         Dt12D8D/cq1anpDEKk0rp7pQtBPgQj0Ny7f4aeMhAns7JlPHDpM4//Ru7nP+zlTX/J3C
         +mdJP5OykciFYxq/mvwE+13v3dqGHTzOOCYC6GF6aOf0N5NtVd2SbdDgfN79oW+XIqAq
         xr6w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Greetings !

Id be thankful if somebody can shed some light here:

If Iam getting a syn attack, and I have syn cookies enabled via sysctl 
would any of these two rules match  those connections?


iptables -A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 
10 --connlimit-mask 32 -j DROP
iptables -A INPUT -p tcp --syn --dport 80 -m hashlimit  
--hashlimit-above 25/second --hashlimit-srcmask 32 --hashlimit-name 
IP_LIMIT_REQ  -j DROP

Or do these only apply to connections that have undergone the handshake?

Thanks
Alex
