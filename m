From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Settings via init.d lost during runtime
Date: Mon, 26 Jul 2004 14:29:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511F9@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: KKH <knabberknusperhaus@yahoo.de>
Cc: netfilter@lists.netfilter.org

> yes. all the tools that are run by the script - also those which are
> executed after iptables - are active after booting..

my guess then, would be that you still have the suse iptables startup =
script enabled and it is running after your custom script.  the first =
thing the suse script does, is to flush out all your rules...

disable the suse iptables script from running at boot:

	chkconfig -s SuSEfirewall2_setup off
	chkconfig -s SuSEfirewall2_init off
	chkconfig -s SuSEfirewall2_final off

beyond that--you've stumped me...

-j


