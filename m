From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: dns replies (udp) blocked but why ?
Date: Mon, 25 Aug 2003 09:36:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825133641.GA28045@cannon.eng.us.uu.net>
References: <000101c36b08$754459f0$d90315ac@rsrc.be.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000101c36b08$754459f0$d90315ac@rsrc.be.local>
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
To: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Mon, Aug 25, 2003 at 02:57:35PM +0200, Tom Van Overbeke wrote:

> Hi,
> 
> I'm seeing a lot of these messages in my iptables logs lately:
> 
> Aug 25 14:46:21 dobermann kernel: -drop_the_rest-IN= OUT=eth1 SRC=172.21.3.1
> DST=172.21.3.10 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=53
> DPT=3412 LEN=42
> 
> 
> however, the iptables config should accept it:
> 
> i have this rule on the firewall (which is also the dns server, hence the
> 'INPUT')
> 
> $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A INPUT -p udp  -s 172.21.0.0/16  --source-port
> 024:65535  --destination-port 53  -m state --state NEW  -j ACCEPT

I can't understand the topology of your network and what 172.21.0.0/16
should represent but a server to server query might be from port 53.
Why are you filtering based on the source port?

> 
> the 172.21.3.10 is the only one causing problems, i noticed howerver that
> this is udp, whereas most dns related traffic i can see is tcp.

Most DNS traffic you see should be UDP though. Why are you seeing more
TCP than UDP?

> could it be a connection tracking problem ?

If 172.21.3.10 is too slow in replying and the reply time exceeds the
UDP conntrack timeout you'd see this behaviour. Maybe that's the reason.

Ramin

> 
> 
> 
> thx,
> 
> 
> Tom.

