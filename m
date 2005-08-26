From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: restricting connections from a single connection to a single
 destination
Date: Thu, 25 Aug 2005 21:05:21 -0500
Message-ID: <430E78E1.6070103@riverviewtech.net>
References: <7D746B3B-FA28-451A-BCBA-FE725C91C33D@viatornetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7D746B3B-FA28-451A-BCBA-FE725C91C33D@viatornetworks.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Todd Landfried wrote:
> I'm trying to protect some people from themselves and I want to set  up 
> a rule that allows a single IP on the network to connect only to  the 
> gateway's internal IP, thereby restricting as much as possible  user's 
> ability to connect to other PCs on the network. Yes, I know  about VLANs 
> and I know about port isolation on the hardware side, and  I've tried 
> explaining how to do it these folks, but they're just not  getting it.

This is really the more proper solution to me verses trying to protect things on a routing / firewalling level.

>  From what I have read, this should work, but it doesn't. I'm not  sure 
> which loopback this refers to, the host or the source. Any  suggestions?
> 
> -A PREROUTING -i lo -p icmp -d gateway-internal-private-ip -j ACCEPT
> -A PREROUTING -i lo -p tcp -d gateway-internal-private-ip -j ACCEPT
> -A PREROUTING -i lo -p udp -d gateway-internal-private-ip -j ACCEPT

Hmm.  I don't quite know what people were attempting to do with these rules.  First of all you will have to define a table to apply these rules to as there is no PREROUTING chain in the filter table.  Second of all I don't know why people would use a variable (I suppose that is what they are trying to do in place of "gateway-internal-private-ip") for the IP for loop back (lo) as there is no way that I'm aware of that you can get any source or destination IP in to the subnet on lo as the kernel's alien / martin code will drop it and complain LOUDLY about it in logs.  The only other way that I could see this making any sense is if these rules are really meant to be written as

-A PREROUTING -i ${IF} -p icmp -d ${IFIPAddress} -j ACCEPT
-A PREROUTING -i ${IF} -p tcp -d ${IFIPAddress} -j ACCEPT
-A PREROUTING -i ${IF} -p udp -d ${IFIPAddress} -j ACCEPT

On a different note I do not know of any filtering you will be able to do on the firewall to prevent two systems on the same LAN in the same subnet from being able to talk to each other with out some sort of layer 2 firewall.  If you are running managed layer 3 switches you *might* be able to configure them such that the only traffic that can pass through any given port is either to the router / broadcast or from the router / servers thus attempting to cut down on traffic from host to host.  Even this would be hard to implement and will require more advanced switches.

The only other way that I can think to get around this would be to have a subnet for each client system but IMHO this is just absolutely insane.



Grant. . . .

P.S.  If you would like help trying to explain the VLAN concept let me know as I'm having to implement this at one of my clients now.  In fact I may just write a How-To on it and see about submitting it somewhere b/c I think it will be rather interesting (read "fun" to those of us who like challenges) to do.

