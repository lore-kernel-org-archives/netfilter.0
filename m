From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Wed, 11 Dec 2002 10:00:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D1021AE392@eketsv02.cubis.de>
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
To: netfilter@lists.netfilter.org

Munging both replies into one, my answers are inline.

> > I expect you're trying to access the FTP server on 
> 10.0.0.11 from the
> > Internet by redirecting connections to the firewall's external IP
> > address (203.100.100.1) to the FTP server.
> 
> > Take care of the FTP control connection:
> > 2. Permit INPUT on the outside interface of the firewall to TCP port
> > 21 with states NEW and ESTABLISHED
> > 3. Permit OUTPUT on the outside interface of the firewall from TCP
> > port 21 with state ESTABLISHED
> > 4. In the PREROUTING chain use DNAT to redirect packets "-p tcp -d
> > 203.100.100.1 --dport 21" (see point 2 above) to the internal server
> > at 10.0.0.11.
> > 5. Permit FORWARDing of those same packets with states NEW and
> > ESTABLISHED. 6. Permit FORWARDing of response packets ("-s 10.0.0.11
> > --sport 21") with state ESTABLISHED.
> 
> This wouldn't work at all.  INPUT shouldn't enter into it at 
> all, unless 
> the DNAT fails, and OUTPUT only if a packet is required to leave the 
> firewall machine itself, IE if that is where the connection 
> is attempted 
> from or to.

The above takes care of the control connection only. Since the Internet
machine believes it is accessing an FTP server on the firewall itself, the
latter is addressed by its FTP control connection. This means that the
packets cross the firewall's INPUT chain, before they can be DNATed in the
PREROUTING chain. I'm not entirely sure about the outbound packets, but most
things netfilter apart from NAT require symmetric rules, so I suppose you
need an OUTPUT rule to match the INPUT one.

[FTP data]

Thanks for the info, but I know all about FTP data.. What did you think
steps 7 through 15 in my recipe were for?

Tobias

