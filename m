From: "Philippe Anctil" <z77y16@hotmail.com>
Subject: Re: safe default chain policies
Date: Fri, 02 Apr 2004 14:12:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY16-F20adOQ2IR5a800037809@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > May I ask what are your arguments in favor of putting filter output and
> > forward chains to drop?
>
>The secure attitude uses the same argument as for FORWARD - you block all
>traffic except that which you know you want and write ACCEPT rules for, and
>you can then be sure your machine isn't communicating in any other way than
>you want it to.

Yes I understand this attitude is the base of building a secure firewall. I 
was actually applying it abusively.

The thing is, traffic hitting the three filter chains have different origins 
and different purpose. Allow me to review the secure approach for each table 
individually.

I find setting up the INPUT chain to DROP unquestionable. This is because 
traffic hitting this chain gives direct access to services on the main gate.

Traffic hitting the OUTPUT originates from the firewall box itself. Why 
wouldn't we want a program to communicate outside? Because it is not 
authorized. What kind of unauthorized program could be installed on my box? 
Well this question does not exactly sounds like the right one. Who could 
install unauthorized programs on the box? Only those who have remote / 
physical access to the box. For an entreprise level filtering bug I'd 
probably go for a DROP. For my home network, I'll put it to ACCEPT. I may 
reconsider this, but my current ruleset does not make sense anyway:

iptables -P OUTPUT DROP
iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s $internal_ip -j ACCEPT
iptables -A OUTPUT -s $xternal_ip -j ACCEPT

Now what about the FORWARD chain? Traffic hitting this chain has two 
possible origins and a corresponding destination.

A. Local network traffic going outside. For my home network, I am not 
restricting  outgoing traffic. This type of traffic does not justify a 
restricted policy.

B. Outside traffic heading back (or even towards?) to the local network. I 
think the origin of the traffic totally justifies this chain to be set to 
DROP. There is no limit to what wacked attempts outsiders may try.

But allow me to argue a little more on the FORWARD table subject. This table 
tends to have very loose restrictions. Mine's like this:

iptables -P FORWARD DROP
iptables -A FORWARD -s $network_addr -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Here I am trusting iptables entirely : in the hypothesis someone more clever 
than me finds a way of tricking the state machine, too bad for 'me home 
network. How much more would I trust iptables if I were to configure this 
table with a default ACCEPT policy? Iptable is good enough to identify 
established and related connections. How would a default ACCEPT policy would 
make it less good? I mean, if there is a way for an outsider to hit the 
FORWARD chain directly, outside of any legitimate connection process, what 
is the risk of having the chain set to ACCEPT? Shouldn't iptable discard the 
rubbish?

As I said above, I'll set FORWARD to DROP for my peace of mind. But I can't 
help thinking it does much of the work by itself.

Thank you very much for your helpful feedback! I hope you enjoyed the read 
;-)

_________________________________________________________________
MSN Search, le moteur de recherche qui pense comme vous !  
http://fr.ca.search.msn.com/


