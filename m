From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Not quite understanding DNAT
Date: Thu, 24 Jul 2003 13:47:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030724174740.GB26983@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122E08@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E08@alderaan.smgtec.com>
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

> 'ip addr' would look like this to me:
> 
> 1: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>     link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
> inet 192.168.1.1/27 brd 192.168.1.31 scope global eth0
> inet 192.168.1.2/27 brd 192.168.1.31 scope global secondary eth0:0
> inet 192.168.1.3/27 brd 192.168.1.31 scope global secondary eth0:1
> inet 192.168.1.4/27 brd 192.168.1.31 scope global secondary eth0:2
> ...
> inet 192.168.1.30/27 brd 192.168.1.31 scope global secondary eth0:30

Absolutely. The "ip" utility must be used instead of "ifconfig", "route",
"arp" and other obsolete utilities.

Another note is that you can change the name of the interface with:

ip link set DEVICE name NEW-NAME

which will get rid of the ':' notation. This is most of the time the
casue of the problem with some applications...

Ramin

