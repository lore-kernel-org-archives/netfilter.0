From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT
Date: Tue, 26 Oct 2004 08:42:14 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098794534.5877.32.camel@hubcap.ljm.dom>
References: <20041026102023.GA7941@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041026102023.GA7941@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-10-26 at 06:20, Payal Rathod wrote:
> Hi,
> I want to access my internal machine from outside. But I am unable to do 
> so. I tried,
> # iptables -t nat -I PREROUTING -d <my_ext_ip> -p tcp --dport
> 8081 -j DNAT --to-destination 192.168.0.16:80

that looks ok...keep in mind you'll need to go to: 
http://<my_ext_ip>:8081 to hit the server from the outside

> # iptables -I INPUT -p tcp --dport 8081 -j ACCEPT

nope--try:

  iptables -A FORWARD -p tcp -d 192.168.0.16 --dport 80 -j ACCEPT

once PREROUTING is traversed--the packet is forever changed from the
perspective of all remaining chains.

> # iptables -I FORWARD -s 192.168.0.16 -j ACCEPT

i guess the point of that is to allow the replies back?  ok, i guess...

-j

-- 
Jason Opperisano <opie@817west.com>


