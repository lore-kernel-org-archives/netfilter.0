From: David Cannings <lists@edeca.net>
Subject: Re: mail server acces pb
Date: Thu, 22 Apr 2004 23:31:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404222331.14497.lists@edeca.net>
References: <HWLF8W$9F9583659D96FB958291928238874B93@tiscali.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HWLF8W$9F9583659D96FB958291928238874B93@tiscali.fr>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 22 April 2004 23:17, kmc@tiscali.fr wrote:
> i have a 2 machines network in workgroup. One LINUX connected to
> INTERNET through ADSL AND A LAPTOP/XP that can't access to my ISP mail
> server with message: "can't find pop server's name pop.libertysurf.fr"
> and then
> "your mail server closed the connection

=46rom looking at your rules I do not see anything that would stop your=20
Windows machine from accessing the Internet however I would check the=20
following:

1) Can your Windows machine resolve the hostname for pop.libertysurf.fr? =20
A good way to check would be to pull up a command line (Start->Run->"cmd"=20
worked in 2000 and most likely will in XP too) and use the tool=20
"nslookup".  `nslookup pop.libertysurf.fr` should show you.

2) Does your Windows machine access anything else as expected?  For=20
example, can you web surf or use other Internet applications?

3) If no to 2 above, are your DNS settings in Windows correct?  I cannot=20
say what they should be as I do not know who your ISP is but if your=20
Linux machine works fine, use the same entry as in /etc/resolv.conf.

I would also note that having a default ACCEPT policy can be a bad thing. =
=20
To satisfy the paranoid a default DENY policy with rules crafted inside=20
to let only what you want through is the safest way to build your=20
firewall.  One other note is that based on your ruleset, I have made the=20
presumption that the Linux machine is acting as the gateway.

David

