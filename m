From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 18:40:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121840.27031.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <3F89ED5C.3050507@snapgear.com> <200310121820.59977.Herman@AerospaceSoftware.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121820.59977.Herman@AerospaceSoftware.com>
Content-Disposition: inline
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

The real problem that I'm trying to solve is this:
Several hosts need to acces a gov service that uses Java and a certain port.  
I do not know which machine/machines will run and I don't know what their IP 
is going to be, due to DHCP.  I could limit it to one machine with a fixed IP 
just to get started though.

To test this, I'm experimenting with Nectarine radio, since that is easier 
than farting around with a government server.  If I can't get Nectarine to 
work, then I have no hope of getting the gov thing to work.


   On the FORWARD chain, try iptables -v -L FORWARD -t filter.  That will
   isolate just your FORWARD rules.  I gather you are not showing ANY active
   forward rules?  Not even your default policy?

iptables -L FORWARD -n
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

nothing...

iptables -t nat -v -L
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destinat                   
ion

nothing much either...

I suppose some modules are missing, but what?

What could be needed to make port forwarding work, that is not already loaded 
to make masquerade work?  At least something is working but gawddammit, this 
doesn't make sense to me.

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com


