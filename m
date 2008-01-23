From: "Francisco Morales" <francisco.morales.lopez.de.gamarra@gmail.com>
Subject: Howto capture first connection and redirect ???
Date: Thu, 24 Jan 2008 00:21:04 +0100
Message-ID: <59420160801231521n2f7d1459i9edf07c2d8c1a54a@mail.gmail.com>
References: <59420160801231515j3e5f71dao58d8a5f89c7114ec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=+07Jp2yBaDb+KPhGrI/o0pP0Gr9AhqmABLlZMhmn4Ck=;
        b=fSt199BEpobr6HR5Wkk1eWkGEUbVSWFUsB6u/zaiVSun2OZT8aig4IZIitIATA3TBxf7c4NleOBrKen98FNbSWWIH0Xlf4N2IUEYAWWhpRGTDfRskj4ibK61jnxO1yXq0nYHlLE9a5OLDLJb8mEDPpRaZc0I85W9ZuwHIhpvLIQ=
In-Reply-To: <59420160801231515j3e5f71dao58d8a5f89c7114ec@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I would like to know if does it possible to capture just the
first connection og one user with a iptables rule and redirect to a
specific ip/port address.

I have a intranet with a proxy machine with squid on debian for to out
to internet, and I would like that when I user connect for first time,
a iptable rule redirect it to a welcome page.... but just the first
time ..

Does it possible to do this with a iptable rule??

Thanks a lot
