From: James Pattie <james@pcxperience.com>
Subject: Re: logging to console
Date: Tue, 16 Dec 2003 10:29:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDF32D2.3010900@pcxperience.com>
References: <AD8D39C727CBD411BB2C0090273A727408F9ED49@mortimer.law.uconn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AD8D39C727CBD411BB2C0090273A727408F9ED49@mortimer.law.uconn.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Hurley, Michael" <MHurley@law.uconn.edu>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hurley, Michael wrote:
| Using iptables 1.2.8-8.72.3 on Red Hat Linux 7.3, kernel 2.4.20-20.7.
|
| Haven't found a solution to this so far: iptables LOG is logging to console.
| This only occurs on the consoles directly connected to the machine. Logging
| in remotely does not have this problem.
|
| Here's what I've tried so far, w/o success:
| set log-level to notice, added kern.=notice /var/log/firewall to
| syslog.conf, restarted syslogd.
| set log-level to warning, added kern.=warning /var/log/firewall to
| syslog.conf, restarted syslogd.
|
| Still keeps on logging to local consoles. (BTW, kern.* is not accounted for
| in syslog.conf).
|
| I haven't tried setting the printk values yet (at present, the values are 6
| 4 1 7)--unsure of what the consequences might be of tinkering with that.
|
| What is the best way to stop this irritating behavior? Thanks,
|
|

a temporary solution is to issue: dmesg -n 1
at the console.  that stops it outputting on the active console, but it still
goes into dmesg, etc.

- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/3zLRtUXjwPIRLVERAldvAJ9kFqRQDaEyDmRvG92w/2IVt+YpmQCg4UIz
PnS2BJ0oTdfIo01WqELk+Nk=
=zIRK
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
MailScanner thanks transtec Computers for their support.


