From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Fri, 12 Aug 2011 12:25:10 +0200
Message-ID: <4E44FF86.60904@gmx.de>
References: <4E44F1DC.3090605@gmx.de> <1313142433.3060.2.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313142433.3060.2.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hello
> I think you should use REDIRECT instead.
I don't know how to use it. Using it instead of OUTPUT does not work:

sudo iptables -A REDIRECT -t nat -p tcp -d 65.18.193.12 -j DNAT --to 
127.0.0.1:9999

How to use it?
