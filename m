From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: ip6tables equivalent of "-m statistic --mode nth --every 2 -j SNAT"?
Date: Wed, 18 May 2011 20:13:02 +0200
Message-ID: <4DD40C2E.8030205@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=xrlAdoaOTpaUwgA8sOb60i
	EpjWk=; b=8ocXFIXNaVqGJLlUBdsTyrAAOCcSOvZH4jHoT6VO2/tQJihnPMzg1A
	AlK0iwHU9sY4yNGx7N0k06uqrnOpt3704j/EX+FkH9dPbE1Ph3MxsvVdQFIDS7Mk
	1p2pMnW4EAo8LMGnKKTOean62upBZr+XceTiZuhSIExvrKcN2cNWc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm having hard time trying to figure out how to rewrite the following iptables rules into ip6tables:

iptables -t nat -I POSTROUTING -m state --state NEW -p tcp --dport 80 -o eth0 -m statistic --mode nth --every 2 -j SNAT --to-source 10.1.1.1
iptables -t nat -I POSTROUTING -m state --state NEW -p tcp --dport 80 -o eth0 -m statistic --mode nth --every 2 -j SNAT --to-source 10.1.1.2


Since there is no nat in IPv6, is it at all possible with ip6tables? 


-- 
Tomasz Chmielewski
http://wpkg.org
