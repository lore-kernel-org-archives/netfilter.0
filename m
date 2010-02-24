From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Port Scanning: Is there a difference between stateful INVALID 
	filtering and stateless TCP flag filtering?
Date: Wed, 24 Feb 2010 08:18:07 +0000
Message-ID: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=tA/S8wIKwcmbHVO80yLHraOGBnI+OldURVZnUYB9hNI=;
        b=FTnBa/vz5CkzLrJO7qbzh6Lpx0oz3mCJ2ErZ1A6yS5NWVqvitbpK9ywZZgQvls/c0u
         9GW1GeLJAsvfv22Ekw+jD5cEmhAOQVTp8Bq5KNe7MlTVyRZAwD7lapTkUqMeiVOWCdWF
         G4oeLuL7IGWpcsj/dzicMZMo1GgxyYB3JpAQs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

When preventing (nmap) port scans is it better to use the
connection-tracking INVALID option or use a set of TCP flag filters or
both?

Note, by my calculations there are 21 possible combinations of TCP
flags, this includes legal and illegal flag combinations.

ASIDE:
Can stateful filtering using NEW and ESTABLISHED on their own also
work, given that connection-tracking is supposed to be tracking
connections?
For example, allow outbound NEW and ESTABLISHED traffic and allow
inbound traffic recognised as ESTABLISHED.
Would these stateful operations prevent nmap scanning?

I saw a few examples where the stateless tcp syn flag match was used
(by checking that no other flag was set) in conjunction with the NEW
operator.
For example, iptables -A INPUT -p tcp ! --syn -m state --state NEW -j
DROP # using the not (!) operator

Why is this the case? I would have imagined that the NEW operator,
would require by default that only a syn flag be present. Unless the
NEW operator does not check by default that no other flag is enabled
in conjunction with the syn flag. Would this be the case?
