From: William Stearns <wstearns@pobox.com>
Subject: Re: Access to Internal server via public address
Date: Wed, 10 Dec 2003 15:16:25 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312101443570.2784-100000@sparrow>
References: <1071084797.6081.35.camel@cosby>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071084797.6081.35.camel@cosby>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vernon A. Fort" <vfort@provident-solutions.com>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good afternoon, Vernon,

On 10 Dec 2003, Vernon A. Fort wrote:

> Anyone,
> 
>   The Problem:  I have an alias public address DNAT'ed to and internal
> address - normal and working
> 
>   What i need is to access this server using the PUBLIC address from an
> internal workstation.  What I have:
> 
> 	INTNIC = eth1
> 	EXTNIC = eth0
> 
> 	INTERNALNET = 192.168.20.0/24
> 
> 	FIREALLIP = 1.2.3.4
> 	DNATADDR = 1.2.3.5
> 
>   /sbin/iptables -I FORWARD -p tcp -i eth0 -o eth1 -d 192.168.20.0/24
> --dport 22 -j ACCEPT
>   /sbin/iptables -t nat -A PREROUTING -p tcp -d 1.2.3.5 -s !
> 192.168.20.0/24 --dport 22 -j DNAT 192.168.20.22:22
> 
>   I also have a SNAT for masquerading everyting going out
> 
> 	/sbin/iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j SNAT
> --to-source 1.2.3.4
> 
>   I have searched for a solutions longer than I care to admit.  Can
> anyone give me an example on how to allow an internal ip address access
> to another internal address via the DNAT'ed public address.

	If the client box and the internal server in question are on the 
same cable, you essentially can't do this direcdtly (but read on).

	Picture this as a triangle; the internal machines on the bottom, 
(client left, server right) and the firewall at the top.  The packets 
physically all travel over the same Ethernet segment shared by all three 
machines, I'm just demonstrating who's talking to whom.

                Internet
                   ^
                   |
		Firewall
                 /   \
            (1) /     \ (2)
               /       \
              /         \
            Client---Server
 192.168.20.99    (3)     192.168.20.22

	The Client creates a syn packet to the server and sends it to its
default gateway, the firewall:

Packet (1):	192.168.20.99 -> 1.2.3.5 (SYN)

	The firewall applies DNAT to it, replacing the destination IP with 
the internal address of the Server:

Packet (2):	192.168.20.99 -> 192.168.20.22 (SYN)

	The server sees this and creates a SYN/ACK packet going back to 
the client:

Packet (3):	192.168.20.22 -> 192.168.20.99 (SYN/ACK)

	, which it then ships out its ethernet cable _directly_ to 
192.168.20.99 _without going through the firewall first_!  Because of 
this, the firewall never has a chance to fix the source address of the 
SYN/ACK packet.
	The client gets the SYN/ACK, looks at the IP addresses, and says, 
"Excuse me, I wasn't talking to your port 22, go away" with a RST packet, 
because the client still thinks it's talking to 1.2.3.5.  It's sorely 
mistaken.  :-)

	There are a number of potential fixes for this.

	The most elegant - and the best one from a security standpoint 
because it moves servers off the cable holding your client machines - is 
to move all servers off onto another ethernet segment.  Something like:

       Internet
           ^
           |
	Firewall-------------------....
           |           |          |
           |        Server1     Server2
           |
           |
     +-----+--------....
     |         |    
    Client1  Client2

	Now the packets flowing in both directions are seen by the 
firewall, and so it has a chance to fix the server address on packets 
going back to the client.

	A second approach which is worth considering is simply editing the 
hosts table on the internal machines to have the line:

192.168.20.22	shell.myco.com

	(replace /etc/hosts with the appropriate resolution file for other
OS's, or even consider running a separate internal dns server).  Now, when
I run "ssh shell.myco.com", I go directly to the right IP address (even
though DNS claims shell.myco.com is at 1.2.3.5).  You can even make this
manual change for SSH in ~/.ssh/config with a section like:

Host shell.myco.com
	Hostname	192.168.20.22
	HostKeyAlias	shell.myco.com

	, which overrides whatever hosts/dns says when the user literally 
types "ssh shell.myco.com".  Obviously, this approach is appliation 
specific.

	A third, less preferred, approach is to _also_ do _SNAT_ on
packets heading to that server, replacing the client IP with the
firewall's internal IP address.  Now the server thinks it's responding
back to the _firewall_, shipping packets to it, allowing it to fix both
the source _and_ destination addresses in both directions.  Picture the
first ascii art diagram with no direct link between server and client;  
packets 1 and 2 are the same, the Packet (3) syn ack goes back over the
same path as (2), the firewall fixes source and destination addresses, and
sends a doubly mangled SYN/ACK Packet (4) back over the same path as (1).
	The catch here is that the server can no longer identify _which_
internal system is talking to it;  all connections from internal machines
(and the entire world if you don't write the SNAT rule correctly) all look
like they're coming from 192.168.20.1 (assuming that's the firewall IP
address).  This makes effective IP based access control impossible in tp 
wrappers on the server.  I'll avoid the flamewar on whether it was truly 
effective in the first place, thanks.  ;-)
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Immortality is an adequate definition of high availability for
me."
        --- Gregory F. Pfister
(Courtesy of Lars Marowsky-Bree <lmb@suse.de>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


