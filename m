From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Re: Traffic shaping with nftables maps and tc
Date: Fri, 03 Nov 2017 01:07:35 +0100
Message-ID: <392d67152072ea965fd56fbe6efefab7@spoje.net>
References: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509667662;
        bh=wLwXqgK+W5YRVwjZM0zsoViGoNDxGS+lUi3QwnZUAaI=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=GgAXF2/3+1HkTPs7bKoV57JmLebGwDY1j4IAANzeCA713/+0b+/9ZHG9sMKuxdVn1
         jHl5U2xarCXRaKVpkKe84ndnsl2OMKop3ZPB27ekxRyKiFsQqoRjZH3JFNJTsRRE60
         NA18dE6LjOwar7hnsmLlMNB93XkzNEiUTbmpa41Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509667655;
        bh=wLwXqgK+W5YRVwjZM0zsoViGoNDxGS+lUi3QwnZUAaI=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=Kon3XGc9hGGuFVoepkoQ+wfSCBkQ5J57uRITWbr09eFnwTKzB5canmD2/5P+HNyKD
         asQF+QK0r20ZbRWCizU+Kc3TmOWizpGzwmCfqlJMfUun2PPvbgn2LMQuKKLKTKMhcs
         z5itgmmEcPR3tDL8BuU0cpkFu+DP8NU9T+RC2HTQ=
In-Reply-To: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I've been doing some online research and done several experiments:

1.) This seems to load properly, but i have not checked if it sets the 
classid correctly:

table ip filter {
	chain input {
		type filter hook input priority 0; policy accept;
		meta priority set 1:3065
	}
}

however this is not really usefull as it does not do any real hashing / 
maping, so i can't just use it for lots of rules. So i tried to adapt it 
to use maps or dictionaries:

=======================================================

2.) This does not load:


table ip filter {
	map prometheus {
		type ipv4_addr : classid
		elements = {
			10.11.171.247 : "0001:4095",
			10.11.171.248 : "0001:3065",
			10.11.171.249 : "0001:2023"
		}
	}
}


test2.nft:3:34-40: Error: syntax error, unexpected classid, expecting 
string or dscp or ecn or mark
		type ipv4_addr : classid
                                  ^^^^^^^
test2.nft:2:13-22: Error: map definition does not specify key data type
	map prometheus {
             ^^^^^^^^^^

=======================================================

3.) This also does not load:

table ip filter {
	map prometheus {
		type ipv4_addr : verdict
		elements = {
			10.11.171.247 : meta priority set "0001:4095",
			10.11.171.248 : meta priority set "0001:3065",
			10.11.171.249 : meta priority set "0001:2023"
		}
	}
}



test2.nft:5:41-44: Error: syntax error, unexpected meta
			10.11.171.247 : meta priority set "0001:4095",
                                         ^^^^
test2.nft:6:25-37: Error: syntax error, unexpected string
			10.11.171.248 : meta priority set "0001:3065",
                         ^^^^^^^^^^^^^
test2.nft:7:25-37: Error: syntax error, unexpected string
			10.11.171.249 : meta priority set "0001:2023"
                         ^^^^^^^^^^^^^
test2.nft:10:1-1: Error: syntax error, unexpected '}'
}
^




It seems to me that maps are not generic enough to work with relatively 
new "meta priority set" feature.

Do you have any suggestions how to make this work?


-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
