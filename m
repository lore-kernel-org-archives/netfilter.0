From: Matthew Ellquist <mellqui@d.umn.edu>
Subject: nftables + docker
Date: Tue, 1 Mar 2022 23:57:25 -0600
Message-ID: <CAOBAZ9COSZ6WcjGoQFNWhUPZsyefd49uWrgiVkeMjnHLsr8yKA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4K7k0y1zfwz9vCFq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=9N6ajzLJsA8rYeWSHm9aZgi9u6kVvv9I8ieA+qWl+Fw=;
        b=O6DHE49FPa8dceAjblq8mXr1MHz9j24zMs33BV56ToUkYFl4ORIn4jpTCtjTd23+lO
         VXVsw/U5zP6pk+q7AanCtLWul2/c4WSVswB+9Wk1KoQd4hlVm0kBLIRTtI+c9HqrDHy0
         4C9JHZWHKInEtA3EGn/0oLE69fo2XzIoI27LzJsNGs+iOxNecIvk3O5sxALaJAJjeYva
         kRAayRF4YLSM5V0x0UrFHc0Czcds7l9AC478iPmg/l+o7YV3j8gKthgg+cx9s8QT5Pfy
         Acj+4zv8Wt78r+KH248xi07zC0HPU20bUaL/5DleLRuVhLI4oSkWcPS1xqaM99zmV5Uu
         ePEA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NFTables Mailing List <netfilter@vger.kernel.org>

Greetings,

I'm very new to nftables and thought I'd throw this question out there
while I researched it.

Is there a way to not have to restart the docker.server to rebuild the
nftables rules, after restarting the nftables service?

Thanks,
Matt
