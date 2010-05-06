From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: AH and ESP nat-ing
Date: Thu, 6 May 2010 19:38:42 +0530
Message-ID: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=agCSUisC2IqRCqV5yI65IsaxgQaPJP+STjbO2Gjt+vs=;
        b=rJxP0A61AVq0q5/VOjaARuaK87KSIyAcIi4snBROID0wKNtgJA0YsIMrMQr6zYr1GP
         oRQPgc8ujoK/nxgGX/IpGf1dW4tjZOUbi1rGrix1VFwHRu4j4AKOlLRt0Y7C8DC5jNQe
         Duk7+sEYqyx/2r5YNoDYIZOWWLu6jpCj7ZHHg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

I googled and found that  AH protocol pkt cannot be NATed  , And ESP
protocol pkt  NATing wont work in  some use cases .

Is this problem is solved in newer kernels ?
Is there any ALG for nating this packets  ?

Thanks,
Ratheesh
