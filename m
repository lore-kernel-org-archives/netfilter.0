Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DC9C4332F
	for <netfilter@archiver.kernel.org>; Tue, 31 Oct 2023 18:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbjJaSpA (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjJaSo5 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 31 Oct 2023 14:44:57 -0400
X-Greylist: delayed 381 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 31 Oct 2023 11:44:54 PDT
Received: from tootai.net (mail1.tootai.net [IPv6:2a01:4f8:a0:821b::58:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8884A3
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 11:44:54 -0700 (PDT)
Received: from tootai.net (localhost [127.0.0.1])
        by mail1.tootai.net (Postfix) with ESMTP id 0A0E4608142E
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 19:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1698777511; bh=RQDQ0KrnHnxKSpW6r7i5cYS8XEEPxq2xZmvcV3l2sak=;
        h=Date:To:From:Subject:From;
        b=F6C8H9VmBOsWEv9DHQh7VXgMjDJ+WRQj/z23Xv56vM84icpjLgjJS/L8XH2B0mAKU
         xnPFULufxri34+5kAwtUdQ0O591tdULgeicz9IduWyXtwIisFmV5AfhD7IAvdODViW
         jR+ccC9k5MXOrwvIlzKQqHwb915zSNEDUVl2SG8c=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
        by mail1.tootai.net (Postfix) with ESMTPA id D25AF6081A3F
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 19:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1698777510; bh=RQDQ0KrnHnxKSpW6r7i5cYS8XEEPxq2xZmvcV3l2sak=;
        h=Date:To:From:Subject:From;
        b=S34XpvQ3ufYWLM8AlsENR1/9/59/uKNoObN2XCrQn96EQgNbGKqR+I3t/CPMRanke
         /yRxkhhX5ILgSkFdI8ZWbhRdSmZL74FKIruniA3hmXAMMwehii6HinDRyoHyMz7Cpn
         SKbkpRgu0I15zhqt8FIUtpAtivhfnU+V9INg1PdQ=
Message-ID: <c0f8e0aa-93dd-46c6-9eda-7cb7934bf1c6@tootai.net>
Date:   Tue, 31 Oct 2023 19:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR
To:     Netfilter list <netfilter@vger.kernel.org>
From:   Daniel <tech@tootai.net>
Subject: map problem with port range
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi list

nft 1.02 I have following map configuration:

map forward_udp.lan {
     type ipv6_addr . inet_service : interval ipv6_addr . inet_service
     flags interval
     elements = { 2001:db8::1 . 20000-24999 : 2001:db8:16e:10::ffee . 
20000-24999 }
}

ip6 chain prerouting

add rule ip6 nat prerouting ip6 daddr . udp dport map @forward_udp.lan

but I get a syntax error, unexpected newline

Where is my mistake ?

-- 
Daniel
