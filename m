From: Imran Geriskovan <imran.geriskovan@gmail.com>
Subject: Iptables-nftables transition: DNAT on Output
Date: Sat, 30 Jul 2016 15:07:37 +0300
Message-ID: <CAK5rZE4HykuUgQ+brqU+nH-TUEwVFS+y8XxcVyPx3mBGegb7jg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=TQAFE21j8Ttwo4uk2uQE+5RlhXBgn+deNnfnkCtZlrA=;
        b=hPbnT/ZdmSHB3KzLzVDaW5NzJwRR2IEaEf6RGu+cI1cBJQTS6hsZAYUHjYmKjgMRKS
         AsGoQeu3t0qGAk383M5Wzs9IqxAuXZaF0RoDBR982tYvXRBTQVo0SD6moYrEvn8jSYst
         D4RePfPXgASiITwCa+6yKcTNdZyzitlrF6NwyVyuGI5LC6f3ivDoOeQa5ZuHAedBNtKd
         RzMWtohvzShXNb2B9ZxD4asliIuUmaPMB190E9IRUuvMPMSVBAADieYmhemTQBRjN2rQ
         ECxfRwtgRmxFAyyq92agFu1sxagz8OqKaxOfoReoPT36asP2fW0RaKxI/j2LHJiuLGiC
         hMhA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi... To control my outgoing traffic, I've redirected it to a local
proxy like this:

iptables -t nat -A OUTPUT -p tcp --dport XX -m owner --uid-owner imran
-j DNAT --to 127.0.0.1:YY

What's its equivalent on nftables?

As I explore my options, I've tried the following
without success. Is DNAT on Output unsupported on nftables?

I'm on Kernel 4.6.4. Looking at Arch Linux default kernel config,
I see everything is included for netfilter/nftables/iptables, etc..

Thanks for your comments...

chain out {
   type filter hook output priority 0; policy drop;
   meta skuid imran tcp dport XX counter dnat 127.0.0.1:YY  # jump natout
}
# Gives error with DNAT
# If I change DNAT with JUMP, error is gone. But it doesn't do anything.

chain natout {
  tcp dport XX counter dnat 127.0.0.1:YY  # counts nothing!
  counter  # counts same as the counter at out
}
