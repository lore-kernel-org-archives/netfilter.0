From: "Andy Van Hoof" <andy.van.hoof@pandora.be>
Subject: RE: ARP Proxy
Date: Mon, 31 Jan 2005 22:06:58 +0100
Message-ID: <20050131210535.93E3B19818A@europa.telenet-ops.be>
References: <3063e505013106055a0be747@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e505013106055a0be747@mail.gmail.com>
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

You shouldn't do this.

A better way would bet to split the subnet into 2 subnets and use a router.

Why would you want to keep all those clients in 1 subnet? If it's because of
netbios, use wins/dns? That's gonna lower your broadcasting quite a bit on
its own.

Andy
-----Oorspronkelijk bericht-----
Van: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] Namens George Alexandru
Dragoi
Verzonden: maandag 31 januari 2005 15:05
Aan: Moritz Gartenmeister
CC: netfilter@lists.netfilter.org
Onderwerp: Re: ARP Proxy

why bridge when it can be .. router? or you can use a central switch
that can do vlans (with so many client there should be enough funds
for a 2950 catalyst :) .


On Mon, 31 Jan 2005 15:01:21 +0100, Moritz Gartenmeister
<moritz@uplink-verein.ch> wrote:
> hi
> 
> i'm not sure, if am right here, so if i am wrong, pleas point me to a
source ;-)
> 
> how can i reduce arp-broadcasts without routing?
> 
> i have physically 2 subnets (500 and 300 clients), logically this is one
subnet. my premature/naive
> idea is, to install a linux-bridge and put arp-proxy on it. as long as the
proxy has the correct
> entry, broadcasts are not propagated. this will reduce arp-broadcasts.
> 
> i know, i have to bend alot of principles, but will it work?
> 
> cheers
> moritz
> 
> 


-- 
Bla bla





