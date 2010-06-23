From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 16:47:06 +0300
Message-ID: <4C22105A.70006@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21F56C.3070603@gmail.com> <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=MTI5VPvXqEpb8AFmd0jUYW0yzAzt//oOSJ5+/l9v0RE=;
        b=VS8RNBsBEZi198G4qqCNMSOAmGRBFgBE9Wt6laXocZEBhzBhtGPZLG0NAEZB9CIxz+
         gbTCKoRvleNHvStfzt3yiJa0UF8qFceWkN+wnr5G6ijPWg52kCMOk611Of4YmJwrTHEo
         7EqqdjiN4c/Z/QB5YvKkfvrRZFav7p+BYqIXg=
In-Reply-To: <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Am 23.06.2010 um 14:54 schrieb Jan Engelhardt:

> Do not start grepping in iptables -L.

There is also building iptables rules with a script and re-run that as 
an option.

> That is what iptables -S and iptables-save are much better suited for.

Perhaps the manual pages are out of date then.  There appears to be no 
mention of the option -S in the manual page for iptables v1.2.10 or on 
this web page:

	http://linux.die.net/man/8/iptables

% iptables -S
iptables v1.2.10: Unknown arg `-S'
Try `iptables -h' or 'iptables --help' for more information.

Where are you finding -S ?

Regards,
/Lars

