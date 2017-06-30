From: Samuel Williams <space.ship.traveller@gmail.com>
Subject: How to translate iptables hitcount to nftables?
Date: Fri, 30 Jun 2017 12:40:55 +1200
Message-ID: <CAHkN8V8c2TxSLq9rWcaQj2N+wc8keHZgG0cNMcE6f2jR79_XSQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=r5OKBW8k0/zwwmeFYokkiTCBKkkbnrfetI29W1sPoMc=;
        b=pjsYT5ZS04WOIML+03WOHqk6tmqhAPZTvnUMk6LypXVFW4nGKhq58H0jK4LEv+pPuf
         7lIMcZ4ZCx4zPPYJvzlWsHzszHkwsVG0Eb6pg3Ncexfd3jYfuvj8DPNsdQoFYAnAlCM7
         yVvQFGHkNpFttR8DCBIzXFw1sEml0JlXsNXt5gEl8FF9UssVvXBKDCJAPkazWSYZwTVg
         K+ZiOFTBWM/st7mYAMUDKAp9PycRqkp6g5h2n781CglqVvwK53XpFjvYnKTu55yz0dlk
         AnJOjtDCZ6yPXJtX/lqRm14SJhNKce/F6aO5bfjbdNXpqRDBbVkjRSraXahuybOiGwkB
         6cYA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thanks for any help! I did some search on the wiki but there was no
reference to hitcount - perhaps we can add something?

iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW -m
recent --set --name SSH
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW -m
recent --update --seconds 60 --hitcount 8 --rttl --name SSH -j DROP

Kind regards,
Samuel
