From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "NAT redirection", or NAT from inside to inside?
Date: Thu, 14 Aug 2008 20:12:53 -0500
Message-ID: <48A4D815.2050708@riverviewtech.net>
References: <bcc0d0530808140217y37de308cj5bee8c0b64971a4c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bcc0d0530808140217y37de308cj5bee8c0b64971a4c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/14/2008 4:17 AM, Philipp Periventas wrote:
> I've got a server, running two virtual machines on it. The server 
> itself serves as router. I forwarded some ports, among port 80 to one 
> of the machines. The port forwarding works fine from the outside 
> (from the WAN, e.g. my computer at home) - but what doesn't work is 
> the access to the forwarded port 80 from INSIDE using my external IP. 
> That means, when I try to use lynx from my webserver, and enter the 
> external IP, it says connection refused.

*nod*  I (loosely) refer to this a "looping through its self" type of 
problem.

/Usually/ port forwarding is associated with the incoming interface and 
the destination IP.  So, when you have traffic coming in (to the NATing 
config) from the WAN the external interface is matched everything works 
fine.  However when you have traffic coming in (to the NATing config) 
from the LAN the external interface is not matched and as such NATing is 
not done.  Thus you end up with traffic coming in to your router that is 
not DNATed any where and thus coming directly in to the router which 
does not have any thing listening on it.

To work around this, you will need to either not care about the incoming 
interface, or handle each incoming interface appropriately.  You can not 
care by removing the interface portion of your DNAT rule.  However when 
you do this, you will DNAT any traffic destined to your external IP over 
to an internal system.  The problem is that when you are DNATing 
internal traffic to an internal host, the internal host will reply 
directly back to the original internal client.  This may seem ok, but 
the internal host will reply with it's internal IP as its the source IP 
of the packet, which is not what the original client is expecting.

You can get around this "TCP Triangle" (as I and others call it) by 
SNATing traffic before it is DNATed to the internal host.  However I'm 
betting that you do not want to SNAT your external requests.  So, this 
is why I say handle your internal and external DNATing separately.  Have 
the external requests DNATed to the internal host as they are and have 
your internal requests DNATed to the internal host and SNATed to the 
internal IP of the NATing router.  By SNATing your internal traffic the 
internal host will see the traffic as coming from the router and will 
reply there which will allow the router to unDNAT the traffic and send 
it back to the original internal client.

You may be able to get away using a common DNATing rule (in the 
PREROUTING chain) that does not match any interfaces while using a 
SNATing rule (in the POSTROUTING chain) that will SNAT any traffic that 
is both from and to the internal network.  This way any traffic that 
comes into the router from the local LAN that is redirected back out to 
the local LAN will pass back through the router on its return trip back 
to the original client.

> I tried to rebuild the problem with my own home linksys router, but 
> it worked! Then I found an option called "Filter Internet NAT 
> Redirection" in my linksys webinterface, and after activating that, 
> it didnt work any longer.

I wonder if the Linksys router is SNATing / MASQUERADing any traffic 
from the LAN that is being DNATed back to the LAN.  This rule would be 
based on source and destination IP.  If this rule is not based on the 
interface, it would be trivial to spoof IPs on traffic coming in the 
external interface and thus potentially be an exploit vector, thus we 
would want to have the option to filter this type of spoofing.  I'm not 
quite sure how they came up with the name "Filter Internet NAT 
Redirection", unless it means to apply the NAT rules in such a way as 
they do care what interface they come in on.

> Finally, I'm looking for the iptables command(s) which offer exactly 
> the same features as my linksys router does - permitting LAN-clients 
> to access LAN-services by using the EXTERNAL ip of the router.

I don't have a way to test this at the moment, but I believe the 
following two types of rules would do what you are wanting to do.

    iptables -t nat -A PREROUTING -d $WAN_IP -p TCP --dport 80 -j DNAT 
--to-destination $Internal_Server:80

and

    iptables -t nat -A POSTROUTING -s $LAN -d $LAN -j SNAT --to-source 
$LAN_IP

or

    iptables -t nat -A POSTROUTING -s $LAN -d $LAN -j MASQUERADE

> Has anyone an idea how to resolve this "problem"?

Again, I /think/ I understand what the problem is but I'm not 100% 
positive.  Also I don't currently have a way to test this.  (Do to "Life 
Happening" I'm currently using $hit-sco routers for my NATing needs. 
Yes I'm sorry for it too.)

> Thanks in advance

*nod*

You are welcome.



Grant. . . .
