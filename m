From: Tom Diehl <tdiehl@rogueind.com>
Subject: Re: curious about fwbuilder and iptables
Date: Fri, 28 Mar 2003 20:35:38 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303282032570.28617-100000@tigger.rogueind.com>
References: <Pine.LNX.4.44.0303281344460.17152-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0303281344460.17152-100000@dell>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Fri, 28 Mar 2003, Robert P. J. Day wrote:

> 
>   i'm taking a crack at configuring my iptables rules
> with the latest version of fwbuilder -- i finally got
> it installed after having to track down a couple of
> essential libs.
> 
>   as i read the docs, once i install the base fwbuilder
> program, i have to also install a policy compiler based
> on the actual firewall software i'm using -- iptables,
> ipfwadm, etc.  otherwise, the docs suggest, when i start
> fwbuilder, i should get an error.
> 
>   well, i haven't installed any policy compiler yet, but
> i can certainly invoke fwbuilder just fine.    (haven't done
> anything yet, but it does start properly.)
> 
>   can anyone who's done this already clarify what i should
> need to do here, while i dig deeper into the docs?

IIRC you can run fwbuilder just fine without the pol compiler.
The problem is all you get is an xml file. In order to use it
you need the complier to generate the actual iptables or whatever
rules. Basically you generate the xml file and then run the pol
compiler to generate a script that has the iptables rules in it.

HTH,

-- 
.............Tom	"Nothing would please me more than being able to 
tdiehl@rogueind.com	hire ten programmers and deluge the hobby market 
			with good software." -- Bill Gates 1976

   			We are still waiting ....


