From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with 'random' module (v1.2.11)
Date: Mon, 17 Jan 2005 17:31:26 -0500
Message-ID: <1106001080.5904.0.camel@hubcap.ljm.dom>
References: <20050116202241.GB22482@clamas.udsu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050116202241.GB22482@clamas.udsu.ru>
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

On Sun, 2005-01-16 at 15:22, Denis Tatarskikh wrote:
> Hi all.
> I've just discouraged by following message:
> iptables -A FORWARD --match random --average 60 -j LOG
> iptables: No chain/target/match by that name
> 
> I'm using iptables 1.2.11 under Debian/testing with stock Debian
> kernel(2.4.27). Could anybody explain why that error show up?
> 
> Thanking you in anticipation.

you didn't compile the random match into your kernel.

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
	--The Simpsons


