From: David Hagood <david.hagood@gmail.com>
Subject: How to interpret time stamps in xt_recent?
Date: Fri, 02 May 2014 06:21:14 -0500
Message-ID: <53637FAA.9060203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=WtjWprHMrQt7E8aLcjZCL8L1mAYRAipqPhPZU0chl4k=;
        b=bGunfk3i7OqY7j9DL60vJazhMC97AewUAYSsj4maBlJLiriD+wFwm8yPbF/f1YIftT
         twhUJz0ucRhq0qdQyrHop2G2LcRqKFQKizdyo/h1PP+CfIXITX9GHAeEY1z3Lpn3UDdb
         7v5jHIonknYOEnLBDPzNz3M65oN9zZ72774SpbAvJcjlx6JzWvsCszx71av0C8v4dPNr
         Rs1dNWsnMIo7nNL3yelN+MtbIbbVUfj1xu+khFa1h++zmOjsJLXUKUbKOV4dn6kqLWTg
         bxdwiLI6wWqi4jS5E4AEjQpoK+S6Y4r/2Lj1pHvT5J3Bl4ysx2fbuGHY+LHH5xE5S+VU
         NrvQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to use the xt_recent netfilter under Linux 3.11 to implement 
a more reactive firewall. I want to be able to review when the most 
recent packet in any blocklist came in, but I don't know how to convert 
the last_seen and oldest_pkt fields into anything meaningful.

What exactly are these values representing? How can I convert them to a 
wall-clock time?

