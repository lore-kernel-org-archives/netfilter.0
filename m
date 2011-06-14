From: Ivan Matala <ivanmatala@gmail.com>
Subject: iptables blocking all ports except port 80
Date: Tue, 14 Jun 2011 07:41:35 -0700
Message-ID: <BANLkTimH9xLROcOosO+Qa5-hhOGYyG8pjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=n6fkRpL1fkkF2GeBQoPCFqHrcSlozPNDyLfWRL0dCXI=;
        b=T0voLq8a5FjGq3FuwssyFD+hDZBBmpOijA8r6XuWTqULhh3vW/KNCGuyKV6UkbYEJg
         XYJEeYbXmt2XwC0Yt3WWnG9Rriy/MW/bFDJdxPPsYk26Kca4KvHWqqZR+yAKk4s2hcuu
         nTxZMQuVw+JbH9RFCSLmh2DXgKW9XDB3LD7zk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have iptables in centos 5.5.

How can i only allow port 80 in my vps.. Because i have squid in
remote server and my vps connects to port 3128 there. but when i do
torrent, it works,, how can i disable it? Please give me steps in
iptables routing thanks.

In short, what rules to add to block other ports except, ssh and port 80, 3128.
Thanks very much.
