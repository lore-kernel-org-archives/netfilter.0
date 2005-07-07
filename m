From: Jeff Rasmussen <jeff.rasmussen@gmail.com>
Subject: Re: FTP and IPSEC
Date: Thu, 7 Jul 2005 18:18:32 +0000 (UTC)
Message-ID: <loom.20050707T201352-299@post.gmane.org>
References: <57F9959B46E0FA4D8BA88AEDFBE582909ED0@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Gary W. Smith <gary <at> primeexalia.com> writes:

> 
> Any ideas?
> 
> ________________________________
> 
> From: netfilter-bounces <at> lists.netfilter.org on behalf of Gary W. Smith
> Sent: Tue 6/28/2005 10:06 AM
> To: netfilter <at> lists.netfilter.org
> Subject: FTP and IPSEC
> 
> This is a follow up to a former problem, but unreleated.
> 
> I have two networks conencted via IPSEC.  On each side of the network I have
client servers that have
> SNAT/DNAT to the internet.  Everything seems to work well under ISPEC except
ftp.  Here is what I found.
> 
> >From location A, a workstation without a static external IP address on the
10.0.10.x can FTP anywhere on
> the net without problems but CANNOT ftp to a machine at location B using it's
internal 10.0.50.x IP.  This
> same workstation CAN ftp without restriction to it's external alias for the
same machine at location B
> using it's external IP 199.199.199.x
> 
> If I remove ip_nat_ftp and ip_conntrack_ftp it seems to work fine.  But the
problem is now that we cannot ftp
> externally from that location.  Both locations have ip_nat_ftp loaded but it
doesn't seem to matter.
> 
> When we had a pptp connection between the two locations we didn't have this
problem.  It only seems to happen
> with IPSEC. 
> 
> Is there a workaround for this or is there a way to tell ip_nat_ftp to ignore
a particular IP range?
> 
> Gary Smith
> 
> 

I'm seeing this same problem under the new Debian Sarge release.

I've upgraded from Debian Woody to Sarge and now am using a 2.6.8
kernel with Openswan and Shorewall.  The VPN tunnel works great for
all other traffic except ftp.  I keep getting the error messages below.

kernel: FTP_NAT: partial packet 2087393185/21 in 787/863
kernel: FTP_NAT: partial packet 2087393185/21 in 788/844
kernel: FTP_NAT: partial packet 2087393185/21 in 789/849
kernel: FTP_NAT: partial packet 2087393185/21 in 790/838

I have both ip_ftp_nat and ip_conntrack_ftp loaded.  I am using
one-to-one NAT (same as before) to translate the foreign network to a
local ip address.

I can log into the ftp server but when I try to list the directory it
fails in either active or passive modes.  The last communication with
the ftp server requests the active ports to use.

I've seen two links on the web, one that says that their is a conflict
between IPSEC and iptables.  The other that had a firewall rule on the
other end of the tunnel that was preventing the connection.

http://lists.shorewall.net/pipermail/shorewall-users/2004-June/012969.html
http://msgs.securepoint.com/cgi-bin/get/netfilter-0506/123.html

I'll try taking out the modules ip_ftp_nat and ip_conntrack_ftp to see if that
has the same behavior.

Jeff Rasmussen
GPG public key 0x9686C12F



