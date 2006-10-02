From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: DNAT problem
Date: Mon, 02 Oct 2006 10:25:01 +0200
Message-ID: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>
References: <20061002080013.GB23849@woyzeck>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061002080013.GB23849@woyzeck>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stefan.friedel@iwr.uni-heidelberg.de
Cc: netfilter@lists.netfilter.org

Stefan Friedel wrote:

>Good Morning,

>iptables on the server is v1.2.11, Debian sarge, 2.6.17.3

upgrade to iptables 1.3.6

>Any hint? Did I miss some changes in the behavior of netfilter/iptables?

Man page (from iptables 1.3.6) states:

In Kernels up to 2.6.10 you can add several --to-destination options.
For those kernels, if you specify more than one destination address,
either via an address range or multiple --to-destination options, a
simple round-robin (one after another in cycle)  load  balancing
takes place between these addresses.  Later Kernels (>= 2.6.11-rc1)
don't have the ability to NAT to multiple ranges anymore.

Maybe the SAME target extension will help you.



