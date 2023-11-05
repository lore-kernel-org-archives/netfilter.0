Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895CBC4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 15:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjKEPzn (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 10:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjKEPzm (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 10:55:42 -0500
Received: from tootai.net (mail1.tootai.net [IPv6:2a01:4f8:a0:821b::58:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D31CC5
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 07:55:40 -0800 (PST)
Received: from tootai.net (localhost [127.0.0.1])
        by mail1.tootai.net (Postfix) with ESMTP id C3685608142E;
        Sun,  5 Nov 2023 16:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699199738; bh=6Mq0Ody5iRbmU6FoF4I73WfdiEsSpM7RR9LXUl+VMwk=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
        b=FU9/fbIbWeSW9wl0/18ntdUgViXbjpH9VmqmXT89kriC8h/H5PSxIqoRmO/hcoMVf
         RVyhih5peLussdEU6UzlVLZ3VTJE+VyYf12nK2KgWtR9UjEqYW3pnUqbJ7YIFqLP1/
         Zyja8S11+jKkfpEPcVz6lN6AwpBFX+GwtuoOOI0U=
Received: from [IPV6:fd99:1234:beef:cafe::14] (unknown [IPv6:fd99:1234:beef:cafe::14])
        by mail1.tootai.net (Postfix) with ESMTPSA id 851FA6081A3F;
        Sun,  5 Nov 2023 16:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699199738; bh=6Mq0Ody5iRbmU6FoF4I73WfdiEsSpM7RR9LXUl+VMwk=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
        b=FU9/fbIbWeSW9wl0/18ntdUgViXbjpH9VmqmXT89kriC8h/H5PSxIqoRmO/hcoMVf
         RVyhih5peLussdEU6UzlVLZ3VTJE+VyYf12nK2KgWtR9UjEqYW3pnUqbJ7YIFqLP1/
         Zyja8S11+jKkfpEPcVz6lN6AwpBFX+GwtuoOOI0U=
Message-ID: <6dd0051a-7bd4-4813-b68b-2a73962cc7cc@tootai.net>
Date:   Sun, 5 Nov 2023 16:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Tech <tech@tootai.net>
Subject: Re: Redirect doesn't do the job as dnat does
To:     Florian Westphal <fw@strlen.de>
Cc:     Netfilter list <netfilter@vger.kernel.org>
References: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
 <20231105152753.GA21055@breakpoint.cc>
Content-Language: fr, fr-FR
In-Reply-To: <20231105152753.GA21055@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Le 05/11/2023 à 16:27, Florian Westphal a écrit :

> Tech<tech@tootai.net>  wrote:
>> in another terminal I run
>> nc -vl :: 58198
>> Listening on :: 58198
> Please also spawn tcdump -n "tcp port 58198 or tcp port 58194"
Sended per PM

-- 
Daniel
