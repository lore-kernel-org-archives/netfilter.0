From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ftp behind the firewall
Date: Mon, 14 Feb 2005 20:37:54 -0500
Message-ID: <200502142037.55097.Alistair@nerdnet.ca>
References: <186AC876521E0F46BDE77079A6567FD0F0DDC3@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
	<1108421649.4852.7550.camel@Linsaidin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108421649.4852.7550.camel@Linsaidin>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On February 14, 2005 05:54 pm, Travis Crook wrote:
> On Mon, 2005-02-14 at 09:25 -0800, Hudson Delbert J Contr 61 CS/SCBN
>
> wrote:
> > travis,
> >
> > re-state your scenario. its incomplete.
> >
> > how do you know its running fine?
>
> Normal Web traffic, ftp users outside the firewall coming in, windows
> boxes behind the firewall, etc. are all running and accessing
> information as expected.

	I believe the list will take this to mean that a windows box on the internal 
network can connect to a specific ftp server on the other side of the 
firewall and transfer data without issue, whereas a linux box on the internal 
network cannot connect to the same specific ftp server on the other side of 
the firewall.

	( Lets make the issue clear here -- if I've got the above wrong in any way 
please feel free to correct as nessesary)

	Im gonna drop the internal client to internal ftp server for a different 
question below.

>
> > what distro and version of linux are you running?
>
> Mandrake 8.1, kernel 2.4.8-26mdk
>
> > what doesn the config for ftp look like?
>
> Rules for ftp:
>
> # Network information you will need to adjust
> INTERNALIF="eth1"
> INTERNALNET="192.168.2.0/24"
> INTERNALBCAST="192.168.2.255"
> EXTERNALIF="eth0"
> MYADDR="12.42.147.158"  # Only needed for DNAT, leave out otherwise
>
> #Insert modules- should be done automatically if needed
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp
>
> #Allow replies coming in
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> #Send ftp to an internal machine
> $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport
> 20 -j DNAT --to 192.168.2.5:20
> $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 20 -j
> ACCEPT
>
> $IPTABLES -t nat -A PREROUTING -i $EXTERNALIF -p tcp -d $MYADDR --dport
> 21 -j DNAT --to-destination 192.168.2.5
> $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 21 -j
> ACCEPT
> $IPTABLES -A FORWARD -i $EXTERNALIF -o $INTERNALIF -p tcp --syn -d
> 192.168.2.5 --dport 21 -j ACCEPT
> #Masquerade internal connections going out.
> $IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE
>
> > is the blocked by default.
> >
> > when you say my windows machines dont seem ot have this problem..
> > where do these windoze boxen sit?
>
> All computers (linux and windows) are on an internal network connected
> via a switch to the firewall.

	I see something coming here....  but I'll wait for further detail....

	The above rules are setup to forward external ftp connections to an internal 
network based ftp server.  They will *NOT* suffice to handle connections from 
internal clients to the external ip address of the firewall with intent to 
get to the internal ftp server.   You have no rules here that indicate that 
the clients can get out at all .... 

	Please PLEASE tell me that the firewall does NOT have both internal and 
external nics plugged into the same switch.

>
> > anything anybody on this list offers up as a solution will not
> > be thought out well and will basically be a guess.
> >
> > i'm a visual person - draw me pix of your networks and
> > sanitize the ip with rfc1918 addresses and bitmasks as it
>
> Not quite sure I understand this...
>
> > makes no difference as its all cidr.....
>
> Network picture
>
> Internet --> firewall --> internal network (linux and windows)
>
> firewall --> incoming ports: 80, 8080, 110, 25, 443, 143, 20, 21, all
> get routed to internal servers.  The rest are dropped/denied.
>
> internal network: should be completely masqueraded by the firewall
> #Masquerade internal connections going out.
> $IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE
>
> > guessing is a bad idea....
>
> Agreed.
>
> > need waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaay more info.
>
> Anything else?  Will gladly provide it.
>
> Thanks!

