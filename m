From: ads nat <adsnat@yahoo.com>
Subject: IPTABLES routine help.
Date: Wed, 23 Jun 2004 20:08:37 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040624030837.99693.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I am running Redhat Linux 9 server as firewall, 
routing two subnets "eth1" 192.168.0.0 and "eth2"
10.0.0.1. "eth0" is Internet Interface.

10.0.0.2 is DMZ machine on which Web server is
runnung.
192.168.0.1 is a LAN. LAN users can access web server,
properly DNATed through router/firewall.

I have created web site at 10.0.0.2:80 on which I am
putting index.htm page to display notice for LAN
users.

I am DNATing LAN user by "iptables -t nat -A
PREROUTING -s 192.168.0.0/24 -i eth1 -p tcp -m tcp
--dport 80 -j DNAT --to-destination 10.0.0.2:80".

Problem :
whenever LAN user wish to acces internet he is
forcebly taken to "index.htm" at 10.0.0.2:80. I have
click link on index.htm to "www.google.com". Even when
I clicks on link on "index.htm" page, it goes to
index.htm page only.
I tried putting "-m state NEW", thinking only when
packet state is new it will take to "index.htm" and
when user click on the link on "index.htm" page it
will divert them to linked page. But this does not
happen.

Please guide me to rule which will take user to
index.htm page at 10.0.0.2:80 only at first time. When
user click link on index.htm page destined for some
other page(www.google.com) It should allow user to go
to google or whatever.

If it is not possible by iptables, is there any
technology by which i can achieve this.
Thanks for support.



		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 

