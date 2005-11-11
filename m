From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: Re: DNAT query
Date: Fri, 11 Nov 2005 06:42:57 -0500
Message-ID: <20051111114257.GB22915@tranquility.scriptkitchen.com>
References: <20051111103020.GB18203@tranquility.scriptkitchen.com>
	<52863.193.173.147.3.1131705979.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <52863.193.173.147.3.1131705979.squirrel@webmail.sterenborg.info>
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

On Fri, Nov 11, 2005 at 11:46:19AM +0100, Rob Sterenborg wrote:
> iptables -t nat -I PREROUTING -d dyn.example.com -p tcp --dport 8000 \
>   -j DNAT --to-destination 192.168.10.2:8000

This does work (sorry I should have mentioned it before). But I also 
need the OUTPUT rule too, right?

With warm regards,
-Payal


