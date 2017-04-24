From: Fatih USTA <fatihusta86@gmail.com>
Subject: Is it possible to use ipset match in conntrack module?
Date: Mon, 24 Apr 2017 19:28:58 +0300
Message-ID: <ec584a61-c362-23fa-7d77-0e7d254c5d56@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=VBmtibSbPeVz011pEofjyXLmicpR1JftLSgDBcMs19s=;
        b=NHbwGZ/fdTLofXeUgiQudZPHKiSyoP9XIldTvhYbYE83N4u4Y+syotmj7WJfstoO3T
         4hXmvEmNrOq2ei88m/9uq0WEdeDi++T+lTorgClddzNLY0EaZHGmkenGwVgyqnZt9zkG
         dPGw8yv8LK4BrIfT+N7V+33W1m9axzXJSOuSDTveZeljhCbk2NehAk/3HOaZrHYwB6/N
         8wvNH57c6jJMKGlJf8WkaYK8lnNFm2IvwluRukoqV/YK2qjwBTVNVGK+x6maAKVa3LId
         ObSivds+agj9ZjQSt7xKxpOBAA7RrN8icXNqBHzMqXPiKTQBvEMaU7Q53i11k/T6fbXZ
         JyhA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list

I need ipset match for this options in conntrack module.

is it posible?

[!] --ctorigsrc address[/mask]
[!] --ctorigdst address[/mask]
[!] --ctreplsrc address[/mask]
[!] --ctrepldst address[/mask]
[!] --ctorigsrcport port[:port]
[!] --ctorigdstport port[:port]
[!] --ctreplsrcport port[:port]
[!] --ctrepldstport port[:port]


Regards.
Thanks.

-- 
Fatih USTA

