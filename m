From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables and ads
Date: Mon, 11 Aug 2003 11:54:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811155444.GA11900@cannon.eng.us.uu.net>
References: <200308111738.35713.woksy@ether.net1.nerim.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200308111738.35713.woksy@ether.net1.nerim.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: woksy@ether.net1.nerim.net
Cc: netfilter@lists.netfilter.org

On Mon, Aug 11, 2003 at 05:38:35PM +0200, woksy@ether.net1.nerim.net wrote:

> Hi people ! ;-)

Hi :-)


> I was just answering myself if i could stop ads loading from web pages such as 
> yahoo, lycos, & co ? (i don't mean blocking popup, just stopping those boring 
> ads from loading)

I think when you enter any application domain you'll better be off with
some solution at that (application) level. Use a transparant proxy and
block the communication there.

> I tried to do this with something like that:
> $IPTABLES -A INPUT -i $EXTIF -s 216.73.92.112/32 -j drop-and-log-it

Well, the line above by itself is  not incorrect but:

0) what doesn't work?
1) what does drop-and-log-it do.
2) why do you kill the communication in INPUT? Not in OUTPUT?
3) Most of the ad stuff have a big DNS pool for the servers. I don't
   think your /32 catches them all.

Ramin

> but it seems that I mistaked.
> Can anybody help me please ? 
> Thanks
> 

