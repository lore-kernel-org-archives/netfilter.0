From: Jason Opperisano <opie@817west.com>
Subject: Re: IP Forwading from Local IP to Live IP
Date: Tue, 19 Apr 2005 07:42:26 -0400
Message-ID: <20050419114226.GA19155@bender.817west.com>
References: <1079365863.2163.8.camel@vejan>
	<200403151608.12073.Antony@Soft-Solutions.co.uk>
	<002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
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

On Tue, Apr 19, 2005 at 03:55:18PM +0800, elg3ne wrote:
> Hi guys, Im new to iptables.. hope someone can help me to this.
> 
> The situation is this, I have a webserver running on a local network machine
> (192.168.1.3) & I want it to be accessible outside my network. Is it
> possible?
> 
> setup is like this:
> 
> workstation (192.168.1.3) ---> HUB ---> server ( LIVE IP, accessible
> everywhere on the net )
> 
> when user access the live IP ex. 10.0.0.3 can he forward to get the files on
> the worstation?

three line guide to "port-forwarding:"

  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport $OUTSIDE_PORT \
    -j DNAT --to-destination $INSIDE_HOST_IP:$INSIDE_PORT

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  iptables -A FORWARD -i $EXT_IF -p tcp --syn \
    -d $INSIDE_HOST_IP --dport $INSIDE_PORT -j ACCEPT

where example values for all the variables are:

  EXT_IF="eth0"
  OUTSIDE_PORT="80"
  INSIDE_HOST_IP="192.168.1.3"
  INSIDE_PORT="8080"

HTH...

-j

--
"Peter: Lois, When I'm through with them, our kids will be so smart,
 they'll be able to program their own VCRs without spilling piping hot
 gravy all over myself."
        --Family Guy

