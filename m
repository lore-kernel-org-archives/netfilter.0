From: Mauro Santos <registo.mailling@gmail.com>
Subject: Help/guidance with automatic CT helper assignment
Date: Mon, 10 Apr 2017 22:22:25 +0100
Message-ID: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=NdNGsfkgkFVLM85ovtZWrFLoJLKPKEytij0keqJmotg=;
        b=pjt5B7+Y5b1kob7mc4D4nEm1CYyu2acbsxNIzBtH4TYExS6NWKDI72PnvWiCdo5Dj8
         SIdHAuQLXycnPA98pfLtCUD9YTPc+pgcoo7uSjLJEbLTh++jfwSBWfyx3r+4jhXW3CQ4
         +IMSiDqlX7KmnnheiUB0oxP/YPYOsiUe5BKzt5IAXPV9G7irg4picLx6xibmpxxejFjO
         nl72VQ1Y0EV9kmWn2j9g5Gdj8Lt2LVPkEMYkuVfx/hxoSf4l25s/EABPvs7EFmP1/Pxf
         NfQYfc8yCCxMm7dFfl46TvvgkG6/XNu3u89MvyRZ95eanzqruYEkAI8prBqBCqxwQ0ie
         Ibrg==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm running linux 4.10.8 and I am aware that automatic connection
tracker loading has been disabled by default for security reasons.

I'm currently seeing:

nf_conntrack: default automatic helper assignment has been turned off
for security reasons and CT-based  firewall rule not found. Use the
iptables CT target to attach helpers instead.

in my kernel logs, which is to be expected to some degree I suppose.

What I would like some help/guidance with is finding out what is causing
this, that is, finding out which program would cause an automatic helper
to be loaded if automatic loading was enabled.

I have currently setup two helpers, one for ftp and one for pptp (which
pulls the gre helper if I'm not mistaken). These two helpers have been
added with:
iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
iptables -t raw -A OUTPUT -p tcp --dport 1723 -j CT --helper pptp

I have tried monitoring incoming and outgoing connections with source
and destination ports that the other helpers should work with (I've
taken the list from here http://www.shorewall.net/Helpers.html) but the
timestamps of the messages (ports log and nf_conntrack message) are too
far for me to believe I'm catching what is causing this.

Short of logging everything in bulk, is there anything else I can try to
catch the culprit? I'd like to avoid logging in bulk because I have not
found a way to trigger this on demand and sometimes I see the
nf_conntrack message several hours after boot, which would make for huge
logs with normal machine usage (youtube, video calls, etc).

-- 
Mauro Santos
