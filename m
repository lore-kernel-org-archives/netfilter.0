From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: Firewall IP change
Date: Mon, 26 Jul 2004 15:20:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261520.57942.fred99@libertysurf.fr>
References: <40FEE340.8090907@ctwa.com> <200407261413.27558.fred99@libertysurf.fr> <200407261327.43786.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407261327.43786.Antony@Soft-Solutions.co.uk>
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

Thanks Antony,

According to your explanations I think I 'd rather to include the following 
line in my iptable script :
iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to 62.160.X.Y

But to be sure : I've got two computers on my DMZ which have IP included in 
192.168.2.0/255.255.255.0 and other computers on my LAN which have IP 
included in 172.16.0.0/255.255.0.0  and static public IP on my WAN Firewall.
So the best way is to use the line you advice me ?
Where on my script do I have to add this line ? At the beginning, just after a 
modprobe iptable_nat line ?

Last question : Do you see some clumsy things or errors in my script ?
Unfortunately I think there are .... ;-(

Thanks again for your help

Frederic



