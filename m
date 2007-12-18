From: Mike Boyer <boyer@administrative.com>
Subject: make dep fails with NO_SHARED_LIBS=1 and make 3.81
Date: Tue, 18 Dec 2007 11:26:59 -0600 (CST)
Message-ID: <200712181726.lBIHQxV27029@triclops.administrative.com>
Reply-To: Mike Boyer <boyer@administrative.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-MD5: jVpAh7uXQSlqesI35K1u8Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

make dep fails when run with the NO_SHARED_LIBS=1 when using make 3.81

it produces the following error:

make: *** No rule to make target `extensions/libipt_ah.d', needed by `dep'.  
Stop.

using make 3.79.1 works fine.

This post is jus an FYI to anyone else encountering the same pitfall.

--Mike

