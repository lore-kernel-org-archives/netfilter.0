From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 07:26:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071231965.1890.21.camel@jasiiitosh.nexusmgmt.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
	 <200312120105.01557.Alistair Tonner <>>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312120105.01557.Alistair Tonner <>>
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
To: Ian Hunter <ihunter@hunterweb.net>
Cc: netfilter@lists.netfilter.org


On Fri, 2003-12-12 at 01:05, an unknown sender wrote:
> On December 11, 2003 11:11 pm, Ian Hunter wrote:
> > OK, I have a router (lucy) with a webserver (192.168.254.242) in a DMZ (off
> > eth1), and everything works fine -- when you hit my ip, you get the site,
> > all is well.  However, I get STORMS of this nonsense in my logs:
> >
> > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN URGP=0
> 
> Perhaps this is some sort of spoofing you are seeing.  -- at least at this 
> moment bart.routesys.com (204.157.6.223) does NOT appear to be alive ... 
> 	(you too that snap at 10:58 your time .. I'm looking at 12:30 my time..EST)
> 
> 
> >
> > (That's responding to these rules at the end of the FORWARD chain of filter
> > table:)
> >
> > iptables -A FORWARD -i eth1 -o ppp0 -j LOG --log-prefix "Fwd DMZ->Internet
> > DROP: "
> > iptables -A FORWARD -i eth1 -o ppp0 -j DROP
> >
> >
> > Now if web traffic is working, my "-m state --state ESTABLISHED,RELATED -j
> > ACCEPT" must be working on forwards from eth1 -> ppp0, so why am I seeing
> > these messages?  Are these broken TCP connections that netfilter doesn't
> > consider established?
> >
> > Where do I look now?
> >
> > Thanks,
> >
> > Ian
Is there any chance that port 80 traffic is being allowed in under a
rule that does not enter the connection in conntrack?
In other words, if you have a rule such as:

iptables -A FORWARD -d 192.168.254.242 -p tcp --dport 80 -j ACCEPT

The SYN packet will be sent to your web server and the web server will
respond with a SYN, ACK packet but it will not be related to anything in
the conntrack table.  The connection may be being allowed by a more
general rule than one to the web services.

So, I suppose we should ask what your ACCEPT rules look like - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


