From: "Spam Me Not" <stopspam@welho.com>
Subject: 2.4.18 -> 2.4.23 breaks IPMASQ.
Date: Wed, 3 Dec 2003 07:59:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3b962$af9c5e60$6049a8c0@tmp.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I'm using Debian Woody with ipchains compatibility enabled in kernel.
Eth0 is connected to a cable modem; Eth1 is a small internal network.
With 2.4.23 sending any packets from internal network to internet causes at
least eth1 to die, not immediately but in a minute or so.
I don't know if the entire machine freezes, or if it's eth1 only; the
machine is headless.
There doesn't seem to be any entries in syslog that are relevant to this
problem.

I'd appreciate if someone could CC me any good ideas.  If not, well, 2.4.18
has had zero problems this far.

-Teemu Pitk=E4nen


