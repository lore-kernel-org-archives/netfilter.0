From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Command not working  in latest version
Date: 18 Feb 2003 02:37:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045532235.681.130.camel@tux.rsn.bth.se>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB5E9@EXCHANGE>
	 <200302172337.21158.pocm@mega.ist.utl.pt>
	 <1045525905.682.128.camel@tux.rsn.bth.se>
	 <200302180123.19824.pocm@mega.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302180123.19824.pocm@mega.ist.utl.pt>
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
To: "Paulo Jorge O. C. Matos" <pocm@mega.ist.utl.pt>
Cc: Khanh Tran <khanh@slc.edu>, Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-02-18 at 02:23, Paulo Jorge O. C. Matos wrote:
> Great, no more invalid arguments.
> But now the lines:
> localhost root # iptables -t nat -F
> localhost root # iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 
> 217.129.146.56
> localhost root # iptables -t nat -n -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  0.0.0.0/0            0.0.0.0/0          
> to:217.129.146.56
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> The network topology is:
> 
>             (192.168.0.1)                   (217.129.146.56)
> LAN ------   [eth0     MYMACHINE      eth1] --------- INTERNET
> 
> I want to give full access of users in the LAN to the Internet. What are 
> the commands I should give to Iptables for that?

The rule you have is fine.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

