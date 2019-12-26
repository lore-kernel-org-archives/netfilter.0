From: Tom Yan <tom.ty89@gmail.com>
Subject: Weird/High CPU usage caused by LOG target
Date: Thu, 26 Dec 2019 11:05:33 +0800
Message-ID: <CAGnHSEkvf0zieVJtPyneZ6PfnzeANmfFxTb=0JpgVb1FXVk0-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=j6vQieOj30ZsdktwZCgehiukeP99fsS6BnJ4QLRdT5s=;
        b=lmFcDDBZT9QZOp9sA93YVsAjP6ByKbEMqKSJ1AUQPtt2nJe9tLfM1ynFAmF/bxUiaa
         7N9iu1y4BuNAeq3dzCYlwhCqQEs7g+7Nx15yf3OiYHcjUcUkDxoeiR4AAqCQ0dFrhwm4
         5eWDLliiysD44hWtiPLHL2nH59LtB5EuJBtqEENRWWW74SemaGzRTf6cjPJMTT56LQWB
         epFxnWtFDTn+VhnNgnA66GwIevr0by9LcSHqhz7OdghWfqTW+OUXHSb6IYd1uiIRUyHR
         m8BBwjzTfMRfuqaNhG9Wn+CxMStsn/sfcloHZJ6yqGT8J0ajKUqKbcfP9MRezkryjoas
         kt9A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org

Hi all,

So I was trying to log all traffics in the FORWARD chain with the LOG
target in iptables (while I say all, it's just some VPN server/client
that is used by only me, and the tests were just opening some
website).

I notice that the logging causes high CPU usage (so it goes up only
when there are traffics). In (h)top, the usage shows up as openvpn's
if the forwarding involves their tuns. Say I am forwarding from one
tun to another, each of the openvpn instance will max out one core on
my raspberry pi 3 b+. (And that actually slows the whole system down,
like ssh/bash responsiveness, and stalls the traffic flow.) If I do
not log, or log with the NFLOG target instead, their CPU usage will be
less than 1%.

Interestingly, the problem seems to be way less obvious if I am using
it on higher end devices (like my Haswell PC, or even a raspberry pi
4). There are still "spikes" as well, but it won't make me "notice"
the problem, at least not when I am just doing some trivial web
browsing.

Let me know how I can further help debugging, if any of you are
interested in fixing this.

Regards,
Tom
