From: David Shifflett <shifflett@nps.navy.mil>
Subject: Re: NAT and UDP
Date: Mon, 31 Mar 2003 15:52:14 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E88D4AE.7090303@nps.navy.mil>
References: <000d01c2f55a$f4d13bd0$c00a7883@ad.nps.navy.mil> <200303301233.46424.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

It just so happens that we are NATing just one client.
Our device is a gateway/network authenticator between the client
and the network.
So here is how we solved the issue:
OIP=192.168.0.31
IIP=192.168.1.100
MYP=xxx   #Port for device specific traffic

echo "Configuring IP Masquerading..."
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -F; iptables -t nat -F; iptables -t mangle -F
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $OIP
iptables -t nat -A PREROUTING -i eth0 -p udp --dport $MYP -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to $IIP

This SNATs all traffic from the client to the net
and DNATs almost all traffic from the net to the client
except for some traffic to our device itself.

Are there any other rules I should add in for safety sake?
I suppose I could add a DROP rule for UDP traffic from the client
with a source port of $MYP.

Thanks for your help
David Shifflett

Joel Newkirk wrote:

>On Friday 28 March 2003 01:50 pm, Jean Khosalim wrote:
>  
>
>>Does NAT work for UDP in general, and TFTP in particular?
>>The man page has lots of UDP specific options
>>do those only apply to filtering, and not NAT?
>>    
>>
>
>For UDP in general it works wonderfully.  For TFTP I've never tried it, 
>but with the conntrack and nat helpers it should be fine.  The 
>UDP-specific options I'm aware of are simply matching options, usable in 
>any table/chain to match the rule more precisely to specific traffic.  
>IE, with conntrack and nat helpers installed, and a rule for 
>ESTABLISHED,RELATED in the filter FORWARD chain (with a DROP policy), 
>you could narrow down the FORWARD rule to ACCEPT only "-p udp --dport 
>69", and the same for the SNAT rule, and the rest would be handled for 
>you.  Then (barring other ACCEPT rules in FORWARD) only TFTP would be 
>permitted through.  Port 69 being its initial connection, and any others 
>(data) being handled by the helpers as RELATED traffic.  Once you load 
>the conntrack and nat helpers, the data ports are RELATED in FORWARD, 
>and RELATED is automatically matched with its 'parent' connection in the 
>SNAT rule.
>
>If you're trying to do this stateless, without conntrack, I don't think 
>you'll be successful SNATting a complex protocol like TFTP with your 
>apparent setup.  If only one client needs to connect with TFTP, you can 
>try SNATting its outbound connections, then DNATting any TFTP reply 
>traffic to that specific client.  I suspect this isn't the case, though.
>
>  
>
>>Thanks for any help.
>>Jean Khosalim and David Shifflett
>>    
>>
>
>j
>
>
>  
>



