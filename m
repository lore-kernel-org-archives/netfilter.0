From: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>
Subject: Re: turning off iptables processing for bridged packets
Date: Sun, 27 Feb 2011 18:21:22 +0300
Message-ID: <905511298820082@web29.yandex.ru>
References: <DD1D3360D73274A4C51A9FAB@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1298820083; bh=k7jk33sj4n7e+3Ip4ECCDcZm6SXMvxSSkk8sHLQnSWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:MIME-Version:Message-Id:
	 Date:Content-Transfer-Encoding:Content-Type;
	b=QzuKnHKZ97TrPuJfFNRlZr60BqU4CrsJrCb6CSiBjtn8PJXhJYrRlLKYJ4IV08RhS
	 zzhkFU9kuWPjKqRKrOB4mLyIZm5r3pimJNq82MxNxNogFZk8VYEHJvL+U4M7vL8jdl
	 KvV23CVdi54APkrkqiNy3eMv7jI4NNYMBXv2MxCA=
In-Reply-To: <DD1D3360D73274A4C51A9FAB@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org



27.02.2011, 18:04, "Alex Bligh" <alex@alex.org.uk>:
> By default netfilter appears to apply iptables rules (specifically the
> FORWARD chain) to bridged packets. Is there a way to turn this off
> (i.e. only apply the FORWARD chain to routed packets, not bridged
> ones)? I seem to remember there is, but I can't for the life of
> me find the configuration setting.

net.bridge.bridge-nf-call-iptables = 0

-- 
wbr, Oleg.
