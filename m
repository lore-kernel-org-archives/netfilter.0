From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT problem
Date: Sun, 30 Mar 2003 10:41:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303301041.25596.netfilter@newkirk.us>
References: <004701c2f6cc$d6192a90$0200a8c0@lynx>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004701c2f6cc$d6192a90$0200a8c0@lynx>
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
To: Alexandru Coseru <alexcos@home.ro>, netfilter@lists.netfilter.org

On Sunday 30 March 2003 09:58 am, Alexandru Coseru wrote:
> hello.. I have the folowing problem...  I have a linux gateway with
> the external IP x.x.x.x  and internal Ip 192.168.0.1.    I want to
> make a DNAT and mask a conection from the external IP , forwarded to
> one of my lan's computer , and the lan computer to see it as
> 192.168.0.1 , not x.x.x.x
>
> Example:    If a packet comes from linux.org to a specific port (let's
> say 1345) ,   i want to forward it to a lan computer ( 192.168.0.5) ,
> and mask that connection in a way that 192.168.0.5 sees the packet
> comes from 192.168.0.1 , and not from linux.org      (it's exactly as
> masquarading , but in reverse way...)

Not really "in reverse way" just on a different interface.

>                                                                  Alex

iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.5
iptables -t nat -A POSTROUTING -o eth1 -d 192.168.0.5 -j SNAT --to=20
182.168.0.1

This assumes that eth0 is the external interface (with IP x.x.x.x) and=20
eth1 is the internal with IP 192.168.0.1.  You will usually need to=20
match the traffic type as well, IE if you're DNATting http requests you=20
should add "-p tcp --dport 80" to BOTH rules.=20

j


