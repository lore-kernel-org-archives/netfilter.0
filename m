From: "Jan" <Oblivion@tiscali.be>
Subject: Re: Netfilter and multiple internet connections
Date: Wed, 16 Oct 2002 01:42:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002101c274a4$76ec9570$0100a8c0@obsidian>
References: <00d701c27441$c9578e90$0100a8c0@obsidian> <34894.192.168.7.14.1034716936.squirrel@iw.k1k2.com>
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
To: Andrew Smith <nfml@k1k2.com>, netfilter@lists.netfilter.org

> My guess, based on how my dual ADSL connection works, is that you will
> need an extra route to send out the replies to the cable modem supplier
> via the cable modem
>
> Assume Cable is NETC and ADSL is NETA
> If your default route sends everything out NETA, then even anything
> that "should" be sent to the cable modem provider via NETC will go
> out NETA
> (e.g. cable here in Australia on Telstra requires a heartbeat sent
> back to Telstra and that MUST go out the Telstra connection)
>
> Also, if both connections are masqueraded then anything that goes out
> NETA will say it is from an IP address provided by your ADSL provider
> and thus will also be the wrong source for any "connection keep-alive"
> traffic
>
> As far as I understand also - it is common practice in the USA to use
> egress filters that stop you from sending data out the wrong connection
> (this is only relevant if either connection is not masqueraded)
> - so you will need to check that also
> (my ISP's in Aus don't do this - lucky me - no need for iproute2 :-)
>
> Hope there is something here that helps you
>
> --
> -Cheers
> -Andrew

Thanks Andrew,
your comments made me think.  From a remote server, I performed a constant
ping to both of my internet IP addresses.  Only the ones for the currently
active default gateway got trough to iptables.  Changing the default
gateway, changed the ping that got trough.  So I started playing with the
kernel parameters in /proc/sys/net/ipv4/conf/...
What I saw was that setting /proc/sys/net/ipv4/conf/eth1/rp_filter to "0"
fixed the issue I saw.  I googled for rp_filter, and found the Linux
Advanced Routing howto explaining this setting.

rp_filter = Reverse Path Filtering

Basicly, a packet coming in on one interface (provider1) is dropped when the
"reply" would go out on another interface (provider2).

Now I know for sure iptables isn't faulty, I was just wondering why I only
got firewall log entries from the active default gateway interface.

Jan



