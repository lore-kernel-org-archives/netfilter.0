From: Ryan Barr <ryan@ryanbarr.com>
Subject: Re: FTP Passive mode Connection Loss - iptables rh9
Date: Tue, 18 May 2004 19:41:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <141F6FA6-A93E-11D8-9187-000A957469CC@ryanbarr.com>
Mime-Version: 1.0 (Apple Message framework v613)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks Bernd,
	I loaded the MASQUERADE module because I was trying everything I could 
think of to get this working... I will unload it and check that kernel 
module and see what happens.. As far as the rules I have been applying 
are concerned, did you see any improvements that can be made?  I really 
am at a loss on this one.  I took a look, and the scripts seem pretty 
close over all, any ideas would be appreciated.  Again, thanks!

-Ryan


Message: 13
Date: Tue, 18 May 2004 22:04:56 +0200
From: Bernd Strebel <b.strebel@digitec.de>
Organization: digitec GmbH
To: netfilter@lists.netfilter.org
Subject: Re: FTP Passive mode Connection Loss - iptables rh9


Sometime ago we have similar troubles in a clustered ftp environment.

After replacing MASQUERADE with SNAT for the external interface, most of
the problems go away.

Today we can use a simple

-t nat -A PREROUTING ... -d IP_EXT -j DNAT    --to-destination IP_DMZ
         -A FORWARD    ... -d IP_DMZ -j ACCEPT

to provide active/passive ftp via an transparent ftp-proxy located in
the DMZ to the external world.

The ftp-proxy use active ftp to connect through an internal firewall to
the final destination.

As far as I can see, your rules are ok. But why do you load the
MASQUERADE module, if you don't use it? I'm not an expert, but NAT and
connection tracking must be a tricky thing for ugly protocols like ftp.

Have you checked ip/port from the PASV command at the client side? Do
you get the right (external) address?



