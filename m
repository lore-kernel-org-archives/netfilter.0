From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Logging SNAT
Date: Mon, 3 Oct 2005 14:32:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031428290.24889@filer.marasystems.com>
References: <20051003060103.GA26729@awa.mat.agh.edu.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051003060103.GA26729@awa.mat.agh.edu.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pawel Oleksik <oleksik@awa.mat.agh.edu.pl>
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Pawel Oleksik wrote:

> I wonder if it is possible to log a SNAT activity in case when a translation
> is done from a network  into a range of addresses.
>
> <timestamp> <localnet address> uses external connection as <external IP>
> ....
> <timestamp> <localnet address> releases <external IP>

Some of this is provided by the newly released conntrack tool.

http://www.netfilter.org/news.html#2005-09-24

Regards
Henrik

