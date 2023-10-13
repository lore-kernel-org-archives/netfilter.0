Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67716CDB482
	for <netfilter@archiver.kernel.org>; Fri, 13 Oct 2023 19:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbjJMTFe (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 13 Oct 2023 15:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbjJMTF3 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 13 Oct 2023 15:05:29 -0400
Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [IPv6:2001:738:5001::45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F461EE
        for <netfilter@vger.kernel.org>; Fri, 13 Oct 2023 12:05:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by smtp0.kfki.hu (Postfix) with ESMTP id BABDF6740106;
        Fri, 13 Oct 2023 21:05:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp0.kfki.hu
Received: from smtp0.kfki.hu ([127.0.0.1])
        by localhost (smtp0.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP; Fri, 13 Oct 2023 21:05:10 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (host-94-248-211-167.kabelnet.hu [94.248.211.167])
        (Authenticated sender: kadlecsik.jozsef@wigner.hu)
        by smtp0.kfki.hu (Postfix) with ESMTPSA id 4B0A167400ED;
        Fri, 13 Oct 2023 21:05:10 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
        id E984D2AB0; Fri, 13 Oct 2023 21:05:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by mentat.rmki.kfki.hu (Postfix) with ESMTP id E00672B92;
        Fri, 13 Oct 2023 21:05:09 +0200 (CEST)
Date:   Fri, 13 Oct 2023 21:05:09 +0200 (CEST)
From:   Jozsef Kadlecsik <kadlec@netfilter.org>
To:     "U.Mutlu" <um@mutluit.com>
cc:     netfilter@vger.kernel.org
Subject: Re: [libipset] How to read packet counter of a single item?
In-Reply-To: <65289DC7.9090603@mutluit.com>
Message-ID: <64f2f344-e83a-cbbe-b8e8-a81dfacbca98@netfilter.org>
References: <65289DC7.9090603@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-deepspam: ham 0%
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

On Fri, 13 Oct 2023, U.Mutlu wrote:

> 1) Which libipset function can be used for getting
> the packet counter value of a single entry in the set/list?
> 
> Using the function ipset_parse_line(ips, line) I can issue most of the 
> ipset functions, but I need also a method for getting the packet counter 
> for just a single item only, ie. not the output of all items as "ipset 
> save" does. I need to do this in C/C++ (hence libipset in Linux), ie. 
> not in script.

There is no such functionality in ipset. You can test the existence of an 
element in a set or list/save all of them with all of the attached 
attributes.

> 2) man ipset says
> "test SETNAME TEST-ENTRY [ TEST-OPTIONS ]
>    Test whether an entry is in a set or not. Exit status number is zero if the
> tested entry is in the set and nonzero if it is missing from the set."
> 
> But the TEST-OPTIONS are not further described or documented.
> What test options are possible?

There's a single one in the case of list:set: to test the element before 
or after a reference one.

Best regards,
Jozsef
-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
