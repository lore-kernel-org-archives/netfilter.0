From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: filtering by packet contents?
Date: Wed, 16 Jul 2003 15:51:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF26@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: cc <cc@belfordhk.com>, netfilter@lists.netfilter.org

You can you use the p-o-m patch for the string module "-m string =
--string pattern"

this works and can be used for some funky stuff too like redirecting 1 =
virtual host on a server to another server which is very handy when a =
particular virtual host goes down...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: cc [mailto:cc@belfordhk.com]
Sent: Wednesday, July 16, 2003 2:47 PM
To: netfilter@lists.netfilter.org
Subject: filtering by packet contents?


Hi,

I don't know if I'm getting confused, so if
someone can clarify whether I'm using the
wrong tool for the problem; but basically,
I have a webserver behind a firewall
(iptables 1.2.8) and the web access
packets are filtering in properly.

Is it possible to set iptables to
drop any packets depending on
the content?  The thing that
comes to mind is this CodeRed/
Nimda crap that comes in.  While
it doesn't affect my webserver
at all, I just don't like it
clogging up the dang log.

At this point of writing, I'm tending
towards the answer of "No, iptables
is not the right tool, nor can it
do that."  Is this correct?

Thanks for any clarification in
this matter.

Edmund



