From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: DNAT Problem
Date: Mon, 19 Apr 2004 09:43:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4083D765.7000000@newkirk.us>
References: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175>
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
To: test@seaconindia.com
Cc: netfilter@lists.netfilter.org

test@seaconindia.com wrote:

>Hi All
>
>I am new to Iptables & Firewall. I have 2 servers (web & email) running
>behind firewall. I have DNAT rule on my firewall, so any request hitting
>on port 25, 80, 110 are DNAT to internal servers. Inturn my internal
>servers (web & email) feel these requests were received from firewall ie
>internal ip and can be trusted.
>
>I want these DNAT request to be forward with their original ip address and
>not as coming from firewall ip.
>
>Please advice my firewall rule is as follows :
>
>iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to
>192.168.0.175:25
>
>Regards
>
>Joel
>
The way DNAT works it changes ONLY the Destination IP, not the Source 
IP, so the packets WILL still appear to be from the original source.  If 
you are NOT seeing them as such, then you have a SNAT rule affecting 
them, perhaps something like:

iptables -t nat -A POSTROUTING -j MASQUERADE
or
iptables -t nat -A POSTROUTING -j SNAT --to 192.168.0.254

The solution, if this is the case, is to tie the MASQUERADE or SNAT rule 
to a particular interface:

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

And make sure that if for some reason you DO need to SNAT traffic from 
the firewall inward (out the 'private' nic), you can restrict that 
action to particular source IPs or networks (-s a.b.c.d) etc to ensure 
that /only/ the traffic you need to have a different source IP will in 
fact get one.

Note that this will prevent computers on the LAN from reaching these 
servers at their public IPs. (client connects to public IP, which is 
firewall, which DNATs traffic back to LAN IP of server, which tries to 
reply directly to client awaiting reply from public IP) If you need to 
connect to the local servers, you either need to use the local IPs, or 
use a SNAT like:

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT --to 
192.168.0.254

This way, the ONLY traffic from the firewall to the LAN that is SNATted 
is traffic that came from the LAN originally - in most cases, this is 
the only SNAT that should be performed on the 'local' interface of the 
firewall.

j



