From: Toby <tobia.conforto@linux.it>
Subject: Re: Altering a packet's port
Date: Tue, 22 Mar 2005 19:29:52 +0100
Message-ID: <20050322182952.GB5763@ikkoku.ath.cx>
References: <002201c52e7e$4fe76950$6500a8c0@DEFIANT>
	<1111490995.4267.18.camel@hubcap.ljm.dom>
	<01a401c52eed$67fd5670$bf07a8c0@civicXp>
	<Pine.LNX.4.60.0503220959020.6816@darkstar.sysinfo.com>
	<Pine.LNX.4.60.0503221011390.6816@darkstar.sysinfo.com>
	<01f501c52ef1$f0400290$bf07a8c0@civicXp>
	<20050322181835.GA5763@ikkoku.ath.cx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050322181835.GA5763@ikkoku.ath.cx>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Nicolas Ross wrote:
> In my nat table I have:
> 
> -A PREROUTING -s 192.168.7.0/24 -d e.f.g.h -p tcp --dport 22 \
> -j DNAT --to-destination e.f.g.h:8022

Wait, maybe I missed something.

Are you sure e.f.g.h and e.f.g.h:8022 are the same IP address in the
rule above?  Also is e.f.g.h in the 192.168.7.0/24 network?
Is e.f.g.h the router itself?


Toby

