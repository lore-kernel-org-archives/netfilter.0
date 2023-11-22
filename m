Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4E6C61D85
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 03:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjKVDAL (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 21 Nov 2023 22:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjKVDAK (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 21 Nov 2023 22:00:10 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9560CB
        for <netfilter@vger.kernel.org>; Tue, 21 Nov 2023 19:00:04 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c115026985so6370025b3a.1
        for <netfilter@vger.kernel.org>; Tue, 21 Nov 2023 19:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700622004; x=1701226804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYkYaTmb7Retba/tFIG/ryA7+agpu8XNZ/uCBsu4Hho=;
        b=loKEF7cV62j1DfslPAdHiiwjuoAg0hb8jY1KPG9FJqxEx1NiYELReKcGIh5N903wNz
         4hApVqa0SNyRgW2feDdkmToy7LwWiRBdk5FSUx7xkx44VUMGYhdFBDgghV68kEcvgazA
         nQaPYmIw+qFMoF8NJuSeFh84j2B9/y5oGjzHxEmO+4aZdtAOXZQzFe/gie0knaWzz8tm
         o2FT2kqg9sHGrIxuxkCx9SJbqHru7cRtenSJTGxgOh5Y7ykVbLF7tsRgRKh67AAzEdXz
         PDCC3OdX4hmJolZkL3X+NDyFOPGBHzj8zuu0964eQqeo5FLdynxjKPolkk05CAlRKOCp
         f7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622004; x=1701226804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYkYaTmb7Retba/tFIG/ryA7+agpu8XNZ/uCBsu4Hho=;
        b=fkoRn8xIk5KCsgs8t+kEaf1bV/pFcLf6h20WXsscuJ2vE5eAjrwHl0isib3qAnaI4p
         4xQI5ypLZHStCuadU99X3RaTB8R+zyGHkosxiqaNKoqv7wg62iDLODLOjyggeP9CXpJC
         hJXUbfyf5jZBzBBH8PGX8VJEto+n9YJz73nIdpg761iO5qwLOWlIhaNFGwE0NHCyF8AS
         mUOf0iMkIn60FkLGKMATLi9+kFI1Cx1xsbEUS7l1zl6YzFMNIsN0tnz968kGkVd+ORmR
         FMaUhPcAF6Kbdq7/CBRX26XuMoxMRSeALoBK6DqpZiLMMpp8pIrob3T85tQf0+tBb40I
         mOnw==
X-Gm-Message-State: AOJu0YyQr21Rb6SrQlpDsDZuOBK4/DE7T6s8CjlCNI88C01X6n3g3u7/
        vJivn0ZqoVOWSmwFJpwBPzD29qxd+aVRcWSQ
X-Google-Smtp-Source: AGHT+IHaJqg5H3ij/+HlbnbckvwEZ9rOUeHEFIwAmeiA+vwBE20jVflprRiF4LX8QClmSIB2Fsr8vg==
X-Received: by 2002:a05:6a20:7f95:b0:18a:e6aa:cd6a with SMTP id d21-20020a056a207f9500b0018ae6aacd6amr1160435pzj.30.1700622003982;
        Tue, 21 Nov 2023 19:00:03 -0800 (PST)
Received: from xcws1 ([116.235.133.242])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902bd0400b001b850c9d7b3sm8575213pls.249.2023.11.21.19.00.02
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:00:03 -0800 (PST)
Date:   Wed, 22 Nov 2023 10:59:58 +0800
From:   Carl Lei <xecycle@gmail.com>
To:     netfilter@vger.kernel.org
Subject: Re: nft tproxy failed to redirect on one system
Message-ID: <20231122105958.76a2cb30@xcws1>
In-Reply-To: <327D57E822A265D5+20230822181631.528b64c2@xcws1>
References: <20230811120043.0c3c6302@xcws1>
        <196291AF4921A1FE+20230821154807.270690a5@xcws1>
        <ZOSITfIcAHBrXpUi@calendula>
        <327D57E822A265D5+20230822181631.528b64c2@xcws1>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Tue, 22 Aug 2023 18:16:31 +0800
Carl Lei <me@xecycle.info> wrote:

> On Tue, 22 Aug 2023 12:05:01 +0200
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> > On Mon, Aug 21, 2023 at 03:48:07PM +0800, Carl Lei wrote:
> > > Btw: sent to wrong address, re-sent to list...
> > > 
> > > On Fri, 11 Aug 2023 12:00:43 +0800
> > > Carl Lei <me@xecycle.info> wrote:
> > > 
> > > > Sorry for being incomplete, but I added nftrace before these
> > > > rules and saw packets went through the same chain of rules,
> > > > first hitting tproxy in mangle, then meta mark 42 counter
> > > > accept in input-new-isolated. But on one system it works for
> > > > local programs AND network-received packets, on another system
> > > > it works only for local programs.  On the bad system the
> > > > packets instead gets directed to whatever program originally
> > > > listening on the original port, or rejected; e.g. I have an
> > > > nginx listening on 0.0.0.0:80 but no programs on 443, then curl
> > > > http in a vm connected to vbr0 goes to my nginx, and curl https
> > > > gets rejected.  I expect them to go to that program listening
> > > > on 1081.  
> > > 
> > > Looked closer at the trace, I found that on the bad system, when
> > > the packet goes back to input rules, its trace id changed; on the
> > > good system it does not change.  Perhaps this explains it, but I
> > > don't know why it was changed?
> > 
> > Could you provide more detailed information on your setup? You refer
> > to a system where this works fine and another where this does not,
> > but you do not specify kernel and userspace versions?
> 
> Sorry I forgot that in my first email, indeed I replied to myself
> several times and already provided versions, but I did not realize I
> sent to a wrong address.  My used versions are (copying from my
> previous mails):
> 
> "they are both running Arch Linux, the good system running kernel
> 6.4.8-arch1-1, the bad system I tried both 6.4.4 and 6.4.9; nftables
> version both 1:1.0.7-2; the proxy program on 1081 is also identical,
> running identical config."
> 
> > Some simple script with 'ip netns' as a reproducer might also help
> > that might help people jump in a provide feedback.
> 
> I will try ASAP to make a reproducer.

Sorry for the delay, I finally figured out what is going on.

When I do `modprobe br_netfilter`, which automatically sets sysctl
net/bridge/bridge-nf-call-iptables=1, the rule breaks --- the packet
would change trace id when it comes back to INPUT chains.  After I set
that sysctl to 0, the rule works again.

And yes, the packet is coming from a container, having a veth connected
to a bridge on the host.
