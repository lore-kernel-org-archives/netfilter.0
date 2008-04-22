From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 15:16:04 -0500
Message-ID: <480E4784.3060905@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <alpine.LNX.1.10.0804222145350.13697@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804222145350.13697@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 14:48, Jan Engelhardt wrote:
> There is no problem with doing
> 
> ip a f dev lo
> ip a a 127.0.0.1/8 dev eth0

Ok.

> However, ping 127.0.0.2 will fail of course, yes it is a special 
> handling inside linux (but not really on the topic of "secure"), 
> code-wise it is just like 240.0.0.0/8 which was not routed a few 
> weeks ago until a patch changed it.

I had not considered any thing other than 127.0.0.1 as I don't use the 
other millions of addresses in the loopback network.

Are you saying that what I'm calling a ""security feature is really a 
misconception and a side effect of other parts of the kernel?

Further, can you give some back history on the 240/8 network or point me 
in a direction to do some reading?



Grant. . . .
