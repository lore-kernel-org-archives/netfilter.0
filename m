From: "Jan Kaastrup" <jka@protego.dk>
Subject: RE: Iptables and SNAT
Date: Tue, 17 Feb 2004 15:39:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3f563$de6ba5b0$2d64a8c0@pcjka>
References: <200402171428.52966.mark@vevers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402171428.52966.mark@vevers.net>
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
To: mark@vevers.net
Cc: netfilter@lists.netfilter.org

Hi
Thanks for the answer.
I found out that recompiling the iptables with
KERNEL_DIR=<my-kernel-source> did the trick!


-----Original Message-----
From: Mark Vevers [mailto:mark@vevers.net] 
Sent: 17. februar 2004 15:29
To: Jan Kaastrup
Subject: Re: Iptables and SNAT


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 17 Feb 2004 11:03 am, you wrote:
> Hi
> I have iptable module loaded
Ok - are you using RedHat's IP tables?  Or have you compiled
your own and your own patch-o-matic additions?  - I've seen
problems before where people have mixed & matched. On RH
if using patch-o-matic patches and upgrading iptables to match
I uninstall the iptables rpm, compile from a vanilla kernel and
then add the patch-o-matic patches and then recompile the 
userspace apps from scratch.

BTW You need to be careful using vanilla kernels with 
multi-threaded apps on Fedora as it appears there are 
problems with fedora and a kernel which doesn't have 
NPTL support.  RH.9 seems not to mind even though the 
vanilla kernel doesn't support NPTL.

Cheers
Mark
- -- 
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
- --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xB08F3CA3
Fingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAMiUjWLU9HLCPPKMRAi0wAJ9/8W/vNs6+jP70KGtvMc8mQkOongCcCp5Y
DQnQ4zyWomkhPaW0gj26rJk=
=C7Qg
-----END PGP SIGNATURE-----



