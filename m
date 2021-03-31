From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nft show counter
Date: Wed, 31 Mar 2021 17:23:19 -0400
Message-ID: <2f7dbb13-29cf-e737-991a-3828028dd3f3@fhmtech.com>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=bdY7QS7IdqJWhN4/rKXvdbp1sPz2qLaQWEYVuVUC6VA=;
        b=frzqP1USVWf4xjn3VggnEKP5TKb1sYf43vD+90UVLew4QBTCRQYWexyQE8FuPhzbcevmF4d5CywxMyGt7xg0pDpBm6kJegxzR6R2H6ouvEAaxzbH89REmxHIUxdtdCYejLyukz7USZBKo5SNR6vFLjvWUbPu/Z7v5DqGiPX8Xg0=;
In-Reply-To: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Wunderlich <frank-w@public-files.de>, netfilter@vger.kernel.org

On 2021/03/31 13:47, Frank Wunderlich wrote:
> Hi,
> 
> i want to read counters defined in nftables, but have not found a solid way to do this
> 
> nft list table ip filter
> 
> shows me the rules from specific table with all chains, rules and counters, e.g.
> 
> 	chain voip1 {
> 		counter packets 3226 bytes 780864 accept
> 	}
> 
> 	chain voip2 {
> 		counter packets 1640 bytes 119449 accept
> 	}
> 
> this needs to be parsed with grep/sed/awk, so maybe there is an easier way to read the counters. found nothing in manpage or google, so i just ask here. maybe there is a way to show the last x min traffic. i need this to check if connections is "alive"
> 
> regards Frank

Hi Frank,

Just some quick ideas:

Using nft JSON output could work better for parsing:
https://wiki.nftables.org/wiki-nftables/index.php/Output_text_modifiers

You could use nftables from within a Python program to do your monitoring:
https://wiki.nftables.org/wiki-nftables/index.php/Scripting#Using_nftables_from_Python

If you don't care about actual values of packets/bytes but only that 
packets are matching certain rules at a minimum rate, you could use a 
log statement, perhaps with a limit, to log to syslog or userspace nflog 
and monitor the appropriate log file(s).
https://wiki.nftables.org/wiki-nftables/index.php/Logging_traffic
https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings

Best Wishes,
Frank
