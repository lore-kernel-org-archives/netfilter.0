From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: Re: nftables 0.9.3, sets with concatentation
Date: Sat, 21 Mar 2020 11:17:16 +0100
Message-ID: <3c04f9dd-85a1-7bc8-0b8d-72a5afb24a5c@hafenthal.de>
References: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <10a01f25-84fa-fa19-c10f-7c530ef9f10c@hafenthal.de>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter.org" <netfilter@vger.kernel.org>

Thank you Florian and Frank for your suggestions. Yes, I found it now 
also in the man page under "RAW PAYLOAD EXPRESSION".

I tested step for step:

ip daddr $IP4_IF2 meta l4proto {udp, tcp} @th,16,16 {69, 23} accept		

ip daddr $IP4_IF2 meta l4proto . @th,16,16 {udp . 69, tcp . 23} accept

ip daddr $IP4_IF2 meta l4proto . @th,16,16 @CONCATENATED_SET_3 accept

and verified with netcat - it is functional in this way.


Could there be issues with conntrack, nat, etc with this approach?
I will test it in the next days.

Firstly I will start with separate UDP and TCP service groups.


Nb. I use separate ipv4 and ipv6 tables, because they are really 
different protocols. In my experience the mixing leads often to 
overlooked security flaws - I am working as pentester occasionally.
