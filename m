From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 10:06:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072191976.2184.355.camel@grendel>
References: <20031223133703.24761.qmail@web60409.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223133703.24761.qmail@web60409.mail.yahoo.com>
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

On Tue, 2003-12-23 at 08:37, ads nat wrote:
> I modified rules as follows :
> 
> ###########
> -A INPUT -p tcp ! --tcp-flags SYN SYN -m state --state
> NEW -j LOG --log-prefix " New not syn: "

<snip>

> Applying iptables firewall rules: iptables-restore
> v1.2.6a: Unknown arg `--tcp-flags'

Well this could be your problem. Try upgrading to 1.2.8 or later. Could
be the option is not supported in older version, especially as an
inverse. 

To isolate whether its your script or a version issue, try running the
iptables command straight from the command line and see if you get the
same error.

HTH,
C



