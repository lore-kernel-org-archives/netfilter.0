From: Margel Mar <margelef2@gmail.com>
Subject: net.netfilter.nf_conntrack_tcp_timeout_time_wait value being ignored
Date: Tue, 23 Aug 2016 09:46:37 -0400
Message-ID: <CAAuMRCO2urbyyi9yLyusSL7vp0tyPiBK1mYA=EmxhfWd5+d=KQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=FI1wmip+OdP1bsIqRJ8JcrG0STvZeQI6wVGmKAdz7zI=;
        b=aJQChTKcC+k3rBjhhoDgrMctoCzq7BlQIM41e+9yik5YE5EA8rOdepsTi5ciJXRjCb
         WnWhzW/rZGnGFcobklPtmxZgt0lylkbjWrZYf5ySalZno71B65TYyUxfEqBlxj2TUyXl
         Ec+Te3tylA5sFrB0xHFAjWoa5TjEkzOd/ImvhxIkZaV53vLT5iCoe5v3lC7/ptiIx8D+
         wjPjBtZPol2AJ+l5jeY/ESJE06fv8YeVe3PplxV3cvLt/30QUGcZFx9tiVJiPwXWjVux
         2SD4KlgzIpiqEOW7AV/34NtMMledtGo+WBNhU7k2Z0A17+5v++m4djeynO63E0w1/xSU
         5rdQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Our server handles a lot of traffic - during peak usage, the traffic
is enough to overwhelm the ports with the default value of
net.netfilter.nf_conntrack_tcp_timeout_time_wait of 120.

We've had success decreasing the default value of time_wait from 120
seconds to 1. We've run the command (sudo sysctl -w
net.netfilter.nf_conntrack_tcp_timeout_time_wait=1) with empirically
verifiable success 5+ times over the past 6 months.

The server went down a few days ago due to what we were told was a
"cpu stall", and we had to reboot. We ran sudo apt-get upgrade to take
care of ~15 security updates. While poking around reading log files,
etc to try to figure out why we went down I ran some netstat commands
to check the status of our connections and noticed that the number of
tcp connections in time_wait suggested that despite sysctl -a showing
it to be set to 1, it behaves as though it is set to 120, the default
value.

Increasing and decreasing the setting no longer has any effect on the
number of connections in time_wait as it should. For example, if we do
100 pageviews per second, we would expect ~15000 connections in
time_wait (100 + ~30 asynch) * 120. If time_wait is decreased to 1, we
would see only 130. If we increase it to 240 we should see 30000. No
matter what value we set, it behaves as though it is set to the
default value.

The server was moved from Xen to KVM about 1 month ago, but I am
unsure as to whether the time_wait command worked as expected at that
time because our traffic is seasonal and the past month has had low
enough traffic that we wouldn't saturate our ports.

We've tried rolling back to the kernels that were in use the last time
we know the time_wait value of 1 was being properly utilized, but it
had no effect, so we believe that we can eliminate the specific kernel
as the cause of the problem.

We're looking at two possible causes of the issue:

1. The sudo apt-get upgrade run after recently going down. Conntrack
is in the logs as noted below. Is it possible that what looks like a
routine update is incompatible with KVM? Was a bug introduced in a
recent update that causes the time_wait value to be ignored?

2. The move to KVM - It's possible that this has been going on since
the move to KVM, but before trying to migrate the server and enduring
significant downtime, I thought it was worth running the issue by this
list to see if anyone has any ideas.

The logs for the only apt-get upgrade we've run since we know this was working:

Selecting previously unselected package libmnl0:amd64.^M
Preparing to unpack .../libmnl0_1.0.3-3ubuntu1_amd64.deb ...^M
Unpacking libmnl0:amd64 (1.0.3-3ubuntu1) ...^M
Selecting previously unselected package libnetfilter-conntrack3:amd64.^M
Preparing to unpack .../libnetfilter-conntrack3_1.0.4-1_amd64.deb ...^M
Unpacking libnetfilter-conntrack3:amd64 (1.0.4-1) ...^M
Selecting previously unselected package conntrack.^M
Preparing to unpack .../conntrack_1%3a1.4.1-1ubuntu1_amd64.deb ...^M
Unpacking conntrack (1:1.4.1-1ubuntu1) ...^M
Processing triggers for man-db (2.6.7.1-1ubuntu1) ...^M
Setting up libmnl0:amd64 (1.0.3-3ubuntu1) ...^M
Setting up libnetfilter-conntrack3:amd64 (1.0.4-1) ...^M
Setting up conntrack (1:1.4.1-1ubuntu1) ...^M
Processing triggers for libc-bin (2.19-0ubuntu6.9) ...^M

Thanks for your help!
