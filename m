From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: to patch, or not to patch? --- 1.2.7a mucked up?
Date: 28 Mar 2003 00:11:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048806713.30450.7.camel@tux.rsn.bth.se>
References: <1048778825.17439.7.camel@midgard.guardium.com>
	 <001301c2f481$67a1a300$0e0aa8c0@Nussele>
	 <1048802554.1342.17.camel@midgard.guardium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048802554.1342.17.camel@midgard.guardium.com>
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
To: Joe Judge <joe_judge@guardium.com>
Cc: Cedric Blancher <blancher@cartel-securite.fr>, Netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-03-27 at 23:02, Joe Judge wrote:
> Summary -- 
> 	Why does the recent patch-o-matic version have 
> 	extra/ROUTE code that uses "ifname" and "ipto" in
> 	a structure ... when ... iptables 1.2.7a tries to 
> 	compile ROUTE support which uses "if_name" and
> 	"if_index" ??
> 
> What version of iptables code goes with what version of
> patch-o-matic ?

Use iptables and p-o-m versions from cvs. instructions on how to get it
are availiable on http://netfilter.org

You might want to look in https://bugzilla.netfilter.org as well,
there's an entry there about this issue.

-- 
/Martin

