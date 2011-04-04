From: Brian G <unixman83@gmail.com>
Subject: Transparent proxy with IPv6 on Linux [REDIRECT target is gone]
Date: Mon, 04 Apr 2011 00:13:05 -0500
Message-ID: <4D995361.9030301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=Q/tNcInbuOBUENljrK3rfT6gUum33yxI7dqLRY05xqw=;
        b=iPNbI3PhltmTZgNcJOF9PNOAxsRQRWwvVg+aiQyJjhdCo4A4CxeC44334osmCf8Zev
         hV6wTvdrpEpdTC18zSxZPg1F++0//OVCodKh8TaKuVRJoYrpMqU0k+pLx5Rs2Ryq+TJj
         EnfjLru1G+L9TkDc3HMaCBhJ/n2rMoz5Hfffo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, on Linux with netfilter: previously I could do "iptables -j 
REDIRECT" to create a IPv4 transparent proxy. However, this is 
unsupported on IPv6.

How can I achieve this? iptables6 removed the REDIRECT target because it 
does not support Network Address Translation in IPv6.

I need the transparent proxy to work with IPv6 under Linux. How are 
people doing this?

- Brian
