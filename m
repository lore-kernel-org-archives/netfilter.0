From: Alex Flex <aflexzor@gmail.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 14:41:12 -0600
Message-ID: <51857268.3090204@gmail.com>
References: <51854232.1030306@gmail.com> <27F4C2E78FB64527A44CA6E3BC368315@gmail.com> <7668B4D1FBE84D73BC3BFBFCAFCBEC1F@gmail.com> <51855765.9020305@gmail.com> <417A64583B334DA0B8977D49C5A09DEE@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=6mWSUtrh7UqZv6S0rfH1jZj5rqKiJ6Y1a8W2F0Mn2/A=;
        b=WgJtSgOkxmorRAK6+28CAli83YYoUTW6OJsMDS9TjMW7KoV17J+4kHj/5mdMxmbleX
         OdNHxxI5oWVZBhhYcIOFjQ6537fMbbU1wSwSAvju8M3UHNVHrQfLBuLReg9Iz4UbP+7c
         Tz5QUjwCcKUvuNQ3x8uNP+E92Wn49bJDljOmcAiPuzhZzO7ZncCUAXkyPoikXOCWcOrV
         nNj3lHRmXDd01vyL1OrzjHt4vJOlLilhMpQ4vI9Iypb2m23rVau/9qgTxS5YObSbL+3N
         6qKovEewlPwdfvwUy/7yPQzcaij7TiirPDmRxV5iYrECUULOzZuebC/Mmiz4gfqUps7e
         eW5w==
In-Reply-To: <417A64583B334DA0B8977D49C5A09DEE@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payam Chychi <pchychi@gmail.com>, netfilter@vger.kernel.org

Payam,

I was only running port 80... and what I have hosted there is a reverse 
proxy with nginx. Could there be a chance that xtables compiled into the 
kernel be causing this? Even if iptables is disabled?

I have xtables even with geoip support... although it isnt being used at 
the moment during those attacks

Alex
