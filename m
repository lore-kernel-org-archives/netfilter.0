From: "Lennart A. Hansen" <lah@euclolland.dk>
Subject: Re: NAT with REDIRECT #$%@ up...
Date: Tue, 01 Feb 2005 16:52:34 +0100
Message-ID: <41FFA5C2.2070406@euclolland.dk>
References: <41FE2118.8020108@euclolland.dk>
	<1107264403.4330.11.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1107264403.4330.11.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> according to packet 6 in your capture, your proxy requires
> authentication.  you cannot combine authentication and transparent
> proxying; which will makes perfect sense if you think about it long
> enough.
>
> as far as the checksum errors go--do you have an IP bound to br0?
>

No its far more stupid then that, in a tired nightly hour I did set 
netmask 255.255.255.0 on br0 where it should be 255.0.0.0, when my 
client tryes to reach the proxy
 at port 3128 i HAS to go througt my gateway since it the only way thay 
can reach each other. Strangely enough thay can.

Natually it will generate errors when the bridge tryed to trick the 
client posing af the gateway.

Thanks anyway.

> PS - amongst my friends i have a mouth like a sailor, but i don't see
> how it's appropriate to set a subject line as you did, no matter how
> frustrated you may be.
>
Sorry about that, no fence meant by it...

I'am very happy with IPTables and respect those how contributed to it. 
Thanks guys.

-Lennart

