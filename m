From: =?koi8-r?Q?=22?=Vladimir Potapov=?koi8-r?Q?=22=20?=<varyag18@mail.ru>
Subject: iptables ceases to work after night
Date: Thu, 11 Sep 2003 10:39:42 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19xL7G-000NJQ-00.varyag18-mail-ru@f10.mail.ru>
References: <1063028676.1133.11.camel@elendil.intranet.cartel-securite.net>
Reply-To: =?koi8-r?Q?=22?=Vladimir Potapov=?koi8-r?Q?=22=20?=<varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063028676.1133.11.camel@elendil.intranet.cartel-securite.net>
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
To: =?koi8-r?Q?=22?=Cedric Blancher=?koi8-r?Q?=22=20?= <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Yesterday at evening my packet filter with iptables worked fine.Today at morning , I see that he don't forwarding packet from DMZ to local and back.And this thing I see every morning.After I reboot my machine it's work fine.I think that my 3com cards have some bugs.In log there no entries about this . My rules is:


#Allow from local to DMZ and back


-A FORWARD -d 192.168.1.0/255.255.255.0 -i eth1 -o eth2 -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT 

-A FORWARD -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT

-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 3128 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT

-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 25 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT

-A FORWARD -s 192.168.1.0/255.255.255.0 -d 192.168.5.0/255.255.255.0 -i eth2 -o eth1 -p tcp -m tcp --dport 110 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT


