From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 10:47:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402161047.18866.Antony@Soft-Solutions.co.uk>
References: <005801c3f475$91a645d0$2d64a8c0@pcjka> <1076927162.2333.6.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076927162.2333.6.camel@raylinux.internal>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

On Monday 16 February 2004 10:26 am, Ray Leach wrote:

> The 'filter' table does not exist by default, but the 'FILTER' table
> does. Is this a user chain than you created?

I think you're getting confused here about the difference between chains and 
tables.

Chains are normally named in uppercase; standard ones are INPUT, OUTPUT, 
PREROUTING, POSTROUTING, FORWARD.   User-defined chains can of course be 
added.

Tables are normally named in lowercase; standard ones are filter, nat, mangle.   
Adding a user-defined table is quite a significant programming task, and not 
to be assumed in a reasonably standard configuration of netfilter :)

The 'filter' table should exist in any healthy netfilter install.

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


