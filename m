From: "Ferry van Steen" <ferry.van.steen@infopart.nl>
Subject: RE: forward is not forwarding
Date: Fri, 6 Sep 2002 08:24:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c2556e$17b9eee0$1be02a0a@infopart.nl>
References: <000901c2556c$b228c340$0401000a@win2k>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c2556c$b228c340$0401000a@win2k>
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

In my scripts I use

# Enable IPv4 Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# Enable SYN Cookie protection
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
# Enable spoof protection
for f in /proc/sys/net/ipv4/conf/*/rp_filter;
  do echo 1 > $f;
done;

Anyone got others?

Kind regards,

Ferry van Steen
InfoPart Automatisering B.V.
Beeksestraat 24
4841 GC Prinsenbeek
The Netherlands
Phone: +31 (0)76 - 5 44 04 11
Fax: +31 (0)76 - 5 41 83 51
Mobile: +31 (0)6 - 28 46 47 45
E-Mail (business): ferry.van.steen@infopart.nl
E-Mail (private): freaky@bananateam.nl
MSN Messenger: freaky@freaky2000.dyndns.org
ICQ (UIN (seldom used)): 191458


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of R. Sterenborg
Sent: vrijdag 6 september 2002 8:15
To: netfilter@lists.netfilter.org
Subject: RE: forward is not forwarding

> > iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
> > iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT> Did you enable IP
forwarding at the kernel level ?

> what does "cat /proc/sys/net/ipv4/ip_forward" show ?
>
> If 0, then you need to enable IP fowarding by doing this:
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
>

Do you need netfilter ?
How about your routing table (route -n). Do you have routings like :

Destination     Gateway         Genmask
...
10.1.1.0        10.1.1.1        255.255.255.0
192.168.1.0     192.168.1.1     255.255.255.0
...


Rob




