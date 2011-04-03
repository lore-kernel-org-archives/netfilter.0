From: Richard Hartmann <richih.mailinglist@gmail.com>
Subject: Catching ICMP/TCP unreachable and triggering a command as a consequence?
Date: Sun, 3 Apr 2011 22:33:09 +0200
Message-ID: <AANLkTi=UFNi5=UJ7U5otpNuJNvRbQr3SVJ5-vsOE8Ghj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=Vj7A6ho+hjMP2x+jJYtrxNOfCo0t/bkeRnov91JaefY=;
        b=hi90d7iuJbGxL+M98S+IzYOkjom3T1s9AFaZUW/bnr+8XpGO0BzJTt34YCq7oJeTdt
         jDno0r4OSachABAu2uT0YX/ZDxmbYhgZ/cccrJHahOc/Ezf494rJI3geeJMODV2yKAI3
         FXgLA1t5sVseD2LaUZoWrdBJTTg/vN7p+Brqo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I thought it would be possible to execute a script using iptables, but
according to the relevant man pages, this is not the case. I still
hope someone on this list can help me.

Basically, I need to catch ICMP unreachable and/or TCP connection
(attempts) that are timing out and execute a script when either
condition is met. This does sound trivial if one knows where to look,
but I simply can't find a way to do so.


The actual goal is to escalate this condition to a custom user-space
process which can set up overlay routing.


Any and all help appreciated,
Richard
