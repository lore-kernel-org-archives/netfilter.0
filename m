From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 01:14:53 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040609081453.75751.qmail@web14704.mail.yahoo.com>
References: <001c01c44d3d$31567530$1201a8c0@admin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001c01c44d3d$31567530$1201a8c0@admin>
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
To: netfilter@lists.netfilter.org

--- Rob Sterenborg <rob@sterenborg.info> wrote:
> > 7.  /sbin/iptables -A INPUT -p tcp --dport 53 
> --syn
> > -j ACCEPT #DNS
> 
> DNS uses udp for normal lookups. Only in special
> cases tcp is used.
> 
I noted --syn can only be used with protocol tcp. How
do I write a similar rule to accept connections to udp
port 53?

> You could check for tcp_flags. Certain combinations
> can be logged and/or
> dropped.
> Packets with state INVALID could normally be safely
> dropped.
> 
I don't see a good explanation of tcp-flags either on
iptables man pages or Packet Filtering HOWTO. What are
meaning of SYN,ACK,FIN,RST,URG,PSH? What combinations
can be logged/dropped?

Appreciate your comment on this issue.

Sagara



	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

