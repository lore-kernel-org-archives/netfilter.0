From: SamLT <sam@sltosis.org>
Subject: question about TPROXY, --on-port and the fact it doesn't alter the
 packet header in any way
Date: Fri, 13 Jul 2012 14:59:12 +0200
Message-ID: <20120713125911.GC9043@tosh.sltosis.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1342184354; bh=xwIu1dKDKDdamHCSWt9cSqzUGc3oHEr3z7ZNjUCT+8U=;
	h=Date:From:To:Subject:From;
	b=PZXsSrNn6jc+lUeMAkFhSXFrCqi/FOYII8cLfIUcrLS1jK+LPQnyPq2nrrY/F5380
	 98BffkeQwv3mFZo8pxsQYExRLwEY0SKmgQMDIz2vDZ4lIIdUm5YhXOJJAyxFb58EE3
	 6PpeVZCLbMjsWLb0P7aS/+c2PsjYnRnoWnHzXDbQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



Hello,

I've been playing with TPROXY with squid3, and it's working fine so far,
but there is one thing (at least!) i do not understand:

if I use it with, e.g., --on-port 3129, for packet matching 'tcp dport
80', it then ends up in the INPUT chain, but still on tcp dport 80 (*)

squid3 is listening on tcp port 3129, so how does it get there?


Thanks in advance!

sam

(*) -> paquet header ot modified, and this is confirmed with the TRACE
'jump'

