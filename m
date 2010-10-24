From: Andrew Beverley <andy@andybev.com>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Sun, 24 Oct 2010 15:46:23 +0100
Message-ID: <1287931583.1758.2.camel@andybev>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
	 <1287873234.1700.330.camel@andybev>  <4CC4411D.4070701@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1287931606; bh=GZOEPze88Wrb/mCPB9RgxFgVrvWCHa8icpeAm
	E4t0Ik=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=QE1zNVwu
	6jBAb2KVwSl51/3BwrLvZL9X0aXWfkqH/da9Eb+JeR0ipe6CD/kCOk2zkw3+UqDbYPc
	lRtRkWAH+O+MPtgswK/vqplWAjXxyaS6oKVcHjZ/oBNIwy6eChcEkbfuH+fjrsnCGCw
	ZYU6jVLrsNzABlxdTPs8/KPn7cpT8=
In-Reply-To: <4CC4411D.4070701@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> > 
> > Set your default policy to drop:
> > 
> > iptables -t mangle -P FORWARD DROP
> > 
> > Then set up a rule for each client that matches both IP address and MAC:
> > 
> > iptables -t mangle -A FORWARD -s 1.2.3.4 \
> > 	-m mac --mac-source aa:aa:aa:aa:aa:aa -j ACCEPT
> 
> The 'mangle' table is not intended for filtering. The 'filter' table is.

Ooops, I meant filter. Been using the mangle table too much recently :)

Andy


