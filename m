From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: ARP Proxy
Date: Mon, 31 Jan 2005 16:05:02 +0200
Message-ID: <3063e505013106055a0be747@mail.gmail.com>
References: <41FE3A31.4080708@uplink-verein.ch>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41FE3A31.4080708@uplink-verein.ch>
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
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter@lists.netfilter.org

why bridge when it can be .. router? or you can use a central switch
that can do vlans (with so many client there should be enough funds
for a 2950 catalyst :) .


On Mon, 31 Jan 2005 15:01:21 +0100, Moritz Gartenmeister
<moritz@uplink-verein.ch> wrote:
> hi
> 
> i'm not sure, if am right here, so if i am wrong, pleas point me to a source ;-)
> 
> how can i reduce arp-broadcasts without routing?
> 
> i have physically 2 subnets (500 and 300 clients), logically this is one subnet. my premature/naive
> idea is, to install a linux-bridge and put arp-proxy on it. as long as the proxy has the correct
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

