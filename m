From: Jun Sun <jsun@junsun.net>
Subject: Re: Any holes in this firewall script?
Date: Wed, 4 Jun 2003 08:15:01 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030604081501.A3411@gateway.junsun.net>
References: <20030603180849.B2402@gateway.junsun.net> <1054702862.2273.6.camel@india> <20030603220551.A2672@gateway.junsun.net> <1054705385.3434.0.camel@india>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1054705385.3434.0.camel@india>; from dharmu@nsecure.net on Wed, Jun 04, 2003 at 11:12:37AM +0530
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
Content-Transfer-Encoding: 7bit
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

On Wed, Jun 04, 2003 at 11:12:37AM +0530, Dharmendra.T wrote:
> Yes, but after that you are allowing everything from all the
> interfaces.  Which is not recommended to do so.
>

Eh?  Which rules allow everything from all interfaces?

I have the following, which only allow all packets with the right
IP address range from internal interface and lo:

$IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT

Jun

