From: "Paulo Jorge O. C. Matos" <pocm@mega.ist.utl.pt>
Subject: Re: Command not working  in latest version
Date: Tue, 18 Feb 2003 01:23:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302180123.19824.pocm@mega.ist.utl.pt>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E9@EXCHANGE> <200302172337.21158.pocm@mega.ist.utl.pt> <1045525905.682.128.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045525905.682.128.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Khanh Tran <khanh@slc.edu>, Netfilter <netfilter@lists.netfilter.org>

Great, no more invalid arguments.
But now the lines:
localhost root # iptables -t nat -F
localhost root # iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 
217.129.146.56
localhost root # iptables -t nat -n -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  0.0.0.0/0            0.0.0.0/0          
to:217.129.146.56

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

The network topology is:

            (192.168.0.1)                   (217.129.146.56)
LAN ------   [eth0     MYMACHINE      eth1] --------- INTERNET

I want to give full access of users in the LAN to the Internet. What are 
the commands I should give to Iptables for that?

Best regards,

Paulo

> No no, you shouldn't recompile your kernel at all.
> The only thing you should recompile is the userspace iptables.
>
> KERNEL_DIR=/usr/src/linux-2.4.20 make install
>
> something like that.


