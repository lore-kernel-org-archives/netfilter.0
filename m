From: rodolphe <rodolphe.averty@oxance.com>
Subject: Re: two router connected to the internet
Date: Tue, 31 May 2005 16:15:22 +0200
Message-ID: <429C717A.70801@oxance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

i try

ip route add default scope global nexthop via 10.0.2.200 weight 2 \
nexthop via 10.0.2.254  weight 1

and it seems to work

thank you very much Jan for help






