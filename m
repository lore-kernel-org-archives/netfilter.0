From: Jakob Praher <jpraher@yahoo.de>
Subject: portforwarding and masquerding - possible?
Date: 21 Nov 2002 17:16:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037895394.1302.15.camel@jaques2>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi all,

first of all: iptables is really great.
please email me to this address: jpraher@yahoo.de, since I am not a
member of this list.

I have the following scenario:

* firewall            
* internal web server   

the firewall has the public address of the server and forwards only port
80 to the server on the internal address.

now for the internal server, I still want to be able to download things
from the web, so I decided to do masquerading for ther internal server.

but somehow the internal server can't connect to external sites, that
means it does not receive any answers. (this might be, as I have a tight
forwarding policy between the nets )

my questions are:

* is there a problem when doing DNAT and SNAT for the same host?
* is the following right:

the firewalls forward chain gets the SNATTED request as an internal one
(since SNAT happends at postrouting ? ) - but how does it get the
results back, does the POSTROUTING change the incoming (the answer to an
SNATted ) packet before it get's in the forward queue?

to illustrate it:

outgoing packet:
	
	dest addr:    a.b.c.d
	source addr:  10.1.1.100
		
	1) forward 
	nothing changed (routing deciscion is made with 10.1.1.100)

	2) postrouting 
	dest addr:	a.b.c.d
	source addr:    MASQUERADED


incoming request
	
	source addr:	a.b.c.d
	dest   addr:	MASQUERADED
	
	*** when is it written back to 10.1.1.100 ** ? 
	*** does the forward quere see MASQUERADED or 10.1.1.100 ***


this is important for me, as I have to know what I should allow in the
forward chain to allow MASQUERADING ...

thanks

-- Jakob



