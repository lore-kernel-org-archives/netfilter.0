From: "Gary Cote" <gcote@transat-tech.com>
Subject: RE: invalid argument / 2.4.21 kernel / iptables 1.2.6a (help please!)
Date: Sat, 12 Jul 2003 08:18:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OKEKIACJCGNKMLKPKIIKEEANDBAA.gcote@transat-tech.com>
References: <024901c34598$4d6e84e0$3964a8c0@comsol.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <024901c34598$4d6e84e0$3964a8c0@comsol.co.nz>
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
To: Jeremy <jeremy@paradise.net.nz>, netfilter@lists.netfilter.org



> 
> I run a debian box with the kernel/iptables version as per the subject, I
> have also applied P-O-M patch pptp-conntrack-nat and re-compiled
> succesfully.
> 
> Just wondering if anyone knows why, when I try and execute the 
> following, I
> get an invalid argument from iptables.
> 
> IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 202.0.35.*
> (inet_ip)
> 
> is this in incompatability thing, i.e. i need to upgrade iptables 
> to 1.2.7a

It's an incompatability thing. The patch modifies some kernel
structures, and your iptables version is out of date. I'm not
familiar with iptables 1.2.7a, but 1.2.8 worked fine for me.
You can pull it off www.netfilter.org




