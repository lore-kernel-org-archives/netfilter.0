From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 17:34:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309051725090.3111@xena.cft.ca.us>
References: <7C9884991ADAE0479C14F10C858BCDF52E367E@alderaan.smgtec.com>
 <03a601c373d5$c0236800$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03a601c373d5$c0236800$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter@lists.netfilter.org

On Fri, 5 Sep 2003, Peter Marshall wrote:
> My setup would be something like this
> iptables -t nat -A PREROUTING -p tcp --dport 22 -i$EXT_DEV -j DNAT
>        --to-destination $InternalIPofFirewall
> ( this would direct all ssh connections on port 22 to the firewall)

Right, but if I remember the original configuration, the internal boxes are
all on non-routable IPs anyway, so the only one you can specify from the
global internet is the firewall's external address.  So this rule would not
be necessary.

> Is the only other possibility (other than sshing to the firewall first and
> then to the internal box) to have another port listen on a high port, and
> set up my internal box to listen on that high port for ssh ???

Right, you could use the firewall as a Janus host, or you could DNAT
special ports to be mapped to port 22 on frequently-used internal hosts.
Let's say 10000 is for smtp.caris.com, 10001 is for boss.caris.com, etc.
Then you do "ssh -p 10001 firewall.caris.com" (the external address), and
you have a ssh connection to "boss".  I would leave the internal machines
listening on port 22, and rely on DNAT to change 10000, 10001, etc. to 22
on the right host.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

