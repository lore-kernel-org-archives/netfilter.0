From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Re: iptables REJECT NAT Internal -> External Portrange
Date: Wed, 27 Sep 2006 12:24:34 -0500
Message-ID: <451AB3D2.9050507@gmail.com>
References: <4F7EDC4D48D076428187517D1D77B017239AA5@mercury.int.sealevel.com>
Reply-To: nathaniel.d.hall@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4F7EDC4D48D076428187517D1D77B017239AA5@mercury.int.sealevel.com>
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
To: Ryan Belcher <Ryanb@sealevel.com>, netfilter@lists.netfilter.org

Ryan Belcher wrote:
> iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 10000:11000 -j REJECT --reject-with icmp-host-unreachable
> 
> The above command returns with "Invalid Argument".
> 
> If I simply replace "-j REJECT --reject-with icmp-host-unreachabel" with "-j DROP" iptables accepts it.

Did this come with a distribution or have you compiled it on your own?  I think I had a similar
problem with the iptables that came with Fedora Core because it didn't come with the REJECT module.

-- 
Nathaniel Hall, GSEC GCFW GCIA GCIH

