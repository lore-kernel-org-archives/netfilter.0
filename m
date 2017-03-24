From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: [Netdev ANNOUNCE]: New talk accepted debug pipe
Date: Fri, 24 Mar 2017 11:56:30 -0400
Message-ID: <0edc0f79-c960-5f26-efea-4a26455f5747@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=MDRPPLTk4IyKkvnZ7NuqJi25O/T3bhp6zULNPSmVgsc=;
        b=e8HgZ16WY7hcfq8GI8LuET0NchrizdDeZnseYWgH0KAC04EvwrK4PeVNPntAJr8I5y
         fFhdKjs5juPAaAyKQEDYbkxHXZt1dzAeKRaGF7PM5MaWOaulXooKzRV+ov112cckHgai
         OKQh6b2QyRjnvcuK5btq63WucY0wpP6ru3+5X9bsVIwa3eO8kAU9RSZkq9afHGGyi+52
         SEGxic9kYL1skc7J/AagOsMcmSZNz0cK2wGRs7yqD0Ol5DrIakqvpFEDKBbEHa5uRLag
         17UVjIElFE+LQwivSO61Sg4jX7f/U7SLhYIf+ffg25+oEIzoDnkT4aMTNvso7x5JrV1t
         /ddw==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org, linux-wireless@vger.kernel.org, Heri Muhero <hmuhero@gmail.com>

The tech committee would like to announce a new accepted talk.

Arkadi Sharshevski will give a talk on the new dpipe tool.

Details are as follows:
-----
While doing the hardware offloading process much of the hardware
specifics cannot be presented. One example for such is the routing LPM
algorithm used in Mellanox Spectrum ASIC which differs in hardware
implementation from the kernel software implementation. The only
information the user receives is whether specific route is offloaded or
not, but he cannot really understand the underlying implementation nor
get the specific statistics related to that process.

Another example is TC classification-action offload which in hardware
commonly implemented using TCAM memory. Currently there is no
capability to gain visibility into the TCAM structure and to debug
sub-optimal resource allocation.

The new dpipe interface introduces capability for exporting the ASICs
pipeline abstraction via devlink infrastructure, which should serve as
an complementary tool. This infrastructure allows the user to get
visibility into the ASIC by modeling it as a set of match/action tables.

-----

cheers,
jamal
