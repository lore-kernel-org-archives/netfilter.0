From: carlopmart <carlopmart@gmail.com>
Subject: Recommended iptables setup for management servers
Date: Mon, 30 Apr 2012 20:59:00 +0200
Message-ID: <4F9EE0F4.30302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=HdeBZLCGdlDfBFpAHufpBnQ/PB47Rqs9bglhafOn7Fk=;
        b=wP7sZyFLUMxH9w/9lU5ZGokZHWQXS6+Wv3kVj1q9OIx6QLTXXxqJxyuDFHPuVXX/bl
         j+OQvOI04omFjd8dnliDQur6UrwR8QJKPtn6M+Wzvu51H1W3HJQIxDmR2/uSsa2oPNCR
         sD6SbvRbGdYOs3cq4p2qIU8diJ4iD4v9MiCZgNRH5U/9GmZA+6vj6gp2hgrlWTIgrZF3
         X0OnuWqbXOEo198k6NXqk+q7QOwWJpLaeJecq4OB+askyHBfw2dq48NvY1F9Om5ZupT6
         QYk/U1aOxU2ZE2in5NylcW1r49cap6CgfeY9A/4yv8EcRYkiFAupPHaDzld0/5T2tD95
         4vTQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

  I am searching some tutorials about how to configure a robust/lockdown 
iptables rules to protect management servers (for example some NSM 
servers and firewall management servers).

  Yes, exists a lot of info in the web but nothing pretty much concise. 
I have used over several years BSD firewalls (pf) and this task is very 
simple ... but with iptables I am really lost ...

  The best tutorial that I have found is:

  http://www.remetter.de/os_linux_skript.php

  .. but it seems too old, or not? My linux servers are CentOS 6 ...

  My primary objective is to block malformed packets, scans, and control 
packets managed by mangle. Some of these servers have two interfaces and 
some services needs to be reached by this secondary interface.

  Any help?

  Thanks.
-- 
CL Martinez
carlopmart {at} gmail {d0t} com
