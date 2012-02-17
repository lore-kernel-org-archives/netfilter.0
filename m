From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 07:22:10 +0000
Message-ID: <1329463330.30413.1.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop>
	 <1329415217.2595.3.camel@kushiel.sterenborg.info>
	 <1329417223.18690.471.camel@andrew-desktop>
	 <20120217102230.1b35b535@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120217102230.1b35b535@shiva.selfip.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329463337;
	bh=/srbLG+KrV5C50egP6mMw8oTPwjQlveQ3CvKHR6m7pE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=gspKUr0h2IcvHGa7RyePCv4U7Ivu5YwDhYoGZ3K+HimpXpcGeHKvEA3RCRkVL8Kbx
	 u7kyWkg4F/FLBZE237hlB6/GQ9R4KNax7nP9YossRQhZsQ6n6zQbESZJ3iANwmDusQ
	 2bTMMyVMZ8zDZMwq4w0OEF10rH2ZYMqB/ehf8CJ0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: "Rob Sterenborg (Lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

On Fri, 2012-02-17 at 10:22 +0530, J. Bakshi wrote:
> So within an office environment what should be the value of connlimit for clients ?
> The clients must be allowed to open multiple websites to do their development work.
> What is the value which still allow to do their jobs and still block torrent ?

You keep the port number above 1024, as per the details on the website.

Please note: I don't use this to *block* torrents, just traffic shape
them accordingly. It's generally not recommended to block, because
people will just find other ways around it.

Andy


