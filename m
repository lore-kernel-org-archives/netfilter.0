From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: FORWARD rules
Date: Fri, 12 Sep 2003 15:39:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912100957.GA3360@linux.local>
References: <20030910175253.GA2752@linux.local> <1063260568.26703.1.camel@risingsun.penguindia.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1063260568.26703.1.camel@risingsun.penguindia.com>
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
To: "Vishwanatn T. K." <tkvishy@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Thu, Sep 11, 2003 at 06:09:29AM +0000, Vishwanatn T. K. wrote:
> > $IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j ACCEPT
> > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > 
> > What more do I add to allow natting as well as a secure FORWARD policy?
> > Is the position of ESTABLISHED rule ok?
> > 
> 
> You need to add NEW state in the above FORWARD rule for this to work.
> 
> $IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Just confirming this from all. Please check whether this is ok.


$IPTABLES -I PREROUTING -t nat -p tcp -d 202.x.x.x -j DNAT --to 125.125.125.2

$IPTABLES -A INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p udp -m tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -s 125.125.125.0/32 -p tcp -m tcp --dport 110 -j ACCEPT

echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -P FORWARD ACCEPT
		     ^^^^^^
$IPTABLES -A INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Can I now change the ACCEPT statement to DROP without any fear?
Thanks a lot in advance and bye.
With warm regards,
-Payal


-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

