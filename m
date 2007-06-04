From: "Ric Messier" <kilroy@WasHere.COM>
Subject: RE: syn DDoS attack solution
Date: Mon, 4 Jun 2007 08:22:05 -0600
Message-ID: <00f101c7a6b3$bac44450$304cccf0$@COM>
References: <465EF582.4070904@bgs.hu>
	<015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>	<465FEA82.709@bgs.hu>
	<007101c7a45d$bc50e380$34f2aa80$@COM>	<46603D22.4020608@bgs.hu>
	<Pine.LNX.4.64.0706021446290.18235@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0706021446290.18235@darkstar.sysinfo.com>
Content-Language: en-us
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
To: "'R. DuFresne'" <dufresne@sysinfo.com>, 'Bgs' <bgs@bgs.hu>
Cc: netfilter@lists.netfilter.org


R. DuFresne writes:
> There have been and will continue to be some
> rather decently funded companies with some fairly decent pipes wiped
> out
> of business or their internet presence closed up due to some of these
> kinds of attacks over extended periods of time.  Goverments across the
> globe have had internet services disrupted for extended periods.
> Microsoft has had to relocate servers to new net/ip addresses to divert
> the flow from such attacks and stay somewhat online...
> 

I won't even tell you what we ended up having to do to get the first large,
commercial DDoS targets back online (Stacheldraht, anyone). The great thing
about DoS attacks is that they tend to be self-propagating. In order to get
them to go away, you generally end up doing things that kills legitimate
connections. Just a casualty of war. Either that or you ride them out.
Invariably, you have to go upstream to get help in stopping them if they are
worth noticing.

Ric



