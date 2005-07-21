From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 15:53:21 +0200
Message-ID: <42DFA8D1.207@mnemon.de>
References: <65aa6af905072021501603cfd5@mail.gmail.com>	<42DF85AE.1000400@gmx.co.uk>	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Jozsef Kadlecsik schrieb:
> On Thu, 21 Jul 2005, Jan Engelhardt wrote:
> 
> 
>>>local process -> routing -> OUTPUT chain -> routing -> POSTROUTING chain
>>>
>>>No problem with policy routing for the locally generated traffic.
>>
>>This sounds like a total overhead calculating the route twice.
> 
> 
> The first one is required to fill out output device for the packet. The
> second one is there to give chance to play with routing in OUTPUT.

Still only 95% clear to me. You say, the second routing decision takes
place right after filter/OUTPUT ? And if so, do packets after
filter/FORWARD have this second routing decision too ?

Have a nice time,

Joerg



