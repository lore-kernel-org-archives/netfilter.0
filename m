From: "James A. Pattie" <james@pcxperience.com>
Subject: Out of window data issue
Date: Fri, 27 Sep 2002 15:00:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D94B8CE.9000707@pcxperience.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

	I'm running 2.4.18 kernel's w/ the tcp-window-tracking
patch applied (from p-o-m around iptables 1.2.6a days) and iptables
1.2.6a and I'm getting the following errors in the logs between 2
firewalls where the only traffic that seems to be affected is
Printing from the St. Louis office to the Kansas City Office via
our VPN connections.

Sep 27 14:41:26 hartwigkcm kernel: SRC=192.168.3.98 DST=192.168.5.25
LEN=44 TOS=0x00 PREC=0x00 TTL=127 ID=63785 DF PROTO=TCP SPT=721 DPT=515
SEQ=28150977 ACK=0 WINDOW=8192 RES=0x00 SYN URGP=0 OPT (020405B4) Out of
window data: SEQ is over the upper bound (over the window of the receiver)

I have disabled tcp_timestamps, tcp_window_scaling and tcp_sack and
enabled netfilter/ip_conntrack_tcp_be_liberal but I still get the
packets dropped and the above error message output.

The source and dest servers are NT4 Terminal Servers if that helps.

We just upgraded the kernels within the last 3 weeks and the printing
issue is the only thing that we haven't been able to resolve.

I have googled all day looking for anyone else who has had this issue
and what they did to resolve it and have not yet found anything.

I would appreciate any help.

- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgpkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9lLjNtUXjwPIRLVERAuEkAKC3a0ykxMjNGqLnZ4G1HCQoxG+rTACg1mAY
PhNw+iE5JwvijUx/Bb/VdIM=
=Javz
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


