From: amateurguy@telus.net
Subject: Re: iptables / FTP masquerading: Port command illega
Date: Wed, 23 Mar 2005 11:31:00 -0800
Message-ID: <1111606260.4241c3f418f5b@webmail.telus.net>
References: <1111590778.4241877a4e631@webmail.telus.net>
	<20050323173554.GA22883@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050323173554.GA22883@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"
To: opie@817west.com
Cc: netfilter@lists.netfilter.org

Hi There,

Thank you for the reply.  Nope, I hadn't tried it but just did.  I did an rmmod 
on each and then a modprobe just as outlined below and no change observed.   Do 
I need to reboot?  I even restarted iptables service.

Looked at the actual packets sent:

The inbound packet from the client is using a Port command using a non-routable 
IP which I would expect since the client doesn't know its sitting behind our 
corporate firewall.  When the packet is received by the LInux f/w box running 
vsftpd, naturally the source IP of the packet itself has been translated to a 
public IP and naturally, tcpdump  logs the packet on the external interface 
before the netfilter NAT subsystem event attempts to translate the inner Port 
command, so the Port commmd continues to use the internal, non-routable IP of 
the client.  The response from the fw to the client ftp station is the 
usual "500 Illegal PORT command".

What is interesting is that you mentioned to supply the ip_nat_ftp module with 
the port argument as well and when I do an lsmod, its unused still.  Is it 
supposed to be that way?  I would expect these two modules to handle the 
translation of the PORT command so that vsftpd will issue a connect on 
translated IP (hence public IP).  

Just curious too, with "trace" on in the ftp client, I get the "tp: bind: 
Address already in use" error.  Just to confirm, this bind failure is on the 
server side right?   Now, if that's the case, does it really have to do with 
the PORT IP argument right now ... or is it the two parameter port number in 
the PORT command that it doesn't like?   Since this is in active mode (passive 
works fine on port 29), the vsftpd should be taking that the PORT arguments and 
connecting back to the ftp client which should now be listening on that port 
using in its initial PORT cmd to the server and I don't see any outbound 
connection request (SYN pkts) so it really must be choking on the PORT cmd on 
the server.  But why?

Thanks everyone!

Quoting Jason Opperisano <opie@817west.com>:

> On Wed, Mar 23, 2005 at 07:12:58AM -0800, amateurguy@telus.net wrote:
> > modules in memory are:
> > 
> > ip_conntrack_ftp 5296 1 (autoclean)
> > ip_nat_ftp 4112 0 (unused)
> > iptable_mangle 2776 0 (autoclean) (unused)
> > ipt_MASQUERADE 2200 1 (autoclean)
> > iptable_nat 21720 2 (autoclean) [ip_nat_ftp ipt_MASQUERADE]
> > ipt_state 1048 10 (autoclean)
> > ip_conntrack 26976 3 (autoclean) [ip_conntrack_ftp ip_nat_ftp
> ipt_MASQUERADE 
> > iptable_nat ipt_state]
> > iptable_filter 2412 1 (autoclean)
> > ip_tables 15096 7 [iptable_mangle ipt_MASQUERADE iptable_nat ipt_state 
> > iptable_filter]
> > 
> > Anybody know whats going on?
> 
> did you modprobe with:
> 
> 	modprobe ip_conntrack_ftp ports=21,29
> 	modprobe ip_nat_ftp ports=21,29
> 
> -j
> 
> --
> "Ah! the searing kiss of hot lead; how I missed you! I mean, I think
>  I'm dying."
>          --The Simpsons
> 
> 




