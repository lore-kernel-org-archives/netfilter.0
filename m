From: Paul Dunphy <pdunphy@research.ryerson.ca>
Subject: Stateful FW Questions
Date: Thu, 04 Jul 2002 16:04:27 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020704160414.022d3d40@mailhost.csca.ryerson.ca>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi Everyone,

I'm new to stateful firewalls (can you tell?!), and I have a couple of 
iptables-related questions:

Question 1:

Say I have a simple firewall with two NICs, and rules as follows:

iptables -A internal-external -p tcp --dport www -j ACCEPT
iptables -A internal-external -p tcp --dport https -j ACCEPT
iptables -A internal-external -p tcp --dport telnet -j ACCEPT
iptables -A internal-external -p tcp --dport ssh -j ACCEPT
iptables -A internal-external -j REJECT

where internal-external is a user-defined chain to be used in the FORWARD 
chain. So with this, I am allowing my internal users to access www, https, 
telnet and ssh on machines outside. Now, if I define an external-internal 
chain to handle communications going the other way (i.e. from the outside 
world to the internal LAN), can I simply say:

iptables -A external-internal -state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A external-internal -j DROP

or should I do something like this instead:

iptables -A external-internal -p tcp -m state --state ESTABLISHED --sport 
www -j ACCEPT
iptables -A external-internal -p tcp -m state --state ESTABLISHED --sport 
https -j ACCEPT
iptables -A external-internal -p tcp -m state --state ESTABLISHED --sport 
telnet -j ACCEPT
iptables -A external-internal -p tcp -m state --state ESTABLISHED --sport 
ssh -j ACCEPT
iptables -A external-internal -j DROP

In other words, is there any reason to itemize the established connections 
one by one, or can I simply allow all ESTABLISHED connections through from 
the outside, and rely on the internal-external chain to limit the type of 
connections that can be initiated from inside? Is one way more secure than 
the other?

Question 2:

Another related question: If I want to use "-m state --state ESTABLISHED" 
as I'm doing above in the external-internal chain, do I also have to 
specify "-m state" or "-m state NEW" in the internal-external chain so that 
the state of the connection will be tracked, or will it simply work the way 
it is written above? (Are all connections tracked?)

As always, your help is greatly appreciated. Thanks!

Paul


---------------------------------------------------------------------
Paul T. Dunphy, P.Eng.
Systems Administrator/Research Engineer
Centre for the Study of Commercial Activity
Toronto, Ontario, CANADA


