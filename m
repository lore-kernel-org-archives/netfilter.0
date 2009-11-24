From: Mekabe Ramein <mrmrmrmr@gmail.com>
Subject: LED trigger in iptables
Date: Tue, 24 Nov 2009 23:59:59 +0200
Message-ID: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=/VKppA15dUr2v5eyQ7X2UsrGSKTQgcW0MG0taY/1t5Q=;
        b=STh+Q/x4h4I3fMXl2XZhbogv96REMWVqhcYcWN/GYtj9G8A35EYFR9bfy0t2Zm3eO4
         rgpsjV42HpyjRS4PoawBJHPGz6ywui2cJRc+dS9kLPkNHpYO8RrPUldtNmQ+wXh+Q3Ld
         oNOfefkWUgE+h294bYFXksfPkHb3vyM5Jk9pQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to use xt_LED module which is included in my kernel.
However, "iptables" does not accept the "--led-trigger-id" parameter
in the following command (which is an example given in module
description):

iptables -A OUTPUT -p udp --dport 5060 -j LED --led-trigger-id sip
--led-delay 100

My iptables version is 1.4.5 but it does not have the extension xt_LED in it.
So I searched for this and found a patch which adds this feature. But
I don't know where to apply the patch.
How can I make use of it ?

Should I include it in iptables source or another package ?

Thanks,
