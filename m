From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnfnetlink 0.0.41 release
Date: Fri, 06 Mar 2009 17:59:50 +0100
Message-ID: <49B15686.4050508@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010908090305020401070304"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: netfilter-announce@lists.netfilter.org, netfilter-devel@vger.kernel.org, lwn@lwn.net

This is a multi-part message in MIME format.
--------------010908090305020401070304
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi!

The netfilter project proudly presents:

  * libnfnetlink-0.0.41

libnfnetlink is the low-level library for netfilter related
kernel/userspace communication. It provides a generic messaging
infrastructure for in-kernel netfilter subsystems (such as
nfnetlink_log, nfnetlink_queue, nfnetlink_conntrack) and their
respective users and/or management tools in userspace.

See ChangeLog (file attached) for more details on this release. You can
download it from:

http://www.netfilter.org/projects/libnfnetlink/downloads.html
ftp://ftp.netfilter.org/pub/libnfnetlink/

Regards,
Pablo

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers


--------------010908090305020401070304
Content-Type: text/plain;
 name="ChangeLog-libnfnetlink-0.0.41"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ChangeLog-libnfnetlink-0.0.41"

Pablo Neira Ayuso (2):
      nfnl: allow disabling and enabling sequence tracking
      nfnl: tag nfnl_talk() and nfnl_listen() as deprecated


--------------010908090305020401070304--
