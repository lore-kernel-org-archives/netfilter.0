From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
	rules
Date: Sun, 12 Oct 2003 11:10:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065971435.1278.108.camel@alpha.newkirk.us>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	 <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lucassen.org, netfilter@lists.netfilter.org

On Sat, 2003-10-11 at 12:26, Cedric Blancher wrote:

> I agree.
> To me, theses two rulesets are equivalent for HTTP packets, but first
> one implies one more rule evaluation than the second one for ESTABLISHED
> packets that are destined to TCP/80.
> 
> PS : there's no RELATED packets in HTTP ;)

Not precisely true - there are ICMP messages that may arrive in response
to HTTP requests that are RELATED.

j


