From: ro0ot <ro0ot@phreaker.net>
Subject: Re: Internal NAT Translation:
Date: Mon, 05 Jul 2004 20:05:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E94403.6090800@phreaker.net>
References: <002101c45f0c$c2b90c50$0c02a8c0@bryanhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c45f0c$c2b90c50$0c02a8c0@bryanhome>
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
To: Bryan Martin <bmartin@myplaceinspace.com>
Cc: netfilter@lists.netfilter.org

Here is my example below: -

###############################################################################
#
# Destination NAT on the same network
#
###############################################################################
 
$IPTABLES -A FORWARD -i eth1 -o eth1 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -d 192.168.2.254 -s 192.168.2.0/24 -p 
tcp --dport 22 -j SNAT --to 192.168.2.1
$IPTABLES  -t nat -I PREROUTING -d 200.200.200.200 -p tcp --dport 22 -j 
DNAT --to 192.168.2.254
 
Regards,
ro0ot


Bryan Martin wrote:

>Setup looks like this
>
>            Internet
>                 ^
>Redhat 9 iptables nat/masq    (200.200.200.200 public address = eth1;
>192.168.2.1 private address = eth0)
>                 ^
>windows web server (192.168.2.254) | windows clients.    (all 192.168.2.X)
>
>
>Now the rh box is masquerading for the private boxes.  Only thing not
>standard is that any inbound http connections to the public address
>200.200.200.200 is being dnatted to 192.168.2.254 which is the address of
>the windows server.  This is working as expected.  The problem arises when a
>internal client tries to connect to the public website.
>
>For instance client request www.mycompany.com and DNS says go here
>200.200.200.200 which would be correct if I was sitting on the outside
>looking in.  I need iptables to basically say if any http request comes from
>the internal network addressed to my public address dnat the public
>200.200.200.200 to the private address.  I have tried the following without
>success.  Only other thing I know is to setup a internal DNS just so the
>internal clients get the internal address.  That would however be an extreme
>waste of resources.
>
>-A PREROUTING -i eth1 -d 200.200.200.200 -p tcp --dport 80 -j
>DNAT --to-destination 192.168.2.254
>
>Can someone help?
>
>Bryan
>
>
>
>  
>



