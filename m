From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: How to block sending mail from local network.
Date: Sun, 8 Feb 2004 22:40:23 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDOEEKFIAA.mark@npsl.co.uk>
References: <4024C335.7080705@ergolight-sw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4024C335.7080705@ergolight-sw.com>
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
To: netfilter@lists.netfilter.org

> I tried a command:
> $IPTABLES -A OUTPUT -p TCP -i $LAN_IFACE -s $LAN_IP_RANGE --dport smtp
> -j DROP
> but it did nothing.
You want the FORWARD chain.  INPUT/OUPUT only apply to the linux box itself.
See the HOWTOs for more information.


