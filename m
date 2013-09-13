From: Alexis Salinas <alexis.salinas@inmotiontechnology.com>
Subject: RE: clarification on the use of --state parameter within  conntrack
 command
Date: Fri, 13 Sep 2013 19:27:57 +0000
Message-ID: <FC9EDC96CA021943AB23AE4C96151F620DC589@van-mail14-n4.exchange.electric.net>
References: <FC9EDC96CA021943AB23AE4C96151F620DC4D5@van-mail14-n4.exchange.electric.net>
	,<20130913174546.GA903@linuxace.com>
	 <FC9EDC96CA021943AB23AE4C96151F620DC517@van-mail14-n4.exchange.electric.net>,<1379096540.16443.33.camel@bigboy.gregfolkert.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1379096540.16443.33.camel@bigboy.gregfolkert.net>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


"Isn't that kind of the point of UDP? Wouldn't that be breaking it?"

Perhaps to clarify, I would like to be able to filter by the UNREPLIED flag, when I list or delete entries from the table. That's why I was exploring the --state filter, but that only seems to work for TCP. I think using the UNREPLIED flag is a better option as it is displayed for UDP, TCP, and ICMP.

Cheers,  
Alexis.


