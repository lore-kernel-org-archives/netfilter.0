From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables ACCEPT and DROP
Date: Fri, 16 Apr 2004 19:08:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404161908.26028.Antony@Soft-Solutions.co.uk>
References: <000401c423dc$1e471a10$8101a8c0@TELECOMME9F58X>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c423dc$1e471a10$8101a8c0@TELECOMME9F58X>
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

On Friday 16 April 2004 6:56 pm, Ravi Verma wrote:

> The following command will allows the machine to connect to
> 216.155.193.168.
>
> iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport 5050 -j
> ACCEPT
>
> Now when I issue
> iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport 5050 -j
> DROP
>
> And
>
> iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport
> 5050 -j REJECT
>
> Still, it allows connection to 216.155.193.168 on port 5050.
>
> How does this work? It seems -j DROP is not opposite of -j ACCEPT. How
> can stop this?

"-A" means append - in other words, "add on to the end of my ruleset".

You have not said that you have flushed the OUTPUT chain (with "iptables -F 
OUTPUT") between adding the ACCEPT rule and applying more rules after it, so 
I think you still have the ACCEPT rule in your chain, and that is the first 
one the packets see.

Try "iptables -L OUTPUT -nvx" and see what rules you have, and in what order.

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


