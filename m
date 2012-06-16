From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Re: Iptables Drop rule - strange behaviour
Date: Sat, 16 Jun 2012 13:20:27 +0530
Message-ID: <CACJKonp5yY9Gt8s+9Zc4wXHhbGdamJF257OhbV4hktSA5E3V1w@mail.gmail.com>
References: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com>
	<CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=+CXlykVV7zJN8O9zKBS9llmPBmNjmk6JFsRh7mAmzcM=;
        b=RsdjZFTIMGVjURwRYIVmPGepKrRsFeQp63/gbJxQOeyZ+qhZgxPElNEKbf3Xgngqn3
         ZzTMW+Nu9rbXUKwssmADlz6OdbviXg57M2TXNo3WevKDA5QGmPfEGB+o5ADoZTu0ZJyD
         S3GYCGmaEIqGPG82oilDeZKsPy3/Hx3Uo3w/58U3tyS72s0metQS3AqWOCHCSc1LqnpN
         M8w5ELq+kGo87d+qypvJDoyfusIeyxRiXoC+1vf5aCYeSuyo2wQyz2eAJlCQ5/nSfYow
         vHnMOJIXTr6EaacUAwQ2IyVgAvyaxIaMZg23wY36F1ZzSpTtdlI2v9Fb5eIOlXha4CPI
         +lvQ==
In-Reply-To: <CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

> This is not correct syntax but should illustrate the pieces needed for the
> single rule you want:
> -A FORWARD -i eth0 \
>          -source range 172.31.114.1-172.31.114.254 \
>           -dest range 10.2.2.1-10.2.2.254 \
>          -protocol tcp \
>             -destport 22 \
>             -m state --state NEW \
>           -j DROP


Thanks Neal. Appreciate your response. I understand and tried your
rule as well but the problem remains the same.

May be i havent given full details. Let me try once more.

I have currently power PC compiled both linux 2.6.35 for PPC along
with iptables v 1.4.9.1. As mentioned in the original mail, problem
persist. What is strange is i could see only the counter increasing
for iptables drop only once. No matter how many ssh packets i try to
sent , the DROP counter for the rule doesnt increase but the packet is
drop.

In order to debug i even tried to add a rule to allow ftp before
dropping the ssh rule. As again if i do send the ssh packet firs
followed by ftp packets, ftp packets are still dropped. I donot see
any counter increasing at all. This continues to happen untill i
insert some random rule in the forward table, followed by sending ftp
packets it is allowed. But send ssh packets and followed by ftp, both
are dropped.

Any information will be much appreciated.

thanks and regards
sreejith
