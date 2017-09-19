From: Will Sewell <me@willsewell.com>
Subject: Blog post: Per-IP rate limiting with iptables
Date: Tue, 19 Sep 2017 20:23:01 +0100
Message-ID: <CAKMCqE+-hNhS0izfZPo62dxNQ4=WHJgwrT-0E_ihTHM1L-Gc2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=0u+CTToWH5tq6uVBJO6obS/qNXL06MI0qsyMg+69pIg=;
        b=vU03Elm5p+eW5c9vgXL02pjR78cjDl0ciBm9BPb1MTvfpCgfaSWR9LdfoHcDAu+kmY
         JFccTlC1klMccZkxjT9fGx/UkLxegh3hCfREy3aJgEzk2HqRzJlv4gOSnwRA5RS5mgkh
         vW2j+mMQqTurIOoGuyC8tc6fVNfmKePGWaE39Sn+ATc9PhRfLNGnf+NPCYMhexG0Zlcd
         4p1BCWWfJFEo8XbsA2Cd2AIoOqPYZ6WrZ7o91GAHVc7kCmAU0/sX8HWE7elNWWr3tJa7
         9LK27npoo4vwZS3ZsCbXawnDPZ0FHM8yNHDKBimfQZEobtxeYyHu3tHcrmElqhEIZnVP
         QDBg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, we recently had to implement per-IP address rate limiting using
iptables with conntrack and hashlimit. The goal was to block
connection from rogue clients in hot retry loops. The post is written
in a tutorial style, so it should hopefully be useful to new users.

We're relatively new to Netfilter/iptables too, so if you have any
feedback and/or corrections on the content, then please let us know.

Here's the post: https://making.pusher.com/per-ip-rate-limiting-with-iptables/

Regards,
Will
