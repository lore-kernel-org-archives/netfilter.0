Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF71CDB465
	for <netfilter@archiver.kernel.org>; Sat, 14 Oct 2023 14:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbjJNOYe (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sat, 14 Oct 2023 10:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjJNOYd (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sat, 14 Oct 2023 10:24:33 -0400
Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [IPv6:2001:738:5001::45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DCACA
        for <netfilter@vger.kernel.org>; Sat, 14 Oct 2023 07:24:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by smtp0.kfki.hu (Postfix) with ESMTP id BF05B67400EA;
        Sat, 14 Oct 2023 16:24:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp0.kfki.hu
Received: from smtp0.kfki.hu ([127.0.0.1])
        by localhost (smtp0.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP; Sat, 14 Oct 2023 16:24:24 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (host-94-248-211-167.kabelnet.hu [94.248.211.167])
        (Authenticated sender: kadlecsik.jozsef@wigner.hu)
        by smtp0.kfki.hu (Postfix) with ESMTPSA id 5B3A267400D5;
        Sat, 14 Oct 2023 16:24:24 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
        id 0262D27F6; Sat, 14 Oct 2023 16:24:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by mentat.rmki.kfki.hu (Postfix) with ESMTP id 003272B96;
        Sat, 14 Oct 2023 16:24:23 +0200 (CEST)
Date:   Sat, 14 Oct 2023 16:24:23 +0200 (CEST)
From:   Jozsef Kadlecsik <kadlec@netfilter.org>
To:     "U.Mutlu" <um@mutluit.com>
cc:     netfilter@vger.kernel.org
Subject: Re: [libipset] How to read packet counter of a single item?
In-Reply-To: <652A6F4C.2040200@mutluit.com>
Message-ID: <f9cc1e2-b5de-dc80-a874-21c7f42dca28@netfilter.org>
References: <65289DC7.9090603@mutluit.com> <64f2f344-e83a-cbbe-b8e8-a81dfacbca98@netfilter.org> <652A6F4C.2040200@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-deepspam: ham 0%
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Sat, 14 Oct 2023, U.Mutlu wrote:

> Jozsef Kadlecsik wrote on 10/13/23 21:05:
> > On Fri, 13 Oct 2023, U.Mutlu wrote:
> > 
> > > 1) Which libipset function can be used for getting
> > > the packet counter value of a single entry in the set/list?
> > > 
> > > Using the function ipset_parse_line(ips, line) I can issue most of the
> > > ipset functions, but I need also a method for getting the packet counter
> > > for just a single item only, ie. not the output of all items as "ipset
> > > save" does. I need to do this in C/C++ (hence libipset in Linux), ie.
> > > not in script.
> > 
> > There is no such functionality in ipset. You can test the existence of an
> > element in a set or list/save all of them with all of the attached
> > attributes.
> 
> I guess you mean just the ipset command line tool, whereas I explicitly 
> stated libipset.

No, the functionality is missing both from the kernel and the user parts. 
Have a look at the ip_set_utest() function in the kernel which answers the 
test requests: just an error/success code is returned to userspace and 
nothing else. While the dump function (for save/restore) works for whole 
sets only. There is no "get_element" like functionality.

> After researching it further I think it should be possible to read the 
> counter of a single item via libipset & co., or at least testing the 
> item for having a counter value "gt" etc, as is already possible in the 
> iptables extensions, ie. "-m set --packets-gt value" etc.

That is for the kernel match functions to find matching elements in the 
sets with given criteria.
 
> > > 2) man ipset says
> > > "test SETNAME TEST-ENTRY [ TEST-OPTIONS ]
> > >     Test whether an entry is in a set or not. Exit status number is zero
> > > if the
> > > tested entry is in the set and nonzero if it is missing from the set."
> > > 
> > > But the TEST-OPTIONS are not further described or documented.
> > > What test options are possible?
> > 
> > There's a single one in the case of list:set: to test the element before
> > or after a reference one.
> 
> Can you give a practical example for this?

I can give you an example but I don't think it's practical.

# Create a few sets
ipset n hosts hash:ip
ipset n nets hash:net
ipset n hostswithports hash:ip,port
ipset n netswithports hash:net,port

# "Aggregate" them in one single set so that you can refer them
# in a singe ip[6]tables rule
ipset n access list:set
ipset a access netswithports
ipset a access hostswithports
ipset a access nets
ipset a access hosts 

# If you want to make sure the order is right in the "access" set
# ... but listing is more straightforward
ipset t access nets before hosts		# returns ture
ipset t access nets before hostswithports	# returns false

Best regards,
Jozsef
-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
