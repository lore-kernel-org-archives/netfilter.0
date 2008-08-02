From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: Re: Help me... please
Date: Sat, 2 Aug 2008 09:26:06 +0300
Message-ID: <38db14850808012326g4e3e35b6yc6f1c8b5adf69120@mail.gmail.com>
References: <K4XRO1$60B3DD52CED09AAF46CAA0DC13BE33CD@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=JO9Tlj1YWwM2zN0/hVW0T95rw6mW9+BdKRr83mp3x3U=;
        b=W52GoIWNyD325irIjg2PRDci+EUVBDJ4QiGCxnyvG7TpIJEkdJCwoqYmlSuVXEncVC
         CM6PQsOyY6xrUzg8E9BRv6qfSVyMi/Z/iivk+lD8L7lEYezHEOxzyvuT8HGOVyeGVcqT
         XEvXewTzwwqaxpoN4jL2Ut3qJH/4drxd/Z1fA=
In-Reply-To: <K4XRO1$60B3DD52CED09AAF46CAA0DC13BE33CD@libero.it>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi,

You should remove -m state --state NEW statements because they track
only START of connections.

2008/8/1, linuxmc@libero.it <linuxmc@libero.it>:
> echo "Rule 9 (global)"
> $IPTABLES -N RULE_9
> $IPTABLES -A INPUT -m mac --mac-source 00:1B:38:B1:9A:57 -m state --state NEW -j RULE_9
> $IPTABLES -A INPUT -m mac --mac-source 00:0E:A6:C1:4E:18 -m state --state NEW -j RULE_9
> $IPTABLES -A FORWARD -m mac --mac-source 00:1B:38:B1:9A:57 -m state --state NEW -j RULE_9
> $IPTABLES -A FORWARD -m mac --mac-source 00:0E:A6:C1:4E:18 -m state --state NEW -j RULE_9
> $IPTABLES -A RULE_9 -j LOG --log-level info --log-prefix "RULE 9 -- ACCEPT "
> $IPTABLES -A RULE_9 -j ACCEPT


-- 
Best regards
Anatoly Muliarski
