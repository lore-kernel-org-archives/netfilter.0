From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables 0.9.3, sets with concatentation
Date: Fri, 20 Mar 2020 12:46:11 -0400
Message-ID: <ae6abdfc-8479-29ae-c411-ecca532d864f@fhmtech.com>
References: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
 <4220067c-41e2-d3e2-fc78-8ac0fb909911@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject; bh=eM0ZbjpkLLTPcZF9oQXi9CPl8v+zGsr7+qNsNycp5ew=;
        b=kVwCsRBgpdxkSA4kUTBL2YuM4ogAHlkLr1JVZ04IVzq1fz2in5gLR09lTf93NXEV5wUvHOhK/W6fVJmBHFBfn1C9nj+LGdS9DAGxOetTssBDc7yppgXxML/yyety7XhnJ7cmKsW746eFcDv375tSgy1juAZ4+awViN736mNT2QQ=;
In-Reply-To: <4220067c-41e2-d3e2-fc78-8ac0fb909911@fhmtech.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefan Hartmann <stefanh@hafenthal.de>, "netfilter.org" <netfilter@vger.kernel.org>

On 2020/03/20 12:41, Frank Myhr wrote:

> set s4_MISC-SERVICES {
>            type ipv4_addr . inet_proto . inet_service
>            elements = { $IP4_IF2 . udp . 69, $IP4_IF2 . tcp . 23 ]

Argh! Use a curly brace at the end rather than square bracket, 
obviously. ;-p


> meta l4proto {tcp, udp} \
>      ip daddr . meta l4proto . th dport @s4_MISC-SERVICES   accept
> 
> 
> Or, you may well want to handle ipv4 addresses in a separate set:
> 
> set s4_MISC-SERV2 {
>      type inet_proto . inet_service
>            elements = { udp . 69, tcp . 23 ]

Same here.


> set ip_allowed {
>      type ipv4_addr
>      elements = { $IP4_IF2 }

Add missing end brace }.


Sorry for the typos!

-F
