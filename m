From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Fri, 28 May 2004 14:01:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405281401.33941.Antony@Soft-Solutions.co.uk>
References: <20040527193451.05B99DBD@sterenborg.info> <11f101c444aa$05bb5a30$49caa8c0@caris.priv>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <11f101c444aa$05bb5a30$49caa8c0@caris.priv>
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
To: netfilter@lists.netfilter.org

On Friday 28 May 2004 12:50 pm, Peter Marshall wrote:

> I guess my question was is it advisable to only allow active ftp .... ?  Or
> is that just not a reasonable idea ?  Or does the Related option make
> passive "safe" (ie, don't have to open a load of ports).

I'd say passive is just as secure as active, and vice versa.

> I already had to open just about everything outgoing from my proxy server
> anyway, so I guess it is not a big deal ... *unless you have a better
> suggestion for that as well.

There's a big difference between opening up *outbound* ports from a proxy 
server (where you can use the proxy server to decide what's safe and what 
isn't), and allowing lots of traffic *through* your firewall.

Whether the proxy is running on the same machine as netfilter or not, you're 
either placing rules in the OUTPUT chain (if it is), or you're specifying the 
source IP with -s (if it isn't).   Either way, you're not allowing any 
greater access to any system other than the proxy, and of course you trust 
that, or you wouldn't be using it :)

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


