From: "saspan" <saspan@web.de>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 19:54:02 +0100
Message-ID: <009001c73bfb$301c7570$0700a8c0@stormbook>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
	<Pine.LNX.4.61.0701191946210.18606@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

> So configure squid to actually act transparent. 

That's what I did, doesn't work though.

>Or better, reject the traffic and make everyone actively 
>use the proxy. It does not have as  many caching caveats 
>as transparent.

You mean by configuring the users' browsers to use
localhost:3128 and deny any other destination?

That is a quite good idea but it doesn't really solve the problem.

Regards,
Sascha


