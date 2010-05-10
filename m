From: Andrew Beverley <andy@andybev.com>
Subject: Ingress shaping MARKed traffic using IFB
Date: Mon, 10 May 2010 07:23:35 +0100
Message-ID: <1273472615.1507.38.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1273472627; bh=/ifbCiLOrMaqk71VMapAQNG04PX9I7Go5TghF
	HPBcqs=; h=Subject:From:To:Content-Type:Date:Message-ID:
	 Mime-Version:Content-Transfer-Encoding; b=d1AtukcM+uSktJgDR8MZMPXx
	GXcWhtzUpEmXKiytC3vw3bOb4P9IDmCYlaD6s327etcOt5Mn2lRKBvBGlfEL/brorjb
	cs1yMuTczoFGSq0PpvrQZkminFtsWEBPYKdXOuXqsKdrEPKYTjuliU9fWobR/7s1rdo
	Xna0mlLO08w4w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

I would like to perform ingress shaping (using HTB) on packets that have
been MARKed in the filter table. Am I correct in saying that the only
way of accomplishing this is to use IMQ?

I would prefer to use a vanilla kernel (which excludes IMQ), but I think
the only potential solution (IFB) will only do that sort of ingress
shaping /before/ any iptables chains?

Thanks,

Andy


