From: Alessandro Vesely <vesely@tana.it>
Subject: How do I test a libnetfilter_queue program?
Date: Wed, 13 Jan 2010 18:25:35 +0100
Message-ID: <4B4E020F.50405@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all!

I'm writing a program to block packets using libnetfilter_queue. How 
can I run specific tests, or a test suite to be run on "make check"?

I think I'll have to hack libnetfilter_queue.c so as to read/write to 
files rather than nfnetlink. Has someone already done something like 
that? Is there a better way to do the same?

TIA for any suggestion/caveat you'll post

