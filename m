From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: NAT & MySQL
Date: Tue, 25 Nov 2003 12:19:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC38F14.1050409@Loudoun-Fairfax.com>
References: <3FC3485C.000009.00204@adburne>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FC3485C.000009.00204@adburne>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

adburne wrote:

> The forward rules on the gateway are:
>  
> # "Accept forward all connections to port 3306 on ppp0"
> iptables -A FORWARD -p tcp -i ppp0 --dport 3306 -o eth0 -j ACCEPT
> # "All stablished connections are ok"
> iptables -A FORWARD -i ppp0 -o eth0 -m state --state 
> ESTABLISHED,RELATED -j ACCEPT
> # "All connection from inside to outside are accepted"
> iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
> # "Rest go away"
> iptables -A FORWARD -j REJECT
>  
> NAT rule:
> iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 3306 -j DNAT --to 
> 192.168.0.80 -s 200.10.10.1
>

Are you using MASQUERADE or SNAT ? If you aren't then the outside can't 
'see' your internal server.

Jeff


