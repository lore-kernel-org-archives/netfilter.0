From: cc <cc@belfordhk.com>
Subject: Re: OT: iptables-like firewall for windows?
Date: Sat, 23 Aug 2003 09:46:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F46C782.2060103@belfordhk.com>
References: <3F461A22.90300@bus.okstate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F461A22.90300@bus.okstate.edu>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Jason Joines wrote:

>  We have a completely Linux back-end environment but unfortunately
> hundreds of windows desktops.  I'm pretty tired of all the attacks on
> the unprotected windows boxes but don't have the authority to put up a
> network firewall.  We protect all of our Linux servers with iptables.

It would be a lot cheaper to put up a Linux-based network firewall
than to install Win-based firewalls on each desktop.  Tell your
Supervisor that it is more feasible to install a firewall.

Compare the costs and effectiveness.  If your supervisor expects
you to install commercial firewalls to protect the windows
desktop, he's really smegging smoking something strange.

I mean if you can afford to protect your Linux servers with
iptables, how hard is it to add one more machine to protect
ALL your workstations?   Mind you, I don't know how your
company's system is setup, so I don't know if 'one' firewall
is applicable enough (though it should...*shrug*)


> Does anyone know of a similar tool for windows, particularly w2k?  The
> built-in stuff seems to be virtually worthless.

I wouldn't know.  I don't use the builtin stuff.

You can try ZoneAlarm Pro, or Kerio.



