From: AllKind <AllKind@fastest.cc>
Subject: [announce] ipset_list 3.6 released
Date: Sat, 16 Apr 2016 09:09:17 +0200
Message-ID: <3b1524c1-1ac0-42b7-5692-d42120be9c07@fastest.cc>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=vVLGKEBrwGZaeeBQ8n59ppEVCaw=; b=dZUQOuxGZpk71gEuEmTc+
	sNmqD7JyfgIK9AFmLSegF3JC3/QyoLgwWkB07gjNeU7tfEuu2dq50OK5upWDtRjG
	bYwmvLhZDlpWHO6RISPaVd649kkrjg7nn91eIPa6u9nwh8np7WrOA6d5ok2PqA8i
	3gGLKGPv7NJ4QNlNZhfr6k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:reply-to:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=vVLGKEBrwGZaeeBQ8n59ppEVCa
	w=; b=TpE9TMbc7L90lqPCFSYiNB02Wj8ISHlPmr/AdkXsfpHe1DkmGMVrVPXzWN
	TWUNKBrW16x6sAyopOvAxZgHVAQdywIA8mgq3ekxMiQ0NxC9AXVjulGKb1rKnkAB
	H+px2sSe6UoBy+UR54hqGEvZy4OiKUeHt0703wFJVjQtI7NHw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Good day everybody!

I've just pushed a new release of ipset_list.
New in version 3.6 is:

The result of the query can now be saved or printed in ipset save,
or xml format, or as shell script.
An install and uninstall script have been added.
Various usability improvements were done.
Some bugs have been fixed.

Homepage:
https://sourceforge.net/projects/ipset-list/
https://github.com/AllKind/ipset_list

Changelog:
https://sourceforge.net/p/ipset-list/code/commit_browser
https://github.com/AllKind/ipset_list/commits/master

Download:
https://sourceforge.net/projects/ipset-list/files/latest/download
https://github.com/AllKind/ipset_list/archive/v3.6.tar.gz

Best regards,
AllKind
