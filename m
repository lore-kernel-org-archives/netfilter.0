From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: PPTP through iptables firewall
Date: Tue, 11 Feb 2003 20:35:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211203509.417fa42d.arnt@c2i.net>
References: <E88493086664D511A1E4000103330E82027FE067@mail.maconomy.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E88493086664D511A1E4000103330E82027FE067@mail.maconomy.dk>
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

On Tue, 11 Feb 2003 11:54:08 +0100, 
Niels Bach <NB@maconomy.dk> wrote in message 
<E88493086664D511A1E4000103330E82027FE067@mail.maconomy.dk>:

> Setup: 
> LAN A, LAN B, LAN C and LAN D all separate LAN's behind four different
> firewalls. 
>  
> The only connection between the LAN's is NAT through their respective
> firewalls. 
>  
> LAN D contains a PPTP server which I would like all the clients on all
> four LAN's to be able to access. LAN D is protected with a firewall
> (iptables/debian
> 3.0/kernel-2.4.20/patch-o-matic-20030107/iptables-1.2.7a).
>  
> Problem:
> LAN A (working)
> LAN B (working)
> LAN C (broken -- only one connection at a time)
> LAN D (containing the PPTP server)

..lan d is a dmz?

> Details:
> hmm it actually works from the 2 LAN's (A and B) but the last one is
> problematic. From the two working ones (LAN A and LAN B) you can
> connect with no problem to the PPTP server behind the firewall
> protecting LAN D.
>  
> From the broken LAN (LAN C) the problem is as follow:
> you can connect one person at a time. When this one person from LAN C
> has finished and logged off there is a 10 minute/600 seconds timeout
> before it is possible for another client to connect to the PPTP server
> from LAN C (and we are still talking about the PPTP server on LAN D).
>  
> So what I'm wondering about is what the difference is between
> connections from LAN A and LAN B and connections from LAN C ???

..some other type of tunnel running too?  PPTP is a monopolizer,
it wants the entire box for itself, but you _can_ use the box as 
a gateway for freeswan while it runs the poptop PPTP.

> The only debugging information I found was in /proc/net/ip_conntrack
> which looks like this:
> --------------------------------------------------------
> gre      47 428648 timeout=600, stream_timeout=432000 src=x.x.x.x
> dst=x.x.x.x version=1 protocol=0x880b srckey=0x0 dstkey=0xc3e7
> src=192.168.0.200 dst=x.x.x.x version=1 protocol=0x880b srckey=0xc3e7
> dstkey=0x47d[ASSURED] use=1
> 
> tcp      6 424347 ESTABLISHED src=x.x.x.x dst=x.x.x.x sport=1149
> dport=1723 src=192.168.0.200 dst=x.x.x.x sport=1723 dport=1149 [ASSURE
> D] use=2
>  
> ........
> 
> ----------------------------------------------------------
> where x.x.x.x represents the IP numbers for the server and the client.
>  
> The thing that is wondering me is that connections from the broken LAN
> C hangs in the /proc/net/ip_conntrack file, this connection which is
> still recorded was terminated more than one hour ago. Other
> connections from LAN A and LAN B have been made since, but they leave
> no trace ?
>  
> Niels
>  
> 
> -----Original Message-----
> From: Diego Sarasua [mailto:debian@sarasuasys.com.ar]
> Sent: 10. februar 2003 17:37
> To: Niels Bach
> Subject: Re: PPTP through iptables firewall
> 
> 
> ok  then U have to make pptp support kernel compilation  in your
> firewalls and it will work for your clients
> loading the properly iptables modules
>  
> please reply to : dsarasua@sarasuasys.com.ar
> <mailto:dsarasua@sarasuasys.com.ar>  
>  
> <mailto:asadopower@hotmail.com> 
>  
> anything U need to serv U 
> bye 
> Diego
> 
> ----- Original Message ----- 
> From: Niels Bach <mailto:NB@maconomy.dk>  
> To: 'Diego Sarasua' <mailto:debian@sarasuasys.com.ar>  
> Sent: Monday, February 10, 2003 1:17 PM
> Subject: RE: PPTP through iptables firewall
> 
> 3 LAN behind 3 different firewalls. 
>  
> On one LAN a PPTP server is placed and I want to access it from the
> clients placed on the different LANs. 
>  
> Niels
>  
> 
> -----Original Message-----
> From: Diego Sarasua [mailto:debian@sarasuasys.com.ar]
> Sent: 7. februar 2003 17:52
> To: Niels Bach
> Subject: Re: PPTP through iptables firewall
> 
> 
> Please givme some more info 
> Are U talking of this ?
>  
> USER\
> USER -------->   Firewall    !! PPTP Server!!
> USER/
>  
> Thanks
> Diego
> i have "patch-o-mated" my server with kernel  2.4.20 and it doesnt
> work , try with lower version of kernel  i have workig around 5
> servers one with 2.4.20 and 4 with 2.4..17
> thanks
> bye 
> Diego
>  
> ----- Original Message ----- 
> 
> From: Niels Bach <mailto:NB@maconomy.dk>  
> To: 'netfilter@lists.netfilter.org'
> <mailto:'netfilter@lists.netfilter.org'>
> 
> Sent: Friday, February 07, 2003 5:43 AM
> Subject: PPTP through iptables firewall
> 
> 
> 
> I have an MS PPTP server (win2k) behind a linux firewall (kernel
> 2.4.20 / iptables 1.2.7a) this does not work very well. You can only
> connect from one source at a time. Then there is a 10 minute (600
> seconds) timeout before the next connection from a different source
> can be made. If you come from a LAN that is NAT'ed to one IP address
> (the firewalls) then all these clients can connect simultaneously. So
> it is either one client with a public ip address or several clients
> sharing a public IP address. But once their is a connection (either
> type) everybody else is blocked out.
> 
> I have tried to patch the kernel (patch-o-matic-20030107) with the
> pptp-conntrack-nat.patch. With this patch the firewall is able to
> recognize the GRE protocol. This can be seen in /proc/net/ip_conntrack
> where the connections involving GRE has changed from UNKNOWN to GRE.
> But with this patch it is not possible to connect, now the windows
> client only reach"verifying username and password" and then times out.
> 
> 
> Without the patch it is possible to connect to the server one at a
> time and wait 10 minutes before the next connection from a different
> location
> 
> With the patch it is not possible to connect at all. 
> 
> I run Debian 3.0 (woody) Kernel 2.4.20 and iptables 1.2.7a with the
> patched version and 1.2.6a with the unpatched version of the kernel.
> 
> I have seen more people talking about this issue on the web, but no
> one seems to have at solution. 
> 
> regards Niels 
> 
> 
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



