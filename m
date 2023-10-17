Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24879CDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 11:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbjJQL5w (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 07:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbjJQL5v (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 07:57:51 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 17 Oct 2023 04:57:49 PDT
Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172D2A4
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1697543564;
        bh=01MR67qjXerk9Bx4pTEatPV4qK4c+zWIRAIYxjK2YbQ=;
        h=Author:Date:To:From:Subject;
        b=nsvvM6l0xXo2haDHDyHn6yZxFsv985nrM3OKuqv02qvcFMyG+ObhnlTGHOtsvuXv2
         WIPOtgG3+Myzeb4mzfOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1697543564; bh=01MR67qjXerk9Bx4pTEatPV4qK4c+zWIRAIYxjK2YbQ=;
        h=Date:To:From:Subject;
        b=CANjSRUkLt2XW+QJ5MgWmY92A/Qgktk1CI4tgJ/CdNlsvI5emEkOnHdFCBrUR7Up8
         X12YBjFd32NculdYnZ7M7WUH7KOyZ8XPvJT0hKr7PYytyDbyh3GpZd6o3SHAFVYe3V
         hk2xvxo2Q6jqxpvYd88zS2A+oE+wOrdX1pwoIwzX1kBycc4lclPL00ksuBWxu
Original-Subject: Getting packet timestamps
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC05B.00000000652E758B.00002121; Tue, 17 Oct 2023 13:52:43 +0200
Message-ID: <ee9c0381-43ce-497b-a3de-d660c8a49272@tana.it>
Date:   Tue, 17 Oct 2023 13:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT
To:     netfilter <netfilter@vger.kernel.org>
Authentication-Results: tana.it; auth=pass (details omitted)
From:   Alessandro Vesely <vesely@tana.it>
Subject: Getting packet timestamps
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

is there a libmnl equivalent of nfq_get_timestamp()?  I found I can call this:

struct nfqnl_msg_packet_timestamp* ts = mnl_attr_get_payload(attr[NFQA_TIMESTAMP]);

and then use be64toh().  Is that the way to do it?


BTW, I never got an NFQA_TIMESTAMP while testing.  Is it at all worth trying to check that value rather than just calling gettimeofday()?

TIA
Ale

