From: Andrew McRory <amcrory@linuxsys.com>
Subject: Re: SNAT Problem / Question
Date: Fri, 18 Jun 2004 13:57:06 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0406181347180.14808-100000@weta.lselinux.com>
References: <1087561885.4625.13.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087561885.4625.13.camel@localhost>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On Fri, 18 Jun 2004, John A. Sullivan III wrote:

> On Thu, 2004-06-17 at 23:24, Andrew McRory wrote:
> > I am having problem getting SNAT to work with tn3270 clients. My network 
> > is using private IP address and is connected via freeswan ipsec to the 
> > remote server. Since a large number of clients connect to the server they 
> > require that all incoming connections be from our public IP. I setup this 
> > rule:
> > 
> >   $IPT -t nat -A POSTROUTING -o ipsec0 -j SNAT -d <REMOTE_IP> \
> >     --to <OUR_PUBLIC_IP>
> > 
> > and verified with tcpdump that the packets going out on the ipsec0 
> > interface have been SNAT'ed properly. With a single client connection 
> > everything operates beautifully however when a second client connects the 
> > first client session breaks and the server responds with 
> > 
> > 	"Please close your telnet session. A connection establishment 
> > 	error has been detected."
> > 
> > I am guessing that this is having to do with connection tracking but I am 
> > not sure. Any help is greatly appreciated as I have not found anything in 
> > hours of searching!!
> > 
> > Regards,
> Something doesn't seem right (obviously!).  When one uses FreeS/WAN, the
> packets will start with their original IP addresses.  They will then be
> diverted to the ipsec0 interface which will encapsulate them into a
> packet with the address defined by left.  Then you are changing the IP
> address of the encapsulating (not the encapsulated) packet and sending
> it to the other side.  I'm surprised it's being received from the other
> side - does the termination point defined on the other side match the
> public IP of the other gateway? I suppose it may be accidentally working
> if the public IP of the SNAT gateway is the same as the IP address
> defined as the local termination point in your ipsec.conf.  In any
> event, once the packet gets to the other side, it is decapsulated and
> the the packet seen by the mainframe has the original source address,
> not the address of the gateway.  At least so I would think.  Have I
> understood you configuration properly.

yes, you understand. The left side is the public IP.
 
> To achieve what I think you want to achieve, you will need to NAT before
> encapsulating.  The way originally read the FreeS/WAN documentation, I
> thought the packet was routed to the ipsec interface and encapsulated
> before it hit the POSTROUTING chain but I found that not to be true in
> my lab tests and am successfully mapping one address range to another
> before passing it through ipsec.  I would imagine one could just as
> easily map a subnet to a single IP.

Simply removing the "-o ipsec0" fixed it! I am sure I tried it before but
after all what matters is that it is now working properly. The evidence is
the terminal identifiers increment with each successive login.

John, thanks for your help!

-- 
Andrew McRory - President/CTO
Linux Systems Engineers, Inc.
PO BOX 3791
Tallahassee, FL 32315
(850)224-5737
(850)294-7567



