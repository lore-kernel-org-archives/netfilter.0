From: mike bramm <mike.bramm@bomberjacketproductions.com>
Subject: SNAT & Squence Numbers
Date: Mon, 11 Nov 2002 11:23:56 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCFE7AC.9867DF43@bomberjacketproductions.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------006DA2657A4D44372BE23741"
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


--------------006DA2657A4D44372BE23741
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
    I'm a Router/PIX guy that is just getting into the Linux/IPTables
scene. I've read the man pages and searched the web for information on
IPTables. And I'm not able to find answers to some of my questions.
Maybe you can help?

   * If SNAT is configured for many to one (PAT), then I would presume
     that the connections are tracked by sequence numbers. Are the
     sequence numbers picked randomly, like the PIX? And is there a
     range in with they are picked from? What mod does this?

   * A syntax question. I've looked at alot of syntax examples and I've
     noticed one character that I can't seem to match up with any of the
     tutorials or man
     pages.
     $IPTABLES -A INPUT $WAN_IFACE \ -j DROP   What the heck is "\"? It
     looks like it would be used to separate the match and the target,
     but is not really necessary. Is this just a personal preference or
     is it needed?

Thanks for your time. I wish I had heard about IPTables a year ago.
Anthony Stone does have cool sayings.
mike


--------------006DA2657A4D44372BE23741
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<br>&nbsp;&nbsp;&nbsp; I'm a Router/PIX guy that is just getting into the
Linux/IPTables scene. I've read the man pages and searched the web for
information on IPTables. And I'm not able to find answers to some of my
questions. Maybe you can help?
<ul>
<li>
If SNAT is configured for many to one (PAT), then I would presume that
the connections are tracked by sequence numbers. Are the sequence numbers
picked randomly, like the PIX? And is there a range in with they are picked
from? What mod does this?</li>
</ul>

<ul>
<li>
A syntax question. I've looked at alot of syntax examples and I've noticed
one character that I can't seem to match up with any of the tutorials or
man pages.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
$IPTABLES -A INPUT $WAN_IFACE \ -j DROP&nbsp;&nbsp; What the heck is "\"?
It looks like it would be used to separate the match and the target, but
is not really necessary. Is this just a personal preference or is it needed?</li>
</ul>
Thanks for your time. I wish I had heard about IPTables a year ago. Anthony
Stone does have cool sayings.
<br>mike
<br>&nbsp;</html>

--------------006DA2657A4D44372BE23741--


