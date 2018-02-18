From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Sun, 18 Feb 2018 15:10:16 +1100
Message-ID: <20180218041016.GA3584@dimstar.local.net>
References: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
 <20180207003251.GA2621@dimstar.local.net>
 <20180207192632.6h2xczcmnpgai4yk@salvia>
 <20180208041415.96bade9856ee027fbab56fd5@bluenox07.de>
 <20180218040051.GA2428@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180218040051.GA2428@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

TYPO ALERT!!

>  - Put *nft list ruleset* as the last line of the script. This will ...

Should be:

>  - Put *list ruleset* as the last line of the script. This will ...

(no nft cmds inside a script).

Cheers ... Duncan.
