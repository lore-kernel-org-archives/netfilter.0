From: Jamal Hadi Salim <jhs-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Subject: [ANNOUNCE]: New sponsor and accepted talk
Date: Thu, 23 Mar 2017 14:46:34 -0400
Message-ID: <3a7c4196-2812-4894-2f4e-a7d1c88fa650@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=gujN7SVC73WP/T3Jtex+kwYWcxGbB4FnSTTK0MCigNU=;
        b=0WiZw/VLxe9GmPv4da9/W5TYRqILN+N48S0xigWaw20EUtP5tOJsu4WeZMFGxnVyUu
         eA3Kc/QJfMgjib+2m9Isz7S6swBPiVQp9eevlsW6In49DspzUdXPKTGll1bTXLC7RX6A
         Jbk9OtUfODb1GclFEEhS3bPhpknvwZ4rJoOjntIEE/TJkGHICjkTsJ9VvY6dcWZdkXzs
         YRgsDornzlFMCttL1TBQIk+PbVI+5FBpwKJa8yqizQVn29SROEHdgHGDp/HOzBVKQ1jU
         4brzHuqHqrIkzmrmIki2rxT5XE8Jtv/yePWk5iFlodLkQVt9IT0UmBgs6MjBmU2v4iUt
         tlbQ==
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org
Cc: tech-committee-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, netfilter-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brenda Butler <bjb-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, Stephen Jaworski <jaws-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heri Muhero <hmuhero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Two announcements for today. An accepted talk and a new sponsor.

1) The tech committee would like to announce a new accepted talk.
Arthur Davis and Tom Distler will talk about their quest for a
quest for a network configuration solution for a large Linux storage
application

Details are as follows:
-------
This talk is about our quest for a network configuration solution
for a large Linux storage application. Our application is based on
a highly available cluster architecture which requires
dynamic and reliable software-driven network configuration.

Further requirements include:
- programmatic access to configure the majority of the Linux network
   stack,
- transaction-like semantics where multiple related configurations
   either fail or succeed as a unit,
- logic to monitor the system and when it differs from the expected
   configuration, provide notifications and possibly attempt automatic
   repairs,
- and all of this without becoming entangled with application-specific
   expectations about behaviors and policies.

The talk expands upon the above set of core requirements and discusses
some of the difficulties around meeting these requirements with
currently available open source solutions. Our journey leads to a new
configuration system to meet these requirements, and we discuss some
key architecture and design aspects of the system.

We are planning to release our work into the open source community and
we hope the talk will encourage discussion and provide us feedback on
making this work better.
--------

2) The organizing committee would like to announce
Savoirfairelinux  joining as a bronze sponsor. Thank you!


cheers,
jamal
