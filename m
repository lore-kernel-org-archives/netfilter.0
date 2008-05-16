From: "Payam Chychi" <pchychi@gmail.com>
Subject: iptables limit issue
Date: Thu, 15 May 2008 17:08:23 -0700
Message-ID: <f08c15d10805151708w6f72e8a0sad96e7a67a62578b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=yzPBlVbM/UB/sBCtLiN2jGetjAhL+H68imMTJby673c=;
        b=NjdIbBfv3t1YrwnFWiRH87ut95WlM1Ai13P1rUCex0z4GhDca4llh5Z/cQONvZ9qlCUL+nYGzC9XNichhc0NaxAN9s5OpV1ut3zIXH2ri/pfrrgrqa5kG73RBpF1OsxzSjyubxtAqCu3D38xIZsrCmePBvNLbE89ML5Qgpn/q1c=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I am running a bridged mode firewall with eth0 == external and eth1==
internal. I am trying to limit the traffic per packet per second
coming in through eth0 to rate limit down before it hits my eth1
interface. The issue is that I cannot get more than 1000 packets/sec.
I was wondering if anyone has come across this issue and if so, any
solutions?
when using the limit feature the maximum rate i can set is 10,000/sec,
however this only allows roughly around 1100 pkts/sec to pass through
the interface.
I've spent some time looking at the kernel xt_limit.c and playing with
" #define MAX_CPJ (0xFFFFFFFF / (HZ*60*60*24)) ".

thanks in advance,
Payam
