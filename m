From: Die Optimisten <inform@die-optimisten.net>
Subject: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 14:00:01 +0200
Message-ID: <51DFEFC1.6070708@die-optimisten.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hallo!

I want to DNAT all incoming 0/0:443, except those to localhost:443
        to my proxy localhost:8000
What is the best line to achive that?

-d 0/0:443  -and ! -d 127.0.0.0
# seems -and does not exist...

THANKS,
Andrew

Please be so kind, and also answer to me per email, I#m not in the
mailinglist

