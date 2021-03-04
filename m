From: Daniele Orlandi <daniele@orlandi.com>
Subject: Re: Matching l3mdev output interface in snat
Date: Fri, 5 Mar 2021 00:37:25 +0100
Message-ID: <ba3e81df-51cd-1847-267b-524cdd5603ae@orlandi.com>
References: <d40b2ce6-fa4e-bf6b-ad11-a1af984f7023@orlandi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d40b2ce6-fa4e-bf6b-ad11-a1af984f7023@orlandi.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


I must correct myself: the forwarded traffic does match as expected.

What isn't matching are the locally generated ICMP echo requests.

Regards,

-- 
Daniele Orlandi
