From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Settings via init.d lost during runtime
Date: Mon, 26 Jul 2004 09:11:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511F3@asimail2.alphanumeric.com>
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
To: KKH <knabberknusperhaus@yahoo.de>, netfilter@lists.netfilter.org

> I'm using a suse9.1 box with iptables as router/dump for the other
> machines of mine. custom firewall/nat settings are done by a script =
that
> is linked by 'rc3.d'.

are you sure the script is running at boot?  do you see your "echo" =
statements output to the screen?  i have a firewall on suse 9.0 on which =
i had to link my firewall startup script in to /etc/init.d/rc2.d.

just a thought...

-j



