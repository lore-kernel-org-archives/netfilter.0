From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: bftables and scripts question
Date: Fri, 23 Dec 2022 18:30:02 -0800
Message-ID: <b928e785-3108-088f-905f-3228e742b165@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671849004;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=n/iBOaCHVdHT3FI9cmtqTSnCGWBjnimEhEjIJN0KmNY=;
        b=E0PYULO85Ss1/weKv/1XPpLldr+VCsaL+izQTHQNF+/mPmMV97T0QXuJKDpKYXu/
        GJ/a1MT+Ov3xmBcVhREwpIvkpsrc5E1jw0fY3QFxVMEm+eoErBVakDHvDQzrwzyP7lU
        28fxFHkPrdQ3Bgm/cWT2LKQBM3UiZEtOVOnMrsSY=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

I am currently using iptables but and starting the process
of learning nftables.

Question.  My iptables are in a bash programs (scripts).

For instance:

if [ "$enable_rdp" = "yes" ]; then
    # Warning: this user is given access to SYN's
    # rdp is M$ Terminal Services
    <lots of iptables>
    logger -p user.notice -t firewall "Firewall external rules warning: 
$ts_server (Terminal Server) accepts SYN's on Port $rdp_port"
fi

Will nftables work the same way?

And, will the converters also roll over the bash code?

Many thanks,
-T



-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Computers are like air conditioners.
They malfunction when you open windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
