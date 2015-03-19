From: Martin T <m4rtntns@gmail.com>
Subject: Ho to use rateest module?
Date: Thu, 19 Mar 2015 19:00:26 +0200
Message-ID: <CAJx5YvGdOSwb9qpdxs5vemChzqzu78mgk57tsAcVGqSjCMNRdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=JIdGayjpavs7CWcwLQ9AeMOMdw5E9n4+g2DvSzeZ1vI=;
        b=BbzVJbtNYLhazovzfj7q84iGwDOK4+piblXoq0Gw6bfn6Y3/6eQ6wiSSuQ7a77CYTs
         bDpW3XwlVQR/Vc/zX24VTy/GNkTkTRNXeKS8eAnMnKOehDGLoMk3BI6AYXi6HoZ5iEco
         ailV621jDPvxv9f/tnnmiliBSML1LRJ2YcOGUZq4QZbo3B8VG+1HeHOqQQvQmoq+CpZi
         eCFsr6GYmcZe61vF31ocY9XdSi91X3x8yj3R6pltgdwaaiu/8rypUaT3nNvpqZVnFn1z
         pEskqfknuOjMu7TCfDpYL0DHLYo8hbjP3/2qfL5ENCL9tPVaVZautZ5Ptb41IkkBDy6A
         ziHw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I need to log a log message if ingress bandwidth on interface is
higher than 3Mbps. I tried to use rateest module with command
"iptables -A INPUT -m rateest --rateest RE1 --rateest-gt --rateest-bps
3Mbps -j LOG --log-prefix "Bandwidth was >3Mbps"", but this returned
"iptables: No chain/target/match by that name.". However, if I first
pass all the traffic to RATEEST target with "iptables -A INPUT -j
RATEEST --rateest-name RE1 --rateest-interval 250.0ms
--rateest-ewmalog 500.0ms" and then execute "iptables -A INPUT -m
rateest --rateest RE1 --rateest-gt --rateest-bps 3Mbps -j LOG
--log-prefix "Bandwidth was >3Mbps"", then the command is accepted.
Why is the RATEEST target needed in the first place?


thanks,
Martin
