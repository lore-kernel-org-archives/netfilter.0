From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: forwarding on the same NIC
Date: Mon, 10 May 2004 16:55:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405101655.17314.Alistair@nerdnet.ca>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>
Content-Disposition: inline
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

On May 10, 2004 03:36 pm, alucard@kanux.com wrote:
> es -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 8080 -j ACCEPT


	Your forward rule should be for port 80.

	The port on the packet by the time it hits forward is 80 not 8080
	you might want to add the 'destination' ip address to this rule as well.

	Alistair.

	

