From: "Michael K" <micke@klintan.se>
Subject: RE: problems filtering ms file shares
Date: Mon, 2 Jun 2003 16:33:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c32913$f1d8f1b0$0200a8c0@klintan.local>
References: <3EDB4DEE.4000001@ncl.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EDB4DEE.4000001@ncl.ac.uk>
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



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Matthew Pocock
> Sent: Monday, June 02, 2003 3:15 PM
> To: netfilter@lists.netfilter.org
> Subject: problems filtering ms file shares
> 
> 
> Hi,
> 
> I'm having trouble setting fire wall rules on a bridge. I'm 
> running rh9, 
> and
> have patched the kernel with 
> bridge-nf-0.0.10-against-2.4.20.diff and 
> ebtables-v2.0.003_vs_2.4.20.diff as well as installing the utilities 
> brctl and
> ebtables.
> 
> Using iptables (editing my uni2lan & lan2uni chains), I seem 
> to be able to control what goes through the firewall well 
> enough to convince ping, http, nmap and traceroute (with and 
> without the -I option) that protocols & ports are reachable or not.
> 
> However, windows file sharing seems go go right through. If I 
> pull either cable out of the bridge, then windows file 
> sharing across the bridge 
> stops (no
> supprise there), but if the cable is in, file sharing is 
> always functional, even if I set all chains to deny 
> everything (by uncommenting the debugging rules below).
> 

What I can see is that filesharing can go into the firewall (-P INPUT
ACCEPT, -P OUTPUT ACCEPT)
And Lan can acces filesharing to universe (-A FORWARD -i eth1 -o eth0 -j
lan2uni, -A lan2uni -j ACCEPT)
Is this what you expect? Where should filesharing not go thrue? Firewall
itself or to other computers?



> Down at the bottom of the netfilter/iptables docs, it says I 
> should be 
> using
> the physdev module to match bridge ports, but it seems that 
> this module 
> is not
> present on my system. Other docs say that it is only needed 
> for kernels 
> 2.5.44
> and greater...
> 
> iptables-restore v1.2.7a: Couldn't load match
> `physdev':/lib/iptables/libipt_physdev.so: cannot open shared object 
> file: No
> such file or directory
> 
> tcpdump (run seperately on eth0 and eth1) seems to be showing exactly 
> what you
> would expect given the firewall rules & doesn't show the packets 
> transmitting
> information between the two PCs, but the two PCs still are doing file 
> sharing.
> 
> I'm feeling bewildered.
> 
> I use this script to set up the bridge:
> 
> /usr/sbin/brctl addbr br0
> /usr/sbin/brctl stp br0 off
> /usr/sbin/brctl addif br0 eth0
> /usr/sbin/brctl addif br0 eth1
> /sbin/ifconfig eth0 down
> /sbin/ifconfig eth1 down
> /sbin/ifconfig eth0 0.0.0.0 up
> /sbin/ifconfig eth1 0.0.0.0 up
> /sbin/ifconfig br0 128.240.227.17
> echo "1" > /proc/sys/net/ipv4/ip_forward
> /sbin/route add default gw 128.240.227.251
> 
> My iptables config looks like this:
> 
> ##############################################################
> ################
> #
> # iptables config file written by Matthew Pocock 
> (matthew.pocock@ncl.ac.uk) #
> 
> ## main chains
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT ACCEPT [0:0]
> :lan2uni - [0:0]
> :uni2lan - [0:0]
> 
> ##############################################################
> ################
> #
> ## debugging rules
> #-A FORWARD -j DROP
> #-A INPUT -j DROP
> #-A OUTPUT -j DROP
> 
> ##############################################################
> ################
> #
> ## drop all invalid packets, iregardless
> -A FORWARD -m state --state INVALID -j DROP
> 
> ## split traffic depending upon direction
> -A FORWARD -i eth0 -o eth1 -j uni2lan
> -A FORWARD -i eth1 -o eth0 -j lan2uni
> 
> ##############################################################
> ################
> #
> ## let everything out - is this a good plan?
> ## we should realy be a bit more careful here, but hey-ho
> -A lan2uni -j ACCEPT
> 
> ##############################################################
> ################
> #
> ## let only specific things in
> 
> ## stuff we've seen before should get through
> -A uni2lan -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> ## accept some new connections for 'nice' protocols
> ## we know they are new, as we've dropped all invalid things earlier, 
> and just
> ## now we let related & established through.
> 
> ## ping, ssh
> -A uni2lan -p icmp -j ACCEPT
> -A uni2lan -p tcp --dport 22 -j ACCEPT
> 
> ## drop everything else comming in
> -A uni2lan -j REJECT
> 
> 
> 
> COMMIT
> 
> 
> Thanks,
> 
> Matthew
> 
> 


/Klintan



