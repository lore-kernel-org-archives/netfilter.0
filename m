From: Dhirendra Pal Singh <list@actiswitch.com>
Subject: Re: How to do port forwarding dynamically
Date: Mon, 24 Feb 2003 12:13:15 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5A7CDB.9070507@actiswitch.com>
References: <023001c2daaf$cd19fe80$020010ac@romio> <3E56CB74.4090305@actiswitch.com> <200302212034.57159.netfilter@newkirk.us>
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

Thanks for your detailed help J.
I will try all what you have said and will get back to you later... As I 
do have some more questions but let me try them myself before asking 
again...

Thanks once again..
Dp


Joel Newkirk wrote:

>On Friday 21 February 2003 07:59 pm, Dhirendra Pal Singh wrote:
>  
>
>>Hi All,
>>I am trying to set up a web server inside my home lan. Firewall is
>>running on the gatewaty.
>>Below is the script for the firewall... (its very simple.. I
>>downloaded it from the net)
>>    
>>
>
>  
>
>>echo "   enabling forwarding.."
>>echo "1" > /proc/sys/net/ipv4/ip_forward
>>    
>>
>
>Best not to do this until you've already created the rules, and the DROP 
>policy.
>
>  
>
>>echo "   enabling DynamicAddr.."
>>echo "1" > /proc/sys/net/ipv4/ip_dynaddr
>>
>>echo "   clearing any existing rules and setting default policy.."
>>$IPTABLES -P INPUT ACCEPT
>>    
>>
>
>This is NOT a good idea.  This allows anybody on the internet to have 
>unrestricted access to all ports on your firewall/gateway.  (unless you 
>DNAT them to another machine, or have a rule that explicitly DROPs 
>something)  You want a DROP policy instead, and then ACCEPT only traffic 
>that needs to access the gateway machine itself.  A simple, more-secure 
>(but still not tight) approach is to have a DROP policy on INPUT, then 
>use:
>
>$IPTABLES -A INPUT -i $INTIF1 -j ACCEPT
>$IPTABLES -A INPUT -i $INTIF2 -j ACCEPT
>
>which allows all machines on the local networks unrestricted access to 
>the gateway itself (this is a separate matter from forwarding!) but 
>ignores connection attempts from the outside world.  Even better would 
>be to ACCEPT ONLY the absolute bare minimum.  Under normal operation 
>nobody (internet _OR_ LAN) should need access to the firewall box 
>itself.  If you do all your work on the machine sitting in front of it 
>with it's own keyboard and monitor, and it's not offering other services 
>then you can probably work just fine with DROP policy for INPUT (and 
>even OUTPUT).  If there are services that the gateway offers to the LAN 
>(mailserver, DNS, filesharing, whatever) then you should have ACCEPT 
>rules for the necessary ports on INPUT chain, and limit them as above to 
>ONLY the LAN, never the internet.  
>
>
>  
>
>>************************ I have stripped off the comments for
>>simplicity. Now when I want to open a port and forward it I am trying
>>to execute the following 2 commands...
>>
>>$iptables -A INPUT -j ACCEPT -p tcp --syn --destination-port 5000
>>$iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 5000 -j DNAT
>>--to-destination 192.168.1.30:80
>>
>>Shouldnt this forward port 5000 to the internal box on port 80. But
>>    
>>
>
>Nope.  This DNATs port 5000 incoming to port 80 on the internal box, and 
>ACCEPTs syn to port 5000 on the gateway.  You want the PREROUTING rule 
>as is, (but "-i $EXTIF" would fit the script style better...) but the 
>second rule should be:
>
>$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 80 -j ACCEPT
>
>Differences:  This is FORWARD chain, which is where packets to be 
>forwarded will go instead of INPUT.  The destination port is now 80, not 
>5000, since the DNAT rule already changed the DPORT when it changed the 
>destIP.
>
>  
>
>>this is not working. Can someone please help me to correct this
>>script. Actually I want just 2 lines which I can run for any port and
>>can open and forward it to anymachine of my choice...
>>
>>Any quick help would be very much appreciated...
>>Thanks and advance..
>>Dp
>>    
>>
>
>INPUT is for connections directly to the firewall machine, or responses 
>to something initiated by the machine itself.  OUTPUT is for connections 
>initiated by the firewall machine, or responses to something that came 
>in INPUT.  FORWARD is for connections that are only passing through.
>
>j
>
>
>
>  
>



