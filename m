From: Francesco Morosinotto <francescomorosinotto@gmail.com>
Subject: help needed preventing bruteforce behind a reverse proxy
Date: Tue, 01 Jul 2014 10:03:24 +0200
Message-ID: <53B26B4C.4030002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=YLpalVyOA2dNeJGgHMCPdHPuyAZef3katHfX4qRG67o=;
        b=Mi10YAaqxdhEsMr2MWJRyX1XnwxHWlFylsEeUiWbfYN7eZB5L7y4SqMPDc9410F6jm
         YO/PtFQo+ScvvL3PxxfhISUurfUbJFV4APH40IPZpt8DOElBaTu+ta/c6v0A417KQsSU
         IzP+sEwduFkJ6qUZUdxWEpnS7l8/D9qe2mSFZ4+uxhruHJqHTE4ixFe6z6QXflOISsT/
         UXHNePMxkOBh2xAhiV71wGsqYq+21zkgFahAztRZGrg1PscVpbgjT9KCH/7pS4iq1x4Y
         JnXta/ajpDOsCKGRUTVRsRXiB92uCcpkKd8UOeL+cDIU42nyFve95rSYDMrv5j1wZNhs
         DJwg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys,

I'm a young "system administrator" that works for a non profit organization.
I've recently implemented owncloud on a local server running several
virtual machines.
Having only a static IP every service (running on different vms) is
served through a reverse proxy (apache).

I'm trying to secure my cloud installation in order to prevent
bruteforce attack: I can log the attackers IP (using apache-mod-rpaf
that reads the original ip from the x-forwarded-for header) and I was
setting up fail2ban to add these ips to a blacklist and deny the access
through iptables.

But It seems that iptables is not able to understand where does the
request come from and always log the internal proxy ip address.

Is there a way to tell iptables to read the x-forwarded-for headers?

can you suggest some other workaround?

thank you guys

-- 
Francesco Morosinotto
web: http://morosinotto.it
CV: http://morosinotto.it/curriculum
skype: francescomorosinotto

