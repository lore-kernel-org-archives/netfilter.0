From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 08:19:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072185580.3572.350.camel@grendel>
References: <20031223114701.977.qmail@web60405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223114701.977.qmail@web60405.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-12-23 at 06:47, ads nat wrote:
> Hi,
> I am trying to setup IPTABLES rules. I am newbe to
> this.
> 
> One of the rule in filter table is 
> #######
> -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
> --log-prefix "New not syn:"

Try:
iptables -A INPUT -p tcp ! --tcp-flags SYN SYN -m state --state NEW -j
LOG --log-prefix " New not syn: "

Note the change in specifying flags from ipchains to iptables. Also note
I added spaces around your prefix. This will make it easier to read in
the logs.

HTH,
C



