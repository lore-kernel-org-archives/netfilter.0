From: List Support <list@tootai.net>
Subject: Detecting socks5 frames on server side
Date: Thu, 28 Sep 2023 18:35:33 +0200
Message-ID: <1a260552-0b2e-4732-87c3-ce2bd75ff827@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1695918933; bh=tCzveesXCPy8EVPRNjnw72MBHhLgjC0eXq4IT8OSMLQ=;
        h=Date:To:From:Subject:From;
        b=deElL9//5GasqUAtZh4d3/9nIxLLtXS++/N+u3IEp9S8j1b9/ezEcZJYVhFToNxyU
         VUPoJS2ho+OEcoYsyL8pkbgNLgPhR7FLD9pEf1yZ/GWWdAykJg5nEBTFSrtYV3+tTa
         YBqnHppMvI0PQHOSNv6+1SiFK0T9UQagNLILpXJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1695918933; bh=tCzveesXCPy8EVPRNjnw72MBHhLgjC0eXq4IT8OSMLQ=;
        h=Date:To:From:Subject:From;
        b=deElL9//5GasqUAtZh4d3/9nIxLLtXS++/N+u3IEp9S8j1b9/ezEcZJYVhFToNxyU
         VUPoJS2ho+OEcoYsyL8pkbgNLgPhR7FLD9pEf1yZ/GWWdAykJg5nEBTFSrtYV3+tTa
         YBqnHppMvI0PQHOSNv6+1SiFK0T9UQagNLILpXJ4=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hello,

ist it possible on *socks server side* to identify frames coming using 
socks5 ?

Set up is

, WorkStation browser set to socks5 localhost:1080 =>
. ssh DynamicForward *:1080 to server =>
. server with multiple ipv6 IPs and nftables will
output to 80/443/8080 to Internet

Idea being to snat ipv6 addr depending on visited host or source Workstation

Thanks for any hint
-- 
Daniel
