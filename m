From: Wasim Bashir <wasim.bashir@nexor.co.uk>
Subject: RE: FTP Forwarding
Date: Fri, 22 Nov 2002 10:37:21 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c29213$23cdd0c0$e6353fc1@nexor.co.uk>
References: <FLEKIPPLAEDMJMOOBBDPGEOBDIAA.stewart.thompson@shaw.ca>
Reply-To: "wasim.bashir" <wasim.bashir@nexor.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPGEOBDIAA.stewart.thompson@shaw.ca>
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
To: "stewart.thompson" <stewart.thompson@shaw.ca>, 'Bantam' <netfilter@end.yorks.com>, 'netfilter' <netfilter@lists.netfilter.org>

Hi,

neither ip_nat_ftp and ip_conntrack_ftp are loaded, how do i load these ?

I'm using redhat 8.

Regards,

Wasim


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Stewart
Thompson
Sent: 22 November 2002 10:32
To: Bantam; netfilter
Subject: RE: FTP Forwarding


Wasim:

	If you do an lsmod, does it show  that
ip_nat_ftp and ip_conntrack_ftp are loaded?
They are required to make ftp work through nat.
Also what Linux Distro and Iptables are you using?

Stu.........



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Bantam
Sent: November 22, 2002 2:08 AM
To: netfilter
Subject: FTP Forwarding

Hi,

I've been trying to forward port 21 to an ftp server on another machine, IP
address  10.0.0.199.

eth1 - external (connected to the net)
eth0 - internal

/sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
/sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 -j DNAT --to
10.0.0.199:21

but can't get it to work..

any ideas ?

Thanks

Wasim





