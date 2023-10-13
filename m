Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6116DCDB474
	for <netfilter@archiver.kernel.org>; Fri, 13 Oct 2023 01:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjJMBi7 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 12 Oct 2023 21:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjJMBi6 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 12 Oct 2023 21:38:58 -0400
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 Oct 2023 18:38:56 PDT
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C52E5C9
        for <netfilter@vger.kernel.org>; Thu, 12 Oct 2023 18:38:56 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:43678)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S1722F6E> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Fri, 13 Oct 2023 03:30:52 +0200
To:     netfilter@vger.kernel.org
From:   "U.Mutlu" <um@mutluit.com>
Subject: [libipset] How to read packet counter of a single item?
Organization: mutluit.com
Message-ID: <65289DC7.9090603@mutluit.com>
Date:   Fri, 13 Oct 2023 03:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

1) Which libipset function can be used for getting
the packet counter value of a single entry in the set/list?

Using the function ipset_parse_line(ips, line) I can issue
most of the ipset functions, but I need also a method
for getting the packet counter for just a single item only,
ie. not the output of all items as "ipset save" does.
I need to do this in C/C++ (hence libipset in Linux), ie. not in script.


2) man ipset says
"test SETNAME TEST-ENTRY [ TEST-OPTIONS ]
    Test whether an entry is in a set or not. Exit status number is zero if 
the tested entry is in the set and nonzero if it is missing from the set."

But the TEST-OPTIONS are not further described or documented.
What test options are possible?

