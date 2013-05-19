From: Alex Flex <aflexzor@gmail.com>
Subject: syncookies uses only 1 core. how to maximize cpu usage?
Date: Sat, 18 May 2013 22:45:14 -0600
Message-ID: <519858DA.2000307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=LYE4gk6dkkucrEaRDGQKM1OUCcc5S6QTG0rjVSz5txA=;
        b=nBXNFIl7HQlujUzTJfBcIpWM76tJUTSM6WLTMpRn586exKMyPgupkX1gGeE57f55rI
         n3RVY7eN8dCEc2qSNpHhp4wCn/cO/vzRMM2/E3Ye6zoVxA+KiL5rj8EoSUH86ZyQY2UH
         ZTYYC2uQLzMhbwlgVhY7qFdT4sk+BQFUAYj6XDHW482zMSPEC2Bgyz4li/nHhmuh5GTk
         A4BF3J+jUnRfZO4cuQdQ2nLa9AUi56NY8RUA2Vrvhl8YUTzmpcXzE6bri/JZfDOVYxHF
         aKbdiCERVnvyg8mcijuagZXGmgMyoyqszA0TE6wJM7DsseMsF/+fYRRUPczgKaFFn0wl
         vMvQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Netfilter,

I know this is not strictly a iptables question, though any orientation 
is useful.

Iam running some load tests against syn cookies. First I have made sure 
iam sending a PPS amount that my machine can handle with syn cookies 
turned off. The problem is that as soon as I turn on syn cookies i see 
that it utilizes one core at 100% and leaves the others unused. Also 
even logged in at console it starts lagging severely.

Is there anyway to make the kernel use more cores or better cpu 
consumption for this task or am I left for that the core can give me only?


Thanks guys

Alex
