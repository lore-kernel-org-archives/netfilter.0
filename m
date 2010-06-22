From: Florian Effenberger <floeff@gmail.com>
Subject: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 20:16:34 +0200
Message-ID: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:content-type
         :content-transfer-encoding:subject:date:message-id:to:mime-version
         :x-mailer;
        bh=hu9uRuDZEBCHhKc6h4k8ZeoawHrwtSu59gPneKVav1I=;
        b=vT6SAqmBcOKFEqfNrd+nX1/D/GxhfQbll4mrGAcgrcmjHItBK1V+zF0Js+F0LgeD4e
         xzkD+x7pkyyYd5ZXWljv9kGufxldSWE6d4GelkJGRoBHHrgjJjG7UrfJlcaCAzlNVJKD
         PUPCRHu8iTTi6PCk8cTtRzu+7f0kz3PPmPpTA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

my default network policy is to block all outgoing traffic and only allow certain packets to pass. For some users, I'd like to open up Google Mail (imap.gmail.com:993 and smtp.gmail.com:587). However, Google's DNS give randomly out different IPs per query. Sadly, they are not all located within a subnet, but vary in all parts of the address.

If I want to have destination host based rules, how can I do this with iptables? My current idea is to run a cron job every few minutes to add the rules again with the changed IPs, but this sounds like an ugly workaround, and will clutter my user-defined chain heavily.

Is there any other approach, other than opening up all traffic to 993 and 587?

Thanks,
Florian