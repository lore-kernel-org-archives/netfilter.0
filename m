From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: doing prerouting/postrouting/output logfile problems
Date: Mon, 21 Oct 2002 15:02:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021190223.GA754@Ajftl1.ajfthome.on.ca>
References: <1035208680.14664.26.camel@sander.dmdint.com> <200210211509.g9LF9lL32079@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200210211509.g9LF9lL32079@vulcan.rissington.net>; from Antony@Soft-Solutions.co.uk on Mon, Oct 21, 2002 at 11:09:41 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> > firewall
> > eth0 = x.x.x.x (public ip)
> > eth1 = 192.168.2.1 (internal ip)
> >
> > webserver
> >
> > eth0 = 192.168.2.2
> >
> >  ${IPTABLES} -t nat -A PREROUTING -p tcp -d x.x.x.x --dport 80 -j
> DNAT
> > --to-destination 192.168.2.2
> 
> 
> >  ${IPTABLES} -t nat -A POSTROUTING -p tcp -d 192.168.2.2 --dport 80
> -j
> > SNAT --to-source 192.168.2.1
> 
> >  ${IPTABLES} -t nat -A OUTPUT -p tcp -d x.x.x.x --dport 80 -j DNAT
> > --to-destination 192.168.2.2
> 
> If you remove the SNAT rule from the POSTROUTING chain you will get
> correct
> entries in your webserver logfile.   However this will then break your
> 
> internal clients being able to access the public IP of the webserver
> (because
> the reply will come back from the private IP and the client will not
> be
> happy).
> 
> I suggest you modify the SNAT rule so that it only applies to packets
> from
> your local network:
> 
> ${IPTABLES} -t nat -A POSTROUTING -p tcp -s 192.168.2.0/24 -d
> 192.168.2.2
> --dport 80 -j SNAT --to-source 192.168.2.1
> 
> The you will see correct public IPs in your webserver logifle for
> extenal
> visitors, and 192.168.2.1 for all internal accesses - presumably you'd
> be
> happy with this ?
> 
> > I also use these lines for do mail traffic and I had some problems
> with
> > open Relaying.
> 
> Open Relaying is (a) a very bad thing to do, (b) nothing to do with
> netfilter
> rules, and (c) quite likely to get your mail server blocked by various
> 
> anti-spam databases.   I suggest you correct your mail server
> configuration
> file so that it is not an open relay.
> 
> > Also because 192.168.2.1 was allowed to mail.

	Presumably he was SNATting all packets originally... if he 
happened to be
	SNATting stuff through port25, the mailserver wouldn't know to 
block mail
	from outside.... since ... everything looked like it was inside 
... or at least
	the firewall...
	 
	Alistair

