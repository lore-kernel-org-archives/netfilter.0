From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: Dynamic Deny rule
Date: Sat, 4 Jan 2003 18:29:21 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c2b41f$334d8760$0a90a8c0@boris>
References: <000101c2b405$a39f7dd0$0501a8c0@underworld>
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
To: Mark Ryan <markryan@cfl.rr.com>
Cc: netfilter@lists.netfilter.org

Mark,

Why don't you make a user table called something like
"ftp_check" then add to the chain the IPs of people that you
want to ban from connecting, finishing up with a rules that
accepts everyone else...

You probably have a fairly common setup where incoming
packets on your public interface were first inspected for
protocol and vectored on to one of a number of user tables:

$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j inet_icmp
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j inet_tcp
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j inet_udp


You probably (should) have a "tcp_allowed" chain for state matching,
something like this:

$IPTABLES -A tcp_allowed -p TCP --syn -j ACCEPT
$IPTABLES -A tcp_allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A tcp_allowed -p TCP -j DROP

which is where you send TCP sessions that you want to accept
(match address and port number), and hence your "inet_tcp" table
would look something like this:

$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 21 -j tcp_allowed    # FTP control
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 25 -j tcp_allowed    # SMTP
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 80 -j tcp_allowed    # Web
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 22 -j tcp_allowed    # SSH

would change to use the new table for FTP control connections, so that 

$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 21 -j ftp_check        # FTP control
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 25 -j tcp_allowed    # SMTP
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 80 -j tcp_allowed    # Web
$IPTABLES -A inet_tcp -p TCP -s 0/0 --dport 22 -j tcp_allowed    # SSH

and your new "ftp_check" table would have something like:

$IPTABLES -A ftp_check -p TCP -s <banned #1> -j REJECT
$IPTABLES -A ftp_check -p TCP -s <banned #2> -j REJECT
$IPTABLES -A ftp_check -p TCP -s <banned #2> -j REJECT
$IPTABLES -A ftp_check -p TCP -s 0/0 -j tcp_allowed

Where you add the "banned IP addresses" before the last rule which
is effectively the policy "accept from everyone else" but isn't done
by a default table/chain policy because if we 'accept' the ip address in
this case we need to go back to the "tcp_allowed" chain.

NB. You need to ensure the last rule remains at the end so using
"insert" rather than "append" may well be appropriate.

You can now add/remove rules from the "ftp_check" table at will
without affecting the rest of your setup. You can also choose how
you "reject" the blacklisted ones you can ignore them with "-j DROP"
reject them as above, or use an extended form and reject them
with "host unreachable", "port unreachable" etc. etc.


Mike


----- Original Message ----- 
From: "Mark Ryan" <markryan@cfl.rr.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, January 04, 2003 3:26 PM
Subject: Dynamic Deny rule


> I am trying to come up with a iptables rule that will deny ip certain ip
> addresses that I can load/unload into a file.
>  
> To clarify...i run a ftp server and sometimes people screw around and I
> want to ban them from logging in.  I need a way to add these ip's into a
> 'ban list'.  I don't want to add a new rule every time however with a
> separate rule for each ip.
>  
> Is there a way to make a file such as 'banned_ips' and have a rule look
> into that file to decide if the ip can log in or not?
>  
> Thanks,
> Mark
> 
> 
> 
> 

