From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 11:56:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c44e07$fbc1b490$1201a8c0@admin>
References: <20040609081453.75751.qmail@web14704.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

> > > 7.  /sbin/iptables -A INPUT -p tcp --dport 53
> > --syn
> > > -j ACCEPT #DNS
> >
> > DNS uses udp for normal lookups. Only in special
> > cases tcp is used.
> >
> I noted --syn can only be used with protocol tcp. How
> do I write a similar rule to accept connections to udp
> port 53?

Packets with syn set are (almost ? someone please correct me if I'm
wrong) always in NEW state.
So, a similar rule would be :

iptables -A INPUT -p udp --dport 53 -j ACCEPT

which implies :

iptables -A INPUT -m state --state NEW -p udp \
  --dport 53 -j ACCEPT

> I don't see a good explanation of tcp-flags either on
> iptables man pages or Packet Filtering HOWTO. What are
> meaning of SYN,ACK,FIN,RST,URG,PSH? What combinations
> can be logged/dropped?

A little info I found about tcp flags :
http://www.whitehats.ca/main/members/Seeker/seeker_tcp_header/seeker_tcp_header.html
http://www.spirit.com/Network/net0900.html
http://www.securityfocus.com/infocus/1524
I don't think it's all that you want to know about it but it's as much
as I could find right now.
Not sure what URG and PSH really do.

You could DROP :
- SYN,FIN SYN,FIN (Both SYN and FIN set in 1 packet.)
- SYN,RST SYN,RST (SYN and RST set, probably a scan)
- Anybody any additions, comments ?


Gr,
Rob


