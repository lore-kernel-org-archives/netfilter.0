From: Bastian Bittorf <bittorf@bluebottle.com>
Subject: Re: What mean rules with no target?
Date: Tue, 29 Sep 2015 12:00:02 +0200
Message-ID: <20150929100001.GN22537@medion.lan>
References: <560A4A3B.2030307@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bluebottle.com; s=fe0;
	t=1443521048; bh=KLiU5vKj/Vmi8HsfUL46/y+29y2n3zbz0lPJh+IJkLU=;
	l=139; h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjJxnu7hYHMsMTf2HP7bUUtKoBqoX+9v9dEKcmOHOOlGWVTGCQQbexMBerGWIUdLK
	 qpaYX28BpwAMiGXnWh5y8yoQkBgZs8e1nAk1ZzYxhclrAuGPtbUMi1XFIpe52rfjOJ
	 INoIePt7DoQGRKgcm1Vgg7FfC0d5m0Z2MmnxZk0Y=
Content-Disposition: inline
In-Reply-To: <560A4A3B.2030307@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f0rhum <f0rhum@free.fr>
Cc: netfilter@vger.kernel.org

* f0rhum <f0rhum@free.fr> [29.09.2015 11:58]:
> I have rules in my firewall with no targets. What is this?

A counter.

bye, bastian
