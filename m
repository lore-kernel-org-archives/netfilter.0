From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ipmasqadm translation
Date: Tue, 4 Jun 2002 23:54:33 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042254.g54MsYA11829@Networker.rockstone.co.uk>
References: <003901c20c1a$2ef7ccf0$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003901c20c1a$2ef7ccf0$6301a8c0@JJONES1>
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
To: Iptables <netfilter@lists.samba.org>

On Tuesday 04 June 2002 11:50 pm, John Jones wrote:

> How would I translate this rules from ipchains/ipmasqadm to iptables:
>
>   ipmasqadm portfw -a -P udp -L 10.0.0.4 5162 -R 192.168.1.200 5162

Hi John.   Back for more, eh :-) ?

I can't remember the syntax of ipmasqadm well enough to be completely sure 
what the above rule does, but I can tell you that so long as you have the 
connection tracking nat module loaded, you only need to specify an iptables 
rule in one direction and it will automatically handle the replies for you.

You only need to specify iptables nat rules both ways if it's possible for 
the connection to be initiated from either end.

> Would the following work:
>
>  iptables -A PREROUTING -t nat -p udp -d 10.0.0.4 --dport 5162 -j DNAT
> --to 192.168.1.200:5162
>  iptables -I FORWARD 1 -p udp -d 192.168.1.200 --dport 5162 -j ACCEPT
>
> Do I have the translation right, there?  Or did ipmasqadm do two-way
> forwarding, and I need to do so with another set of rules like so:
>
>  iptables -A PREROUTING -t nat -p udp -d 192.168.1.200 --dport 5162 -j
> DNAT --to 10.0.0.4:5162
>  iptables -I FORWARD 1 -p udp -d 10.0.0.4 --dport 5162 -j ACCEPT

I suggest you always have a rule:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED - j ACCEPT

to handle reply packets etc without needing to bother too much about what 
they look like.

Maybe someone else on this list can say more about what your ipmasqadm rule 
really did.


Antony.

