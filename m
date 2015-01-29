From: Oleg <lego12239@yandex.ru>
Subject: nft & notrack
Date: Fri, 30 Jan 2015 00:01:32 +0300
Message-ID: <20150129210132.GA21938@localhost>
Reply-To: Oleg <lego12239@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1422565393;
	bh=JEmvUTRaWIUMnhilEklqT1+6amSWVkKNJ4iSDktKKd8=;
	h=Date:From:To:Subject:Message-ID:Reply-To:MIME-Version:
	 Content-Type:Content-Disposition:User-Agent;
	b=jJKguAzipyraFQJhn3su1PpUGTqQsUJgMS8jdZqKJpzyTqnD9Vx2Ry44dmSSCqBnR
	 cLEknRJEa9dlNbi0ndtvPG+6ffu5Dj8eG36P3lDtil/h/ggJ39rQZnWZb7tzIA5R61
	 EzJ8rj0O+Xs3D2e5na10zzJtrJflxL3AqdS5nCMg=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

  Hi, list.

Is anybody known how to replace the next iptables rule with nft:

iptables -t raw -A PREROUTING -i eth0 -j CT --notrack

-- 
Nemanov Oleg
