Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECFB220F37
	for <netfilter@vger.kernel.org>; Mon,  6 Oct 2025 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745598; cv=none; b=QDk1xT9KmX5FAxFVrgin4Pr+ip5D4YhYDkVhHzsWEvcuqPKkLKW+ZrvLYybgjHi7/PuEILt/1ZVKoMQWa6SK5LgmUKsWle14MO2A+J5O8yn2uygNuvio//o6ljQcDXv9w2KoLpAzah9b6e1lvo93MNWU7Gu8ZTH370LMV5dbsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745598; c=relaxed/simple;
	bh=nAOA6VO8lqUz9TKX8NRYvp0eBAB+ajJk1ZNC3waN8vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIop18ZtOR0GeJlfSUaS2J746zlTqIcqqz3RPRpj6U0zmkNJpPo7Y4d8mZn+Imq6m+PSabixCd3WL4eoQR/0huIh6QeuF9HQ3zjNU0uFV8tJclOo2cvUB/U3JKzHm1EjdjDZ0GkBnB6WQXKpKqHDvT65uyI2XhjkRQZi9xT1DMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=tdRxRCaD; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=D23zv4rx; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="tdRxRCaD";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="D23zv4rx"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 77E486026D; Mon,  6 Oct 2025 12:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759745010;
	bh=Qy9J7cRuYjVhYCtz11tS8y3Z1YejZZ/HHISEP2x5ag0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdRxRCaDUtEvwL0lbEkAGl0++UevgF2Jv0n/J7JDD9DdLYdiVT/oClhdQmuxtAl+o
	 Fb7t9nV6i1/e0ijmUTOkYbHOK3BAcgZolidkeA3YzaBvdE0TAvJ8AiSvre30V+8Da+
	 lfTBFxWesGnNozoBP2Ij6oGrdf4o4ouAzeRr32Y0ll5IOXjwOyMeSha0VM2Gkm4h4G
	 9hPatlPVGGbVTdflB8t7Aub6JRktuOlZZ8GdW0EFd8Shs+P2H8kO+wFJGnA0FlED2z
	 U6biZ+lrfPLRkhRekEixM6Y8Wu7YH8EKm56R/hbtdaS6ew/7nBW8lIsTJ2BajqKNsa
	 BySFZEXhZ7k7w==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 86C0E60265;
	Mon,  6 Oct 2025 12:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759745009;
	bh=Qy9J7cRuYjVhYCtz11tS8y3Z1YejZZ/HHISEP2x5ag0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D23zv4rxKlhQT1N+RXKEXsEcS4bEYoAODugwwE59TcuqDNw6P+gcFJyrv1lfXbTXx
	 1832C9WqQ1tYv9NeUOXHSp6xT+CF2bY15DPwb3MnG7fIPWBTLMxCXD4s5aguTSPt4+
	 V839UpdTW+oS8vYmkJr0tO7NUruQIWnbvaESB/YRYpAmuvdxfIE2WVCXVD+/V3y0ua
	 lNmwxxZQE7mU9+a72VHdJksHcu1/HxzMwxoU/1VapCzf1qeq53BPiuJJICh9txB/Dm
	 O4Vsvo2ntruBV6uv2Fj4WrcTEyEZzW868D79P2qmK1F9v9GEvRFL/xUpxQLkVLSJcb
	 adjubf3WJh4xg==
Date: Mon, 6 Oct 2025 12:03:27 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	Netfilter mailing list <netfilter@vger.kernel.org>
Subject: Re: nft for bridge.
Message-ID: <aOOT7y0sfm74XGdg@calendula>
References: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
 <aKM2sOMlivuUJHOJ@calendula>
 <CAGZFCEHxw0VkH0JJYjxNHevJ69BMZQ9zbhT=YbYS6ti2j8DAwg@mail.gmail.com>
 <aOJaY6oQnYPTcVAn@strlen.de>
 <CAGZFCEEdS7wjCs7S5_pESdMqsMqVezcMS_qmr=mVoKs_PQfNNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGZFCEEdS7wjCs7S5_pESdMqsMqVezcMS_qmr=mVoKs_PQfNNg@mail.gmail.com>

On Sun, Oct 05, 2025 at 05:56:06PM +0530, ratheesh kannoth wrote:
> On Sun, Oct 5, 2025 at 5:15 PM Florian Westphal <fw@strlen.de> wrote:
> > You will need to figure that out yourself.  Most of us a volunteers.
> Ok.
> 
> >
> > > MY nft version : nftables v1.1.5 (Commodore Bullmoose #6)
> > > My kernel :   kernel 6.6
> > >
> > > ADD cookie=18446462603462596360 (00:00:00:00:00:00,
> > > 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> > > TCP
> > > ADD cookie=18446462603462596360 (00:00:00:00:00:00,
> > > 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> > > TCP
> >
> > I don't even know where these messages come from.
> Sorry.  THis is a debug print added  in my function  xxxx() to print
> flow tuple information.
> .ndo_setup_tc()

This is hardware offload trace.

What are you trying to do there?


>      |
>      |
> case TC_SETUP_FT:
>    return flow_block_cb_setup_simple(type_data,
>                                                   &my_cb_list,
>                                                   my_setup_ft_block_ingress_cb,
>                                                   priv, priv, true);
>               |
>               |
>               |
>  my_setup_ft_block_ingress_cb()  {
>     struct flow_cls_offload *cls = type_data;
>     switch (cls->command) {
>            case FLOW_CLS_REPLACE:
>                 return xxxx(nic, cls);
> }
>      |
>      |
>      |
> xxxx() {
>   // parsing flow here
>  if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
>                 struct flow_match_eth_addrs match;
>                     /// debug prints are here to print MAC address
>                 flow_rule_match_eth_addrs(rule, &match);
>    }
>      if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
>                 struct flow_match_ipv4_addrs match;
>                   // debug prints are here to print IP address.
>                 flow_rule_match_ipv4_addrs(rule, &match);
>     }
> 
> }
