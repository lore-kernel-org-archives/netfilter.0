From: Alexander Meinhardt <alexander.meinhardt@gmail.com>
Subject: nftables: response of nft is rising
Date: Sat, 22 Apr 2017 15:37:22 +0200
Message-ID: <CAB_+ZOv_5-Zq94ZczEMn4ThnXn6G4+QS0HQPqO1WapsqN6n4uA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=O++FjqccmG2+NLlQK8wNQ13l4/Cf/JwgdVWT3EmVXOg=;
        b=Jza+CY8o3mskEiTY+zidrRV1ONnwiKti+f/nyOlIYm4d2L+PoSZlEUAsaWFE7OYnzs
         yTKoYUj2V6WsxGN9g5r+HU1im1LhA99lcEqcTZMco3cYPlls+Y+m1pdjUC8kugpr+/ef
         HcoGYz/wwTJaOijaL+saYqsYrYTbmrlI+x41aeSgtnVysz7nHEzPQCOcLcA/AU5bLZzC
         JYuW7C/Zz8wP4ECBpO8iFYpOofqXfWy5a0TmRwqZbi1vb2/kuQkXoMzSbebFnuKlV0kl
         k66YXp1uqDG0++WPl5sQ77iXe12kUGx0l1amFlQ4V8LsNjvn3fkdRgzBbnKVttE8VbuY
         gjSA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I was updating my kernel to 4.9.16, because it is the latest stable
marked on Gentoo, and recognized a heavy rising response-time from
nft.

I have a standard ruleset including 4 sets, where each of them has
dynamic content (ip blocklists) containing set1 450 entries, set2 250
entries, set3 5 entries and set4 1 entry.
Each set was created with "type ipv4_addr" and "flags interval".

After 3 days uptime, the response-time from "nft list table ip filter"
(where "ip" is only ipv4 and "filter" the whole ruleset of ipv4) is
approx 0.6s.
>real 0m0.651s
>user 0m0.105s
>sys 0m0.536s

After 4 days i'm reaching nearly 0.8-0.9s - rising.

When i restart nftables, it's starting from 0.008 - 0.012s again, but
it's still rising.
So for me it's not related to the size of all four sets?

Can anyone confirm this or has some ideas?

Using:
- kernel-4.9.16
- nftables-0.7
- libmnl-1.0.4
- libnftnl-1.0.7

--
Regards
Alex
