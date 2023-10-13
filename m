Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7985C41513
	for <netfilter@archiver.kernel.org>; Fri, 13 Oct 2023 14:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbjJMO1I (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 13 Oct 2023 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjJMO1H (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 13 Oct 2023 10:27:07 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5E395
        for <netfilter@vger.kernel.org>; Fri, 13 Oct 2023 07:27:05 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 387055C040F
        for <netfilter@vger.kernel.org>; Fri, 13 Oct 2023 10:27:02 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 13 Oct 2023 10:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=km6g.us; h=cc
        :content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1697207222; x=1697293622; bh=a4
        OvHgjXurUThlve0c50jgz/uB89xdLdAnPWiBwIUEM=; b=Hf6VxKW0U4E58JDurW
        zEesd76tP2Z749OBzUsJQvdrPTWV3K0RyJfW9nEllgpS5AQQbyNcgoORhw7UFyTi
        j/1/bOTyBDawMI5Fz0CkeWOzns/iyCC61nCSqWKcjWoBKnvYZ72sgUTIpR83HbrO
        UclApCQb3RyryiP/4D8WyAEloVKLeMjieuVa8BkwHtGtWcvdAdqPg4I0546dMB/6
        IJPxYD+dsf9P3hFilBZ2nd+IxGEe7qr3TNegVjYwl8CJeclpmNZErrP+WlCikioH
        /OCXo50eSreEfrqUHe1BnQhvBMiWz5RgOSQJG1WhdQV1wIQnWD7qegviWqDq38+O
        yBkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697207222; x=1697293622; bh=a4OvHgjXurUTh
        lve0c50jgz/uB89xdLdAnPWiBwIUEM=; b=ePXbrgSZ3CTdCbF00WF8lJJJrEJdv
        dCcFR6em2Gb7PG+ja+PxU1YqjOlPo7pTZYPEi7aUKpJlulSjQ+TV2cNOPbhxDRWX
        yfzEMYRE++8lqSiot0sgUxnOGs7lndYOETvkgPczeVy+uL0ai6kPpMvYkNPHRb/B
        jWxYFYgqoZKe5JfCnbg4fN6BbcdecgjzpSlBTQ/VhNEmYvAWtVioR8IhuylWmTkn
        xjuZJxLlHQdku6ZlBQIDMM3RVKVNHx84j5TMRvp0R6ZlC4n9OWOXY5h5VnXUqxJV
        wP3Pmo9w7T/8WM+Hkar6Ss1poVPqxiyJX4lp7J8gcAOoHWh5IS65TX0YQ==
X-ME-Sender: <xms:tVMpZW4wSYfeiSO-3YmQqMvxt0bgtrAzTPPit0JHqb5zU9qPSVR_Ag>
    <xme:tVMpZf6OCq2o0BaU2QZs4SD2hr1na9LWnadZt9e8cnNdH3SNP8VtFuE-ll0Jr-b1B
    GUSmjCMERvQQZ-47NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrieefgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdfmvghvihhnucfrrdcuhfhlvghmihhnghdfuceolhhishht
    shdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhusheqnecuggftrfgrthhtvg
    hrnhepieduveduueeuvdfhudevteevledtvdevjefhtefhkeffvefgheeiffejgfdvuedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhish
    htshdrnhgvthhfihhlthgvrheskhgvvhhinhdrkhhmiehgrdhush
X-ME-Proxy: <xmx:tVMpZVdufzcACfi-tkkdOkkdMLaCAiepHUky1Cw6Aww99BCKVUYBTg>
    <xmx:tVMpZTKRe41W-v8pv3jsPMwyvJYQzAFU7M0tjZFEfD0RxzemxhLmlA>
    <xmx:tVMpZaKCa7SfvqBAM9UhvNvF8fZTxW9CnLMNj3VveP3H18gJSp8WVg>
    <xmx:tlMpZfX6ucN6aiSnGD0qggKbvNN2zZsNymTILGtOOyx4h2d_VOkvFQ>
Feedback-ID: i1309466e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D192A1700089; Fri, 13 Oct 2023 10:27:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <3562848c-fd2b-45dc-9c47-a88a2418a25c@app.fastmail.com>
In-Reply-To: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
References: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
Date:   Fri, 13 Oct 2023 10:26:40 -0400
From:   "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
To:     netfilter@vger.kernel.org
Subject: Re: commit to kernel fails since Debian 12 (bookworm)
Content-Type: text/plain
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

> # uname -a
> Linux fw-dc-c 6.1.0-9-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 
> (2023-05-08) x86_64 GNU/Linux

I doubt it's the cause, but your kernel is four releases behind: current Bookworm kernel is 6.1.0-13 (6.1.55-1).
