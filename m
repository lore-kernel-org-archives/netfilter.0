From: Bill Chappell <bill.chappell@critical.com>
Subject: Re: kazaa rulset
Date: Mon, 28 Jul 2003 21:16:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F25CAF6.EBC4BEA4@borg.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------C21345CC950957B59FF0CB2C"
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


--------------C21345CC950957B59FF0CB2C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

replying to juanca:


I expect that these rules resulted in the error messages I moved up
below them.


>
> iptables -A FORWARD -d a342.g.akamai.net -p tcp tcp -j DROP
> iptables -A FORWARD -d a342.g.akamai.net -p tcp udp -j DROP
> Bad argument `tcp'
> Try `iptables -h' or 'iptables --help' for more information.
> Bad argument `udp'
> Try `iptables -h' or 'iptables --help' for more information.

For the other error messages, I would try commenting out
all the rules (except one for the first try) and run the script that
loads them un-commenting one at a time.

For an exercise like that, script flushall is helpful between
runs:
iptables -t filter -F
iptables -t mangle -F
iptables -t nat -F


--
William Chappell,     Software Engineer,     Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY 13501
315-793-0248  x148  < bill.chappell@critical.com >  www.critical.com



--------------C21345CC950957B59FF0CB2C
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
replying to juanca:
<br>&nbsp;
<p>I expect that these rules resulted in the error messages I moved up
<br>below them.
<br>&nbsp;
<blockquote TYPE=CITE>&nbsp;
<br>iptables -A FORWARD -d a342.g.akamai.net -p tcp tcp -j DROP
<br>iptables -A FORWARD -d a342.g.akamai.net -p tcp udp -j DROP
<br>Bad argument `tcp'
<br>Try `iptables -h' or 'iptables --help' for more information.
<br>Bad argument `udp'
<br>Try `iptables -h' or 'iptables --help' for more information.</blockquote>

<p><br>For the other error messages, I would try commenting out
<br>all the rules (except one for the first try) and run the script that
<br>loads them un-commenting one at a time.
<p>For an exercise like that, script flushall is helpful between
<br>runs:
<br>iptables -t filter -F
<br>iptables -t mangle -F
<br>iptables -t nat -F
<br>&nbsp;
<pre>--&nbsp;
William Chappell,&nbsp;&nbsp;&nbsp;&nbsp; Software Engineer,&nbsp;&nbsp;&nbsp;&nbsp; Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY 13501
315-793-0248&nbsp; x148&nbsp; &lt; bill.chappell@critical.com >&nbsp; www.critical.com</pre>
&nbsp;</html>

--------------C21345CC950957B59FF0CB2C--


