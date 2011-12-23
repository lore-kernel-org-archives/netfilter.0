From: Andrew Beverley <andy@andybev.com>
Subject: Re: Stop logging mac address
Date: Fri, 23 Dec 2011 22:24:56 +0000
Message-ID: <1324679096.27185.0.camel@steve-pc>
References: <CA+Ry9rfuavxLjSMitb8KF51+s0o2WtBZssTig52jHKpmBzgg0w@mail.gmail.com>
	 <CA+Ry9rdUbjcssirTbtpw_SkcPwp87g8EF_fLREbQQ4cAfJcOjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1324679090;
	bh=h2hIdeZEQZOCeiasLyMF2Onc5Vhn0ac/DNk57Gcz+60=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=oL9XvpTje5xDPojHLnAHorIumdWog4G6Ph96Dmvcgye1YVhC3cj7BAIxN+e161/dK
	 i4PVqnTphDJqYqzVO8GdskxBjpn4pCbsMDI9fNfCwHjX6AulXuHOFUkeYvV4t9sz8/
	 M1UjjqzEPZEE/kZOf+K76JoDB8BLRkC9ivhF3vvM=
In-Reply-To: <CA+Ry9rdUbjcssirTbtpw_SkcPwp87g8EF_fLREbQQ4cAfJcOjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Jensen <jjensen@unyalli.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-12-23 at 14:09 -0700, Jeff Jensen wrote:
> Is there any way to stop netfilter from logging mac addresses?
> 

Possible a bit of an over-kill, but you could maybe use the ULOG target
instead?

Andy


