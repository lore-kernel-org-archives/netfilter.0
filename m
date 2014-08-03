From: AllKind <AllKind@fastest.cc>
Subject: [announce] iptables-bash_completion 1.2
Date: Sun, 03 Aug 2014 09:36:43 +0200
Message-ID: <53DDE68B.90008@fastest.cc>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=eVVm3k8L21
	8FWgjpPKbabvwSwmQ=; b=X2YPsFhCcGzFJpFsF4MExTmVedrv6/He1mYTJrBjpf
	rRIDRnjIWvw8+1n+KmiTkOts+jG7lJbMoCMPDdNII0UOL+fBvLpW7wd0XrvbszU5
	8NUNIGTrLxuiOKpm1aqFunm02nUtGlJQowdkHC92hSeoPCneJRKu8QU4iR+Jp/DK
	o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type:content-transfer-encoding;
	 s=smtpout; bh=eVVm3k8L218FWgjpPKbabvwSwmQ=; b=KxlsjvTmJAqisaSRA
	XDZALLKGZMF3Jth4mQw5MpnA5rfrVhsNzDyIplsFeToz1MXbzfSjCkIblJE5Y6ql
	cduZ+hIZGZVUYLJ8HuAt6fsLyyPBDujw89uAA0d8WwfklCoggDHRp0imqF+cB0pV
	Dc+jHMV8lS0uXxVMmd7+eSGB4o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello List!

I've written a feature rich bash completion code for iptables.
This new version fixes a few bugs and adds support for all changes since 
the last release of iptables (1.4.21).

A readme file is here:

https://github.com/AllKind/iptables-bash_completion/blob/master/README.md
or there:
https://sourceforge.net/p/ipt-bashcompl/code/ci/master/tree/README.md


It is available from:

http://sourceforge.net/projects/ipt-bashcompl/?source=navbar

mirror:
https://github.com/AllKind/iptables-bash_completion

Enjoy :)

AllKind
