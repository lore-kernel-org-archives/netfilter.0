From: "louie miranda" <lmiranda@chikka.com>
Subject: Re: portfw on iptables 2.4 kernel problem.
Date: Tue, 10 Dec 2002 17:12:41 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016401c2a02c$4f40b0c0$0b00000a@nocpc3>
References: <014901c2a02a$0dbf59f0$0b00000a@nocpc3> <1039510905.11113.10.camel@bigblue>
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
To: Paulo Andre <pandre@darkstar.nom.za>, netfilter <netfilter@lists.netfilter.org>

> You will have to allow port 20 aswell...FTP uses both port 20 and 21
Hm, ic. But even when i do netstat -ln i dont see any open sockets on port
21.


--
thanks,
louie miranda


----- Original Message -----
From: "Paulo Andre" <pandre@darkstar.nom.za>
To: "louie miranda" <lmiranda@chikka.com>
Cc: "netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, December 10, 2002 5:01 PM
Subject: Re: portfw on iptables 2.4 kernel problem.


> On Tue, 2002-12-10 at 10:56, louie miranda wrote:
> > I have an internel ftp server w/c i want to access over my linux
router(gw)
> > Its internel IP is 10.0.0.11 and port 21. My externel IP lets say
> > 203.100.100.1.
> > I followed the docs w/c i found at linuxdoc
> > http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/forwarders.html
> > I type in this iptables rule set,
> >
> > iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> > NEW,ESTABLISHED,RELATED -j ACCEPT
> > iptables -A PREROUTING -t nat -p tcp -d $EXTIP --dport 21 -j DNAT --to
> > 10.0.0.11:21
> >
> > I enabled ip forwarding thru the kernel by typing this command, (this is
the
> > first thing i type then the iptables rule set)
> >
> > echo "1" > /proc/sys/net/ipv4/ip_forward
> >
> > svr:/# cat /proc/sys/net/ipv4/ip_forward
> > 1
> > svr:/#
> >
> > And still it does not work..
> >
> > Trying 203.100.100.1...
> > telnet: Unable to connect to remote host: Connection refused
> >
> >
> You will have to allow port 20 aswell...FTP uses both port 20 and 21
>
> >
> >
> >
> > --
> > thanks,
> > louie miranda
> >
> >
> >
>
>
>


