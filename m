From: Rhaoni Chiu Pereira <rhaoni@sistemica.info>
Subject: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 15:45:27 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083350727.40929ec75a56c@sistemica.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi List,

    I must implement a few firewallrules but I'm a little bit lost. I use a
transparent proxy with this following rule:

    IPTABLES -t nat -A PREROUTING -p tcp -i eth1 -s 192.168.0.0/16 -d !
192.168.0.0/16 --dport 80 -j REDIRECT --to-port 3128

     The -d parameter is because I have a few VPN's and my squid uses a
tcp_outgoing_address, so ... Now I must create some exceptions for two IP's more
than the 192.168.0.0/16 net but I don't know how ... any ideas ?

     the Ip's are 129.37.0.113 and 32.97.118.242

thanks,

Rhaoni Chiu Pereira


