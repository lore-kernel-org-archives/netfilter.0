From: Subhadeep Ghosh <subhadeep.ghosh@uniken.com>
Subject: Reg: Replacing sk_buff in a NetFilter hook
Date: Fri, 16 Apr 2010 16:07:01 +0530
Message-ID: <j2j3a8740fd1004160337o83306b13g4d22c71d6b784ee0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello People,

I have written a hook for the NetFilter bridge and it works absolutely
fine. However, now some of the requirements for the hook have changed
and now I wish to perform the following operations,

1. Create a new sk_buff.
2. Copy the contents of the sk_buff, which NetFilter had passed, to
the newly created sk_buff.
3. Either mark the original sk_buff as NF_STOLEN or NF_DROP.
4. Replace the newly created sk_buff with the original sk_buff in the
NetFilter queue.

The first and the second steps are no-brainers. However, I don't know
if I need to drop the original packet or mark it as stolen. And I
definitely don't know how to resolve the fourth point. It would be
great if anyone could point me in the right direction.

Thank you and regards,
Subhadeep Ghosh.
