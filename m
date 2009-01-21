From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 13:22:04 -0800
Message-ID: <497791FC.5040301@mailinator.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>	 <4977522B.5030007@mailinator.com>	 <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com>	 <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>	 <49776B2A.4070005@mailinator.com> <c1ace6860901211233h7a978638g86e891e25991b4d4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c1ace6860901211233h7a978638g86e891e25991b4d4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

David J Craigon wrote:
> well whatever. Routing, schmoting. If I turn off IPTables, everything
> can see everything else fine.

The reason you need routing statements is because your /24 networks
can't see each other.

Put them on the SAME subnet or route them.  Easy, no?

ps: -1
