From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: droping in forward/postrouting
Date: Sat, 31 Jul 2004 09:11:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091275890.17060.20.camel@aflores>
References: <OF314C1F3E.9AD1008B-ON80256EE0.005745C8@start-global.com>
	 <a0f69e504072913084fc39ee8@mail.gmail.com>
	 <a0f69e504072923151d18afa3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504072923151d18afa3@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

	Hi there,

> hi
> I duno but filter table "FORWARD" not blocking/dropping any of these
> site actaully these are spywares a gift from windowz and why i want to
> drop these dirty shits coz they consume lot of my precious bandwidth
> "dialup" ;)
> 
> iptables -I FORWARD -s 0/0 -d 66.35.229.0/24 -j DROP
> iptables -I FORWARD -s 0/0 -d  212.4.208.105 -j DROP
> iptables -I FORWARD -s 0/0 -d 66.35.229.185 -j DROP
> iptables -I FORWARD -s 0/0 -d  64.152.73.0/24 -j DROP
> iptables -I FORWARD -s 0/0 -d  66.35.229.236 -j DROP
> 
> However PREROUTING do working and dropping it :)
> 
> iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.0/24 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  212.4.208.105 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.185 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.0/24 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.236 -j DROP
> 
> Therefore my confusion still exists, as rule is that to filter in
> fiter table and other things NATting , mangling in nat and mangle
> table respectively.
> 
> Then why FOWARD not blocking these sites and nat PREROUTING does?

	If you're using both (drop in prerouting and forward), the packets are
dropped in nat prerouting. You know why? When the packet starts the
'netfilter journey' it goes to:
	1.  table mangle -> chain PREROUTING
	2.  table nat -> chain PREROUTING (you're dropping packets here)
		(routing decision)
	3b. table mangle -> chain FORWARD
	4b. table filter -> chain FORWARD
	5.  table mangle -> chain POSTROUTING
	6.  table nat -> chains POSTROUTING

	Remove the drop in PREROUTING, and change your FORWARD rules to
something like:

iptables -A FORWARD -i LAN_IF -o EXT_IF -d spywarez_site/mask -j DROP

	You don't have to specify the source if the source is any (-s 0/0).

Regards,
Alejandro Flores

