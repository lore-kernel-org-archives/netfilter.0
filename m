From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: Forwarding GnomeMeeting to internal network
Date: Wed, 12 Nov 2003 14:18:23 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA579C5@OST_EXCH_USR5>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Fyi - MLdonkey is a windows & unix peer-to-peer client application [see
mldonkey.org]

-----Original Message-----
From: Julien Didron [mailto:admin@tripnotik.dyndns.org] 
Sent: 12 November 2003 1.11
To: Netfilter Mailing List
Subject: Re: Forwarding GnomeMeeting to internal network


Hi again,


Thanks for the answer Antony.
I'll then grant this box a fixed IP using DHCP declaration with the MAC 
adress.

Concerning the ip_conntrack table, I indeed have a sort of worm on my
network 
called "MLdonkey" ;o) (it's on some other box on the network), process that
I 
kill everytime the problem occurs, but with no success : i still get the
very 
same error line in syslog.
after increasing the value of ip_conntrack_max, I monitored the traffic on 
the outgoing interface, that was very little : say from 150B/s to 500B/s up 
and down.
For information my local network (this is home) is composed of 4 machines 
ranging from mail server (smtp and pop) to DDNS, DHCP and web server ... But

I really don't think it to be a "large" network :o)

Again, thanks for the informations.

--
Open WebMail Project (http://openwebmail.org)


---------- Original Message -----------
From: Antony Stone <Antony@Soft-Solutions.co.uk>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Sent: Wed, 12 Nov 2003 10:43:28 +0000
Subject: Re: Forwarding GnomeMeeting to internal network

> On Wednesday 12 November 2003 10:35 am, Julien Didron wrote:
> 
> > Hello list,
> >
> > I wish to use GnomeMeeting, for which I assume the only port that needs
> > opening is 1720.
> > Now, how can I forward all incoming traffic to port 1720 on the router,
to
> > one machine on the network that doesn't have a fixed IP (DHCP), but has
> > name on the domain thanks to DDNS (ex : abox.mydomain.net).
> 
> netfilter can only redirect packets to known IP addresses.
> 
> > Another question regarding ip_conntrack. After 5 days of use, I get the
> > following error in syslog : "ip_conntrack table full, dropping packet.".
I
> > then increased the value in /proc/sys/net/ipv4/ip_conntrack_max, from
3048
> > to 8192, but I think this is a quick fix that won't get me too far ...
> 
> Several thousand active connections is a *lot*.   Unless you have a very
> large network (maybe you do?), this would suggest something sinister,
>  such as a worm-infected machine attempting to connect to other 
> machines out on the Internet and leaving lots of half-open 
> connections in the conntrack table.
> 
> Look at the entries in the conntrack table and identify what the 
> problem is instead of simply making the table larger and allowing 
> the problem to get bigger.
> 
> > Is there a mean of flushing that table ? If not, how can I lower the TCP
> > connection timeouts ?
> 
> Again, not really the right solution.   Find out what machine/s 
> is/are filling upyour conntrack tableand fix them so that they 
> don't.   A healthy network in normal operation doesn't fill up a 
> conntrack table.
> 
> Antony.
> 
> --
> 
> When do you expect the official release of the 2.6.0 kernel?
> 
> Rusty Russell: From previous releases, a pattern has emerged: 
> exactly 6 months before it's ready.                                  
>                    Please reply to the list;                         
>                                   please don't CC me.
------- End of Original Message -------




.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


