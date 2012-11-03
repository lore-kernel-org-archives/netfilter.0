From: Thomas Perl <th.perl@gmail.com>
Subject: How to enable "bytes=" output in "conntrack -L" output
Date: Sat, 3 Nov 2012 12:48:48 +0100
Message-ID: <CA+uOhx6tc0EZO8atcN+=vN_Buv_mWbOwNF+RM4wnr3PpYp6vrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=77G3om5OivId8DPYDjMiP1FLq9yxTzFMnqgUk4BCaho=;
        b=FqmSJyzHSsVuSbWn04joI57d4+TOhzvstYHBClsr3WFoSWM2B+iU2wggdT60KKNGJ5
         1xmwEmBGoKmpDFMJuTf88m2Fm+HfSXj5kt83O2yYpW8D9YqRi5wg9wRDK+EDFJVYDDY6
         H/yT+wsE8AZ/O5VFCet2aQCj0fkD/ocPQoLp0wYNJcx4hejomedmfPPD3M5Zkbs5tlhY
         YXCFiHMQ255N/mAiCrng8ifqJQzgh8BS0IAg7k8i4ru7jV3uS0teA0os4ThjVm3j6JeW
         JvCUgh9pZBVezfCD9AE9mMzq8+9Xpb4+aWVVTWquJdS+uj0OHaZlQoaiM3PU4lRz52WA
         CJHA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Kamal Ahmed <kamal2222ahmed@yahoo.com>, =?ISO-8859-1?Q?Stefan_K=F6gl?= <stefan@skoegl.net>

Hi,

I've been using /proc/net/ip_conntrack two years ago to do some rough
measurements of IP traffic. As this feature seems to be gone in recent
kernels, I've looked into replacements and found "conntrack" from
conntrack-tools.

Looking at the manual, I can see that the "bytes=" output is there in
the examples:
http://conntrack-tools.netfilter.org/manual.html

However, on my machine when running "conntrack -L" (as root), I do get
output, but without the "bytes=" part:

tcp      6 ZZZZ ESTABLISHED src=X.X.X.X dst=Y.Y.Y.Y sport=XXX
dport=YYY src=X.X.X.X dst=Y.Y.Y.Y sport=XXX dport=YYY [ASSURED] mark=0
use=1

As you can see, there is no bytes= or packets= count in the output
(compared to the example of the conntrack-tools manual and old
/proc/net/ip_conntrack output).

The following kernel modules are loaded (as described in the manual):
nf_conntrack nf_conntrack_ipv4 nf_conntrack_netlink
I'm using a stock Ubuntu 12.10 kernel (3.5.0-17-generic). The version
of the "conntrack" package is 1:1.2.1-1ubuntu1 (also from the Ubuntu
12.10 repos).

What do I need to do/configure to get the bytes= and packets= count
output in "conntrack -L"?

Thanks,
Thomas
