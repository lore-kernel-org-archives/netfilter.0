From: "involved" <involved@netcabo.pt>
Subject: RE: help needed: clogged console
Date: Fri, 2 Jan 2004 12:56:48 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAxa3KUG+UK0em3rAEUPYkD8KAAAAQAAAAz4YdOTCj00+AsRsqWsG/wQEAAAAA@netcabo.pt>
References: <00ea01c3c982$fe3196a0$4900a8c0@cympak.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ea01c3c982$fe3196a0$4900a8c0@cympak.com>
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

Hi,

I also had that problem.. I use "dmesg -n 1" to avoid getting those =
kernel
messages on active consoles

Bye
i.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Slawomir =
Orlowski
Sent: ter=E7a-feira, 23 de Dezembro de 2003 18:32
To: shrike-list@redhat.com; redhat-list@redhat.com
Cc: netfilter@lists.netfilter.org
Subject: help needed: clogged console

Hello,

I have Linux RH 9.0 configured as filtering firewall, and getting a lot =
of
(kernel, iptables) messages on active consoles.
I have thought that putting in /etc/syslog.conf:

# *.kern /dev/console
kern.* /var/log/kernel
kern.* /dev/tty8

would free me from this, but it did not.
How can I force kernel message to appear only in /var/log/kernel log and =
on
tty8 only?

Best Regards
I hope that somebody will be able to help me.
When  I'm getting a lot of dropped packages it is not possible even to =
log.

Slawomir Orlowski



