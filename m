From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: Netfilter and multiple internet connections
Date: Wed, 16 Oct 2002 07:22:16 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34894.192.168.7.14.1034716936.squirrel@iw.k1k2.com>
References: <00d701c27441$c9578e90$0100a8c0@obsidian>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d701c27441$c9578e90$0100a8c0@obsidian>
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

> Hello,
> 
> I have a kernel 2.4.19 machine running netfilter (1.2.7a) and
> performing NAT for my internal network.  The machine has two internet
> connections, one ADSL and one via a cable provider.  I select the
> provider by changing the default gateway at the netfilter machine.
> 
> The strange thing I noticed:  when I am using cable as the default
> gateway, my firewall ruleset shows the multicast query the provider's
> router is sending me on a regular base.  But when I change the default
> gateway to direct all outgoing traffic via the ADSL link, there are no
> more log entries showing the multicast query over the cable modem.
> 
> Although when I dump the packets on the cable interface, I do see the
> Multicast queries.  The firewall ruleset stays the same.  I compared
> the loaded version, only different in packet counters.
> 
> I suspect one of the kernel parameters (/proc/sys/net/...) influences
> this behaviour.  But I don't know which one.
> Or is this behaviour netfilter specific?
> Do the packets which netfilter doesn't see get further into my machine?
>  Or are they dropped by the kernel?
> 
> Thanks,
> Jan

My guess, based on how my dual ADSL connection works, is that you will
need an extra route to send out the replies to the cable modem supplier
via the cable modem

Assume Cable is NETC and ADSL is NETA
If your default route sends everything out NETA, then even anything
that "should" be sent to the cable modem provider via NETC will go
out NETA
(e.g. cable here in Australia on Telstra requires a heartbeat sent
back to Telstra and that MUST go out the Telstra connection)

Also, if both connections are masqueraded then anything that goes out
NETA will say it is from an IP address provided by your ADSL provider
and thus will also be the wrong source for any "connection keep-alive"
traffic

As far as I understand also - it is common practice in the USA to use
egress filters that stop you from sending data out the wrong connection
(this is only relevant if either connection is not masqueraded)
- so you will need to check that also
(my ISP's in Aus don't do this - lucky me - no need for iproute2 :-)

Hope there is something here that helps you

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


