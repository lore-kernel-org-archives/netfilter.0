From: Dieter Braun <dieter.braun@onevision.de>
Subject: ftp connection tracking and frox proxy
Date: Tue, 28 Jan 2003 17:17:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E36AD14.4AAA111F@onevision.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------63DE009080044A5BD4EB13B4"
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
To: netfilter@lists.netfilter.org


--------------63DE009080044A5BD4EB13B4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I just set up a transparent ftp proxy using frox 0.7.6. Works pretty
well, only state matching (iptables 1.2.5-58) for the connections
between the client and frox doesn't work as I would have expected. Here
are the rules that are necessary:

----------------------------------------------------------------------------

# Redirection to frox port
$PROG -t nat -A PREROUTING -p tcp -i br0 -s $INTRANET --sport 1024: -d !
$INTRANET --dport 21 -j REDIRECT --to-ports 2121

# ftp request client to frox
$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT --dport
2121 -m state --state NEW,ESTABLISHED -j ACCEPT
$PROG -A OUTPUT -p tcp -s $INT --sport 2121 -o br0 -d $INTRANET --dport
1024: ! --syn -m state --state ESTABLISHED -j ACCEPT
                                # as expected

# data channel frox to client, passive ftp
$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT --dport
1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$PROG -A OUTPUT -p tcp -s $INT --sport 1024: -o br0 -d $INTRANET --dport
1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
                                # would expect to need only
ESTABLISHED,RELATED in the first line
                                # would expect to need only ESTABLISHED
in the second line
                                # (didn't try NEW,ESTABLISHED without
RELATED yet)

# data channel frox to client, active ftp
$PROG -A OUTPUT -p tcp -s $INT --sport 20 -o br0 -d $INTRANET --dport
1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT --dport
20 ! --syn -m state --state ESTABLISHED -j ACCEPT
                                # would expect to need only
ESTABLISHED,RELATED in the first line

# ftp request frox to internet
$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport 21
-m state --state NEW,ESTABLISHED -j ACCEPT
$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 21 -d $EXT --dport 1024: !
--syn -m state --state ESTABLISHED -j ACCEPT

# data channel internet to frox, passive ftp
$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport
1024: -m state --state ESTABLISHED,RELATED -j ACCEPT
$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 1024: -d $EXT --dport 1024:
! --syn -m state --state ESTABLISHED -j ACCEPT

## data channel internet to frox, active ftp
#$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 20 -d $EXT --dport 1024:
-m state --state ESTABLISHED,RELATED -j ACCEPT
#$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport 20
! --syn -m state --state ESTABLISHED -j ACCEPT
----------------------------------------------------------------------------

(You might wonder about the device br0: frox works with bridging! .-)))

The state matching rules for the "external" connections to the internet
work as expected. But for the "internal" data connections between frox
and the clients, frox always needs to build a NEW data connection
instead of a RELATED one. Since this is only for the internal
connections, not for the external ones, I have the feeling that this
might be due to frox. (Didn't find any frox mailing list; does anybody
know one?) Or is there any problem with ip_conntrack_ftp for a ftp
server? Perhaps somebody has any better clue.

Greetings,
Dieter


--------------63DE009080044A5BD4EB13B4
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<p>I just set up a transparent ftp proxy using frox 0.7.6. Works pretty
well, only state matching (iptables 1.2.5-58) for the connections between
the client and frox doesn't work as I would have expected. Here are the
rules that are necessary:
<p><tt>----------------------------------------------------------------------------</tt>
<br><tt># Redirection to frox port</tt>
<br><tt>$PROG -t nat -A PREROUTING -p tcp -i br0 -s $INTRANET --sport 1024:
-d ! $INTRANET --dport 21 -j REDIRECT --to-ports 2121</tt><tt></tt>
<p><tt># ftp request client to frox</tt>
<br><tt>$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT
--dport 2121 -m state --state NEW,ESTABLISHED -j ACCEPT</tt>
<br><tt>$PROG -A OUTPUT -p tcp -s $INT --sport 2121 -o br0 -d $INTRANET
--dport 1024: ! --syn -m state --state ESTABLISHED -j ACCEPT</tt>
<br><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# as expected</tt><tt></tt>
<p><tt># data channel frox to client, passive ftp</tt>
<br><tt>$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT
--dport 1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT</tt>
<br><tt>$PROG -A OUTPUT -p tcp -s $INT --sport 1024: -o br0 -d $INTRANET
--dport 1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT</tt>
<br><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# would expect to need only ESTABLISHED,RELATED in the first line</tt>
<br><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# would expect to need only ESTABLISHED in the second line</tt>
<br><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# (didn't try NEW,ESTABLISHED without RELATED yet)</tt><tt></tt>
<p><tt># data channel frox to client, active ftp</tt>
<br><tt>$PROG -A OUTPUT -p tcp -s $INT --sport 20 -o br0 -d $INTRANET --dport
1024: -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT</tt>
<br><tt>$PROG -A INPUT -p tcp -i br0 -s $INTRANET --sport 1024: -d $INT
--dport 20 ! --syn -m state --state ESTABLISHED -j ACCEPT</tt>
<br><tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
# would expect to need only ESTABLISHED,RELATED in the first line</tt><tt></tt>
<p><tt># ftp request frox to internet</tt>
<br><tt>$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport
21 -m state --state NEW,ESTABLISHED -j ACCEPT</tt>
<br><tt>$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 21 -d $EXT --dport
1024: ! --syn -m state --state ESTABLISHED -j ACCEPT</tt><tt></tt>
<p><tt># data channel internet to frox, passive ftp</tt>
<br><tt>$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport
1024: -m state --state ESTABLISHED,RELATED -j ACCEPT</tt>
<br><tt>$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 1024: -d $EXT --dport
1024: ! --syn -m state --state ESTABLISHED -j ACCEPT</tt><tt></tt>
<p><tt>## data channel internet to frox, active ftp</tt>
<br><tt>#$PROG -A INPUT -p tcp -i eth2 -s 0/0 --sport 20 -d $EXT --dport
1024: -m state --state ESTABLISHED,RELATED -j ACCEPT</tt>
<br><tt>#$PROG -A OUTPUT -p tcp -s $EXT --sport 1024: -o eth2 -d 0/0 --dport
20 ! --syn -m state --state ESTABLISHED -j ACCEPT</tt>
<br><tt>----------------------------------------------------------------------------</tt><tt></tt>
<p>(You might wonder about the device <tt>br0</tt>: frox works with bridging!
.-)))
<p>The state matching rules for the "external" connections to the internet
work as expected. But for the "internal" data connections between frox
and the clients, frox always needs to build a <tt>NEW</tt> data connection
instead of a <tt>RELATED</tt> one. Since this is only for the internal
connections, not for the external ones, I have the feeling that this might
be due to frox. (Didn't find any frox mailing list; does anybody know one?)
Or is there any problem with <tt>ip_conntrack_ftp</tt> for a ftp server?
Perhaps somebody has any better clue.
<p>Greetings,
<br>Dieter
<br>&nbsp;</html>

--------------63DE009080044A5BD4EB13B4--


