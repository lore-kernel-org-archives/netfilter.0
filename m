From: "David Luyer" <david@luyer.net>
Subject: RE: TCP delay, solved
Date: Fri, 14 Jun 2002 18:25:54 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000001c2137d$19b6b800$638317d2@pacific.net.au>
References: <002101c2137b$e44d6de0$638317d2@pacific.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002101c2137b$e44d6de0$638317d2@pacific.net.au>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

> Easy solution:
> 
>   deny (connection reset) rather than drop the connections

I meant reject.  From the man page:

   REJECT
       This  is  used to send back an error packet in response to
       the matched packet: otherwise it is equivalent to DROP  so
       it  is  a terminating TARGET, ending rule traversal.  This
       target is only valid in  the  INPUT,  FORWARD  and  OUTPUT
       chains, and user-defined chains which are only called from
       those chains.  The following option controls the nature of
       the error packet returned:

       --reject-with type
              The  type  given can be icmp-net-unreachable, icmp-
              host-unreachable,   icmp-port-unreachable,    icmp-
              proto-unreachable,   icmp-net-prohibited  or  icmp-
              host-prohibited, which return the appropriate  ICMP
              error  message  (port-unreachable  is the default).
              The option tcp-reset can be  used  on  rules  which
              only  match the TCP protocol: this causes a TCP RST
              packet to be sent back.  This is mainly useful  for
              blocking  ident  (113/tcp)  probes which frequently
              occur when sending mail to broken mail hosts (which
              won't accept your mail otherwise).

Why connection reset?  For idiots at the other end who firewall all
ICMP.

David.


