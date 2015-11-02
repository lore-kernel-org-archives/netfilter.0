From: Steve Horsley <steve.horsley@gmail.com>
Subject: Re: nftables segv while trying to use nat redirection with map
Date: Mon, 2 Nov 2015 23:27:29 +0000
Message-ID: <5637F161.3090308@gmail.com>
References: <56239149.2010805@gmail.com> <20151018180053.GA1826@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=m89GS6FBQU+by7toh258KpPgYpAnhy+ddGjfF8ExQts=;
        b=OHOKPyVnz/mizKxHoLWP7biAQXwUH3nTHauxeUfU/VU+buTWR+yTyCVcFIDF5IctZK
         4qGKpuxzY4uMFXmkiKwweQzEX5+I5tONzom+5cJLhT/8LucGd2nseBuEwX+b5/5Grgao
         m2BRujABbkO48kBlRCaKRtE5Hakzmv3HV3SLTobpAIHhwzBJbB0G4tnMDuFZYSZhzoNf
         REGodzqcB6oWczepIrvWW6XY+GX68/CtFQlLhT8CSWFXpVxK2ogDInOiNKv+0GdKjuyV
         eflIt4D7slqqhVqWX/HaTNOuA76y0ojEHRZI8P7oj4Nk2aEI4dudyrb71a6f51iKN/wt
         Wscw==
In-Reply-To: <20151018180053.GA1826@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Sorry for the delay in answering.

I installed the development version of Ubuntu 16.10 with proposed 
updates. With this version, nft -v reports version 0.5. My original set 
of commands now works without crashing, so thanks for the advice to try 
version 0.5.

However, this set of commands still fails:

# nft flush ruleset
# nft add table nat
# nft add chain nat output { type nat hook output priority 0 \; }
# nft add map nat outnat {type ipv4_addr : ipv4_addr\; }
# nft add element nat outnat { 172.16.1.1 : 8.8.8.8 , 172.16.1.2 : 8.8.4.4 }
# nft add rule ip nat output dnat ip daddr map @outnat
<cmdline>:1:1-48: Error: Could not process rule: Invalid argument
add rule ip nat output dnat ip daddr map @outnat
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It looks as though I have a syntax error in the command, but I can't 
find a good example to use as a template. Do I have the syntax wrong, or 
is using a separate set like this not possible?

Thanks,
Steve.
