From: Mike Mestnik <cheako911@yahoo.com>
Subject: Fwd: netfilter: Transparent squid running on another host.
Date: Sat, 2 Oct 2004 12:44:06 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041002194406.64637.qmail@web11907.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>


--- Mike Mestnik <cheako911@yahoo.com> wrote:

> Date: Fri, 1 Oct 2004 14:33:49 -0700 (PDT)
> From: Mike Mestnik <cheako911@yahoo.com>
> Subject: netfilter: Transparent squid running on another host.
> To: "lists.debian.org debian-firewal" <debian-firewall@lists.debian.org>
> 
> My *default GW* is 10.0.0.1(train) and I have squid running on
> 10.0.0.110:3128(paladin).
> I have setup squid to run as a TP, setting something about keeping http
> headers and what not.  The proxy(when clients are configured) dose work,
> but tcp showes that transparent client's are not using the proxy.
> 
> These are the rules I have been trying to use, with out succsess...
> 
>         # Non-local transparent FTP and HTTP(S) proxy.
>         iptables -t mangle -A PREROUTING -i $IFACE+ -p tcp\
>             --src ! 10.0.0.110 --dport 80\
>             -j MARK --set-mark 1
>         iptables -t mangle -A PREROUTING -i $IFACE+ -p tcp\
>             --src ! 10.0.0.110 --dport 443\
>             -j MARK --set-mark 1
> # Exclude a host.
> #       iptables -t mangle -A PREROUTING -i $IFACE+ -p tcp\
> #           --src 10.0.0.20 --dport 80\
> #           -j MARK --set-mark 0
> #       iptables -t mangle -A PREROUTING -i $IFACE+ -p tcp\
> #           --src 10.0.0.20 --dport 443\
> #           -j MARK --set-mark 0
>         ip rule add fwmark 1 table web.out
>         ip route add default via 10.0.0.110 dev $IFACE table web.out
> 
> For now it's OK that 10.0.0.20 dosen't(may not) get exluded from the
> transparent proxy.  I have another solution for this, if the above
> commented rules don't do the trick.
> 
> 
> 
> 		
> _______________________________
> Do you Yahoo!?
> Express yourself with Y! Messenger! Free. Download now. 
> http://messenger.yahoo.com
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-firewall-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact
> listmaster@lists.debian.org
> 
> 



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

