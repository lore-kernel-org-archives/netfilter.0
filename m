From: Aldo Lagana <ALagana@p21.com>
Subject: RE: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 14:59:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35C83@newman.p21.com>
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
To: 'Rhaoni Chiu Pereira' <rhaoni@sistemica.info>, netfilter@lists.netfilter.org

I dont understand your question but I assume that for those 2 IPs you DON'T
want squid to proxy - rules like this work for me:

iptables -t nat -I PREROUTING -d 129.37.0.111 --dport 80 -j ACCEPT
iptables -t nat -I PREROUTING -d 32.97.118.242 --dport 80 -j ACCEPT

-I inserts the rule at the top of the chain thus firing it when it hits
those IPs...not the best method, but a quick kludge that works for me.

-----Original Message-----
From: Rhaoni Chiu Pereira [mailto:rhaoni@sistemica.info]
Sent: Friday, April 30, 2004 2:45 PM
To: netfilter@lists.netfilter.org
Subject: Multi Addressing... is it possible ?


Hi List,

    I must implement a few firewallrules but I'm a little bit lost. I use a
transparent proxy with this following rule:

    IPTABLES -t nat -A PREROUTING -p tcp -i eth1 -s 192.168.0.0/16 -d !
192.168.0.0/16 --dport 80 -j REDIRECT --to-port 3128

     The -d parameter is because I have a few VPN's and my squid uses a
tcp_outgoing_address, so ... Now I must create some exceptions for two IP's
more
than the 192.168.0.0/16 net but I don't know how ... any ideas ?

     the Ip's are 129.37.0.113 and 32.97.118.242

thanks,

Rhaoni Chiu Pereira



Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



