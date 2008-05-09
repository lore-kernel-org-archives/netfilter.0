From: "Andrea Ranieri" <andreran@uno.it>
Subject: Re: DNAT routing problem
Date: Fri, 9 May 2008 12:48:23 +0200
Message-ID: <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=GIfKkp/VuuXWspQARXK5E3OJxxPf9NYmSQQsAH994DM=;
        b=jNGWlmCfeX4kCu6IShSdgI26XneCDiS5fqNRaaplCCbA5kUCWpjSVYfoWy0rEVbSyVBeK6Oi6B5THcofak1MxVDpWVnzm3s44AHKm//rHhmlivmrSmx/5wM1VwC1AHjJXerr5VdGVsmPMuAkdigHGeGDPlgp2n3o+whLfEqtnWE=
In-Reply-To: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 5/8/08, Grant Taylor wrote:

> NAT rules are applied to the first packet in a connection and then the
> same action is auto-magically applied to all other packets in the
> connection with out passing them through the NAT table.
>
> So what you are seeing is probably very likely based on existing verses
> new connections.

Thanks for your reply, but it seems I didn't explain my problem clearly.
I have a connectionless flow of ipv4 packets. No TCP, UDP or any L4
payload at all.
So my question now is: does netfilter (with D/SNAT or NETMAP target)
provide basic natting features without having a L4 payload, or a
connection oriented flow is required for natting?

Thanks again
Andrea
