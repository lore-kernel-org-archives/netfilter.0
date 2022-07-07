From: Richard Lucassen <mailinglists@xaq.nl>
Subject: Re: CONNMARK rules
Date: Thu, 7 Jul 2022 16:05:45 +0200
Message-ID: <20220707160545.33561fea280e14d9dd8850ee@xaq.nl>
References: <20220707151739.06206fa5b2536669309e8041@xaq.nl>
        <20220707143156.4bac152c2c4d4ad65945767f@plushkava.net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xaq.nl; s=202104;
        t=1657202745; bh=gtFxZHDMCjit8Auv8dhb7YoQkLnOUJcquFKPdHRKvUg=;
        h=Date:From:To:Subject:In-Reply-To:References:Reply-To;
        b=EYuETiWWxmaL2v3XVmQiIcaUZWGAFA+Pca2i/zGJSOc4JJ6fk5bpwO2nJ2QiCnTOa
         i3/X5DLeSiWk8U+80ti2pfIRYoZNUwcAkncH9D2cqD1SW/sNPf284S0+NZAFBN3k1c
         KiX6RpEGUcuY3bQ0b5cPqlkMkpEceVARkfR9cJ3Yb+Q5W9otab7YmnWlwqREaL2PQz
         hxLzYhffi6qCUC7U6lRO2OAYokVqNvv3m3UtAi2V9qes8285KAsBnhv0lk05er+3QF
         GshUv/KKUsr1LzJdKy31J/l5lXClrFtH6xtpvQTR2XolZ5dGoDT7unz4ZOq7ECXygH
         OlAwnf3QR7rgg==
In-Reply-To: <20220707143156.4bac152c2c4d4ad65945767f@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 7 Jul 2022 14:31:56 +0100
Kerin Millar <kfm@plushkava.net> wrote:

> > So I assume the the CONNMARK rules are not end rules (hit = exit)
> > 
> > Is that correct?
> 
> Yes, it is. This could be confirmed by inspecting the rule counters
> or by using the TRACE target.

Ok, thnx, just eager to know ;-)

R.

-- 
richard lucassen
http://contact.xaq.nl/
