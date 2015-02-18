From: Oleg <lego12239@yandex.ru>
Subject: nft & notrack
Date: Wed, 18 Feb 2015 19:52:16 +0300
Message-ID: <20150218165216.GA7432@localhost>
Reply-To: Oleg <lego12239@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1424278424;
	bh=8liTSmDcPXmaYxjhLXR5XIbngaJI+sxml29y9PggZNo=;
	h=Date:From:To:Subject:Message-ID:Reply-To:MIME-Version:
	 Content-Type:Content-Disposition:User-Agent;
	b=tbao+koSXKp35Ypt5ku6eJYk6drMFVaiL2EgghAFmIIJ3DW37TLx9vdgOlKmuZCnN
	 8d7HCNwEzdcFlYpyA9XB0M0AVoaUakt5iXgytTmvcn5YsX9tIK7e9CUQT+Qzq49t+n
	 bjVr9ExSPAcEEVHTy7e6NGDmXP0NjGchESQLOyo8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

  Hi, all.

Is anybody known how to replace the next iptables rule with nft:

iptables -t raw -A PREROUTING -i eth0 -j CT --notrack

Is this possible with nft or not?

Thanks.

-- 
Nemanov Oleg
