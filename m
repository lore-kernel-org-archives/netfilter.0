From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: iptables -f locks me out?
Date: Sat, 18 Oct 2003 21:43:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310182125530.8624@xena.cft.ca.us>
References: <001701c395af$409f1a10$0201a8c0@ERICDEV>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c395af$409f1a10$0201a8c0@ERICDEV>
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
To: Eric Gibson <aithien@bellsouth.net>
Cc: netfilter@lists.netfilter.org

On Sat, 18 Oct 2003, Eric Gibson wrote:
>     Is there anyway around this? It never used to happen with ipchains...
> Whenever I run iptables -F, or stop my shorewall script with it's init
> script (or if there is an error in the config file, and it stops itself.)
> it completely locks me out of remote access and I...

"iptables -F" would clear the filter table, and if the nat or mangle tables
still had rules, something bad might happen.  Also the chains still have
their individual policies, some of which are DROP.  That's probably what
is killing you.  You need to set the policies of all the builtin chains to
ACCEPT.

Consider using iptables-save and iptables-restore.  I've replaced my
original firewall script with one like this.  For the payload I dumped my
rules using iptables-save, and then neatened and annotated them, replacing
numeric ports and protocols with keys from /etc/services and
/etc/protocols.  If there's a syntax error in any one table, that table
will not be replaced;  otherwise it is replaced atomically.  No need to
flush rules, opening up your box for a second.

iptables-restore <<EOF
*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
# auth queries need to be rejected actively to avoid annoying timeouts.
-A INPUT -p tcp -m tcp --dport auth -j REJECT --reject-with icmp-port-unreachable
COMMIT

*nat
:PREROUTING DROP [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
# My user-defined chain
:COUCHNET - [0:0]

# Ports and protocols that are allowed
#   ssh secure shell
-A PREROUTING -p tcp -m tcp --dport ssh                         -j ACCEPT
# etc. etc.
EOF

It also has a function which restores a pristine state (with ACCEPT
policies), which is executed when you do "/etc/init.d/firewall stop".

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

