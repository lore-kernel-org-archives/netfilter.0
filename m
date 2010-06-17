From: beluc.mailing@free.fr
Subject: problem getting uid in nfqueue
Date: Thu, 17 Jun 2010 15:37:57 +0200 (CEST)
Message-ID: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
i finaly managed to get packet from NFQUEUE to some userspace program using
perl IPTables::IPv4::IPQueue.
my problem is that uid/gid is not present in what i receive in perl.
is it normal or i did something wrong?

(what i want to do is some advanced firewalling based on user id)
