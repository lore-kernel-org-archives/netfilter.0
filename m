From: Philip Craig <philipc@snapgear.com>
Subject: Re: PPTP connection attempts fail with ip_nat_pptp loaded
Date: Wed, 02 Nov 2005 16:48:08 +1000
Message-ID: <43686128.9050003@snapgear.com>
References: <dk9kdc$k5j$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dk9kdc$k5j$1@sea.gmane.org>
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
To: Jordan Russell <jr-list-2005@quo.to>
Cc: netfilter@lists.netfilter.org

On 11/02/2005 03:55 PM, Jordan Russell wrote:
> On the Linux 2.6.14 box, here's what tethereal shows during the failed
> connection attempt (eth1 is the Internet-connected interface):

Is it possible to write these packets to a file so I can look at their
contents in more detail?

It would be useful if you could also capture a successful connection.

Your firewall rules look fine.  It should work by simply accepting
established connections.

