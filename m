From: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Subject: FORWARD -P DROP + allow MSN
Date: Thu, 16 Apr 2009 12:30:27 +0300
Message-ID: <49E6FAB3.90304@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
These are my current rules:
http://lab.vectoris.fr/projects/vectoris/browser/IPTables/trunk/firewall
(It's a big mess yet because I miss one feature: MSN. I'll clean it later)

The box it's running on is the gateway of the LAN to the Internet.

As you noticed, FORWARD is DROP by default.

I would like to allow MSN to my LAN users.

The problem:
If I "FORWARD -P ACCEPT", MSN works for the LAN users.

If I use it as it is now, MSN doesnt work.

Anyway, when setting the MSN LAN clients to use HTTP, it's OK with this config.

Any tips?
Thank you.

PS: no comments on the crappy Facebook DROP ;-).
-- 
                              Chef de projet chez Vectoris
                                  Phone: +261 33 11 207 36
System: xUbuntu 8.10 with almost all from package install
    http://www.google.com/search?q=mihamina+rakotomandimby
