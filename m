From: joe@princerupertlibrary.ca
Subject: something won't respond...
Date: Wed, 23 Apr 2003 12:25:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304231222380.5931-100000@orca.princerupertlibrary.ca>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

...vague I know.

Hello All:
I am having a problem with iptables that I can't figure out, hopefully someone can help.
I was able to get this capacity functional with ipchains, but we've moved 
to iptables and the new firewall is doing what it should for mail and ssh 
but not connecting to our webserver. Well, I'm not exactly sure whats going wrong. 
The only error message is one I get from my web browser 
when I try to test the firewall.  The error is:
"The operation timed out when attempting to contact 209.53.133.149"

We are running webserver behind a firewall. 
Webserver(Dynix) internal IP address = 192.168.0.244
Firewall external IP address = 209.53.133.149

The firewall script contains different commands but the following are the pertinent ones (AFAIK).

---

# enable Masquerade and forwarding
/sbin/iptables -t nat -A POSTROUTING -s $LAN_IP_NET -j MASQUERADE
/sbin/iptables -A FORWARD -j ACCEPT -i $LAN_NIC -s $LAN_IP_NET
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#This opens the www port on raven
/sbin/iptables -A INPUT -j ACCEPT -p tcp --dport 80
#Dynix also needs port 5050
/sbin/iptables -A INPUT -j ACCEPT -p tcp --dport 5050


#Open ports on Dynix machine
#First the regular port 80
/sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.0.244:80
#
#WebPAC  also needs needs port 5050 on Dynix as well
/sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 5050
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 5050 -j DNAT --to 192.168.0.244:5050

---

But I still get the error message.
Am I missing something specific re:iptables or something more obvious?

Any help REALLY appreciated.

Joe Zelwietro



