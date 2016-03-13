From: AllKind <AllKind@fastest.cc>
Subject: [announce] ipset_list 3.4 released
Date: Sun, 13 Mar 2016 07:25:41 +0100
Message-ID: <56E507E5.7040803@fastest.cc>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=4bQ8KuBY4iXnlu16IeXfvpnq7do=; b=j7Xc12x3dSOGTygkKk7zY
	eHuJ5agkS9owQZd9owpmySYhXfD+gwZziy+AHkwb2K8E6yuuoOmWYRrk35DxuUvn
	z3NeklstFxtDG7ycolL2CJ9X/zSuaWHsAU+Q3GJdj6N/rj5lhC6exyuZ69VUf2oX
	lzknE/5mH67leGv79AEk9M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:reply-to:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=4bQ8KuBY4iXnlu16IeXfvpnq7d
	o=; b=i2XV/TbCionhu2uh6yex/Pw9NjX558mlL+QlnKXg6DDioccaVBGtWknjgx
	lV4TYXXSkJ+6VpVIruFfwZwmRAzZLrniwMRSP0SJSTmVD0Sl6QZHs7dQ4R2En6WT
	MgGPl/UnjduKrfkPw59geKJJygQ+4h8Et7JBNGeUWhhCGQtkE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Good day everybody!

I've just pushed a new release of ipset_list.
New in version 3.4 is:

A new option (-T) was introduced, allowing to test for existence of 
elements. This option can be used multiple times over multiple ipset 
sets in one query.
An interactive wizard based mode has been added. It allows to select the 
options for the query interactively. Additionally the command line for 
the search can be composed (-G). In order to run the wizards, the dialog 
and whiptail programs are supported.
A man page has been included.
Script options can now be set from a configuration file.
One bug was fixed: usage output did not display some valid combinations.
Also some minor tweaks have been done.

Homepage:
https://sourceforge.net/projects/ipset-list/
https://github.com/AllKind/ipset_list

Changelog:
https://sourceforge.net/p/ipset-list/code/commit_browser
https://github.com/AllKind/ipset_list/commits/master

Download:
https://sourceforge.net/projects/ipset-list/files/latest/download
https://github.com/AllKind/ipset_list/archive/v3.4.tar.gz

Best regards,
AllKind
