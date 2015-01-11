From: David Hagood <david.hagood@gmail.com>
Subject: Usefulness of xt_recent's "last seen" and "oldest_pkt" on a tickless
 system
Date: Sat, 10 Jan 2015 19:27:21 -0600
Message-ID: <54B1D179.7000802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=RtzdNTpDcvokjmBai4hYFrN2X/QaGyZxe10RkDnujSI=;
        b=NTHlXwo10m0k/QQi3OZIYBdZX6/RH7ez7U14h1Wx5NebZ02Z3PyuyDlU8AKKQuYznB
         9GO0hfdLUbh7NYxdYQqop9uSVQIYBTUUcMuYDmT/LMFc2uLaNCXNfV6B0vLGHqRLdnKf
         M9iwpN1eUjVdFiWWVjhbO07df8T+J6sk5ulsAB5vlHBtQ7iI8PowzRlQ6PgQskZq2DDn
         RumXx2mR2oDfN8+Ar9VEo9Ygdl5y7IBGntL3CVJXWdK5XN2MQ5buZGfempd/J5r98Ik/
         5uAkYktUS89pD50IdCW9vc/2lfADlhn9NVzh+d9DH9Q0ZracVe17zovED6+glUuAYjsR
         dGLw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

First of all, this is about the third time I've asked about this subject 
on this mailing list, and I've never had anybody reply.
/taps microphone
Is this thing on?

I have been trying for several months to work out a way to parse the the 
output of "cat /proc/net/xt_recent/<name of rule>", and return 
meaningful numbers for the "last_seen" and "oldest_pkt" fields. As best 
as I can determine, these are just a count of the number of jiffies 
since boot. However, on a tickless kernel, there is really no well 
defined number of jiffies per second as far as I can tell - it's going 
to be a function of how often things need the system to wake up, and 
will vary from moment to moment based upon the workload of the system.

If this is so, then this calls into question the utility of reporting 
jiffies to the user - there's no way the user has to relate those values 
to anything meaningful. It also calls into question the whole idea that 
a recent rule can meaningfully specify a number of seconds for a packet 
to be tested, if all that is stored is a number of jiffies.

So, the first question I have is: is there any meaningful way a 
userspace tool can convert the values reported by /proc/net/xt_recent/* 
into a wall clock time?

The second question is: if the answer to the first question is no, then 
why report those values at all? The whole point of a procfile interface 
is to report data to userspace, but if there is no meaningful way to use 
that information, what good is it?

The third question is: wouldn't make more sense to capture the actual 
wall-clock time of a packet, and report that to user space in a 
meaningful way from the procfile interface? At least report time from 
epoch in seconds - something that can be manipulated in a meaningful way?

