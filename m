From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT with REDIRECT #$%@ up...
Date: Tue, 01 Feb 2005 08:26:43 -0500
Message-ID: <1107264403.4330.11.camel@hubcap.ljm.dom>
References: <41FE2118.8020108@euclolland.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <41FE2118.8020108@euclolland.dk>
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

On Mon, 2005-01-31 at 07:14, Lennart A. Hansen wrote:
> Hey ppl..
> 
> I have of cause searched before posting, but havent found anything 
> simmilar..
> 
> Short story is that i want to redirect proxy request to host1:9001 to 
> host2:3128, host2 is a bridge i'm on eth1 and host1 is on eth0
> 
> My intenstion is to catch all request to host1:9001 and redirect them to 
> host2:3128.
> 
> iptables command:
> iptables -t nat -A PREROUTING -i br0 -p tcp --dport 8080 -j REDIRECT 
> --to-port 3128
> 
> This worked at first, but stopped working just like that..
> 
> I have sniffed on it, and attached it here.. 12kb Ethercap format
> 
> It looks really fucked up, check sum error and so on...
> 
> Anyone have any idea why it's fucking up?

according to packet 6 in your capture, your proxy requires
authentication.  you cannot combine authentication and transparent
proxying; which will makes perfect sense if you think about it long
enough.

as far as the checksum errors go--do you have an IP bound to br0?

-j

PS - amongst my friends i have a mouth like a sailor, but i don't see
how it's appropriate to set a subject line as you did, no matter how
frustrated you may be.

--
"I've added an extra ingredient just for you.  The merciless peppers
 of Quetzlzacatenango!  Grown deep in the jungle primeval by the
 inmates of a Guatemalan insane asylum."
	--The Simpsons


