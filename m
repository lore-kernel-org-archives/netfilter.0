From: "Julio Gruskin - PWeb ONline!" <juliog@patagoniaweb.com>
Subject: iptables problem when booting up
Date: Wed, 15 May 2002 20:26:25 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <NFBBLDGPFEDEINHFAMPBIEONDDAA.juliog@patagoniaweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I built the iptables ruleset (/etc/sysconfig/iptables) in my RH7.2. It seems
to work okay when booting my system as it shows when 'iptables -L -n' but
some rules are not okay, I can't connect to the internet from my internal
network even though the rule '-A INPUT -s 192.168.1.0/255.255.255.0 -i
eth0 -j ACCEPT' is placed. The weird thing is that when I run 'service
iptables restart' it restarts the firewall rules and the problem is fixed.



