From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: ipset -R
Date: Wed, 23 Feb 2011 00:58:47 +0000
Message-ID: <4D645BC7.7030306@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=kFreXe0KSkgroj5em026cCkAlWAGtrzYrtO5lYSmG+k=;
        b=TyWGZ0D9U0uM2GZQAq5S4lPuTInVH6HBo8XSsXTWuZXe9Z+bAdB/u4j58D4yCVqqC9
         SxtHwfLNfufYvIfgPBQHV8myEp02Lyuc6VbVCqsX3YLGsNgFu5xKxhxE4C8HzLrpJbjc
         lQVxzqyQpuH7zJXOc+tCm0lyYdlkPt/apCIjA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

When I execute 'ipset -R < some_file' ipset ignores lines with the '-D' 
option specified. Is that intentional?

I am trying to execute a script file creating 'pinholes' in (previously 
built) ipsets, but, as it stands, I have to execute a shell script 
containing 'ipset -D' for every pinhole/range I am interested in, which 
isn't very convenient. Ideally I'd like for ipset to honour the '-D' 
option in a restore file.

The reason I need this is because I am defining ipset ranges coming from 
the geoip database and later, with the '-D' option in a script, I am 
trying to create the pinholes - more convenient since ipset has a very 
nice feature to re-adjust the ipset ranges automatically after delete, 
instead of me using endless '-A' statements adding the resulting ipset 
sub-ranges.
