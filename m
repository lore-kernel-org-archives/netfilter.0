From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: udp/tcp port range rules for forward/input chains
Date: Wed, 15 Oct 2003 02:27:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066199232.20310.4.camel@alpha.newkirk.us>
References: <1066187418.14600.28.camel@tarkus>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066187418.14600.28.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-14 at 23:10, Ted Kaczmarek wrote:
> Digging around the only thing I found was a patch-o-matic that allowed
> for doing a range of 15 ports.
> 
> I see many references with dnat and snat, but nothing besides the patch
> for input or forward chains.
> 
> If anyone has a link that or info that can steer me in the right
> direction the beers are on me at the Javits Center Linux show.
> 
> Thanks,
> Ted

Do you mean something like specifying tpc port 135 through 139 in a
single rule?

iptables -A INPUT -i $EXTIF -p tcp --dport 135:139 -j DROP

If you mean non-contiguous ports, you're looking at multiport:

iptables -A INPUT -p tcp -m mulitport --dport 21,25,80,110,143,443 -j
ACCEPT

Multiport is limited to 15 ports per rule.

j



