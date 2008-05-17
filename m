From: "howard chen" <howachen@gmail.com>
Subject: Handling large list of rules - Efficient or not?
Date: Sat, 17 May 2008 22:28:13 +0800
Message-ID: <b66ddc900805170728h34511bb7r9be1324034745748@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=RjSngny/XeSNn5sPKQsmvF0jUzZUpq06AICS1+UVH9g=;
        b=a+nux0Abcd6165y3LYncszezJEzYCCIrkgHMS5wOwCCSSxnbsfoB8+sYZVZM042IPbyrtluWG98xr6JgYv0yg90q+RETUIsvKU6OXS+gywVMetbJJJols8ugzKLLN5nZ/+i2Ch3ADNSPBTwRVrhcq8mDpvwcM0VYwhpSBXv5a/o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

My server sometimes is under attack by DDOS, so I want to make a
simple script which read the log (Apache access log), do the analysis,
and set the rule to drop the packets from a specific IP.

Since it is DDOS, so I assume there will be large ammount of unique IP
needed to be input into the iptables.

I want to know, are there any hidden efficiency problem in this setup?
Or any better method?


Howard.
