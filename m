From: Rick Kennell <kennell@ecn.purdue.edu>
Subject: RE: port-based filtering of IPsec packets?
Date: 25 Jul 2003 01:14:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059113683.16545.162.camel@k7.localnet>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192CB@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0192CB@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-07-24 at 16:37, George Vieira wrote:
> >Surely there must be some way of doing port-based filtering of ESP
> >packets that are known to be bound for the local host.
> If the packet isn't intended for the firewall/ipsec server, then
> it's forwarded unencrypted to the internal hosts.... I'm sure by
> then the data in decrypted right? Because it can't pass an encrypted
> packet to a host who isn't using IPSEC.
> 
> Can you put -j LOG rules in the FORWARD chain to filter on it?
> Mine appear to pickup port 23 telnet sessions... sorry if what
> you want isn't this..
> 
> 
> [root@firewall root]# iptables -I FORWARD -i ipsec0 -o eth0 -p tcp --dport 23
> [root@firewall root]# iptables -L FORWARD -n -v -x
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>     pkts      bytes target     prot opt in     out     source               destination
>        2      104            tcp  --  ipsec0 eth0    0.0.0.0/0            0.0.0.0/0          tcp dpt:23

You're using FreeS/WAN, and you're right that it creates an ipsec0
network device where you can see unencapsulated packets.

Meanwhile, I'm using the IPsec built-in to Linux v2.6.
No user-land daemon.
No ipsec0 device.
And no port-based filtering of ESP packets.

Maybe what I'm asking is going to be a FAQ in a few months when the
in-kernel IPsec catches on.  I'm fairly convinced that port- or
payload-based filtering of IPsec packets isn't presently possible with
such that environment.  Either something needs to change or I need to
get a little smarter.

Time to bother the folks on netfilter-devel?

-- 
Rick Kennell <kennell@ecn.purdue.edu>
Purdue University School of Electrical and Computer Engineering


