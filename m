From: Juan Hernandez <alucard@kanux.com>
Subject: simple questions to finally understand netfilter
Date: 27 Nov 2003 11:41:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069947718.9126.39.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Lista de netfilter <netfilter@lists.netfilter.org>

Hi there...

I'm using this script and I'd like to understand it a bit better...
This is redirecting everything that comes from to port 25 to another
server and this router is also a webserver.. Let me see if I understand
every step

1) This rule tells netfilter to drop any packet forwarding I guess
iptables -P FORWARD DROP

2) This one only accepts related and stablished packets
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

3) This one forwards everything from the mailserver to the outside i
guess
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT

4) and this rule redirects everything in port 25 to the mailserver
iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 25 -j DNAT
--to-destination 192.168.0.2:25

Now these are the questions I have about netfilter

1) What does the first rules do exactly?? 

2) How come if I add this rule to redirect everything from port 666 to
the mailserver's ssh port it doesnt work?? 

iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 666 -j DNAT
--to-destination 192.168.0.2:22 

Is it because I have to make another rule to forward the packets comming
back from the mailserver's ssh? how come is not using the one alredy in
(number 2)? 

3) How do I use DROP with a range of port in oder to close everyhing
else to the outside? or is there other way to do it??

Thanks a lot for your help...

Juan



