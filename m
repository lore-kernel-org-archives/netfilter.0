From: "Marco Barbero" <marco.barbero@gmail.com>
Subject: conntrackd [ERROR] commit: Invalid argument
Date: Mon, 9 Jun 2008 15:21:20 +0200
Message-ID: <e1aa27e00806090621r3fa83ac0s7bb89d903de3be41@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=EE3d2AVnUp3sc2aJRCwFdMKEdW/lRFC/zA206/OP7jg=;
        b=SMjgBKqQhgMupbnUzmiZDxuYF9BDW41x2lqEDyZtjNyPSZX6Z662CVHIP6ajGm+9JP
         nnHjPA1E9UQYCkBwt0w+xY2/mW8ZF2TRfqPmdoYmRcF8NiQET/MGIiN2eKhZAWT2v2on
         Hp/Dn4s/rXWszIIDs0hjsPMOUbdkzqL4+uaK8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi list

Short story:

My scenario:

conntrack-tools-0.9.7
libnetfilter_conntrack-0.0.94
libnfnetlink-0.0.38

kernel 2.6.25.5
Mode ALARM


conntrackd -c from node master:

looking logs:

a lot of  [ERROR] commit: Invalid argument
Mon Jun  9 15:01:26 2008        tcp      6 180 TIME_WAIT
src=192.168.200.14 dst=62.149.195.137 sport=47144 dport=80 src=x.x.x.x
dst=192.168.200.14 sport=80 dport=47144 [ASSURED] mark=0


and at the end:

[Mon Jun  9 15:01:26 2008] (pid=13176) [notice] Committed 1172 new entries
[Mon Jun  9 15:01:26 2008] (pid=13176) [notice] 3294 entries can't be committed

Any hints?


Long story is:

I have a similar scenario on backend cluster firewall
using
conntrack-tools-0.9.6
libnfnetlink-0.0.33
libnetfilter_conntrack-0.0.89

kernel 2.6.24.3
Mode ALARM

All is working great and I don't get any 'entries can't be committed'

Same packages on frontend firewall I got:
'entries can't be committed' and often a kernel panic (related to nfnetlink)

Upgrading to
conntrack-tools-0.9.7
libnetfilter_conntrack-0.0.94
libnfnetlink-0.0.38
kernel 2.6.25.5
Mode ALARM

solved kernel panic issues but still I got 'entries can't be committed'
[ERROR] commit: Invalid argument

Pablo, have you any idea?

Thanks in advance
