From: "James A. Pattie" <james@pcxperience.com>
Subject: Re: port-based filtering of IPsec packets?
Date: Wed, 23 Jul 2003 16:30:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F1EFE6A.9000603@pcxperience.com>
References: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu> <20030723204240.GE23652@cannon.eng.us.uu.net> <000e01c3515e$f8320830$05001aac@breton1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c3515e$f8320830$05001aac@breton1>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Garcia Ruiz wrote:
| Maybe I'm wrong because I don't know very well the way IPSec traffic is
| encrypted-decrypted inside the firewall, but I think that in one side
| (external interface, internet) there is IPSec protocol (protocols 50, 51)
| and in other side (internal interface, intranet) there are plain protocols
| and ports. Couldn't be possible to filter taking into account the internal
| interface where it is suppose not to be encrypted?

In a freeSwan scenario you have Interfaces called ipsec0, ipsec1, etc.
You do your filtering using them as the source/dest interface to be able
to filter traffic leaving your vpn tunnel or entering your vpn tunnel.

See the PCX Firewall (http://pcxfirewall.sf.net/) for a script that will
help you automate creating these rules.  It supports freeSwan vpns out
of the box (though you still have to configure freeSwan).

|
| JBGR
|
|
| ----- Original Message -----
| From: "Ramin Dousti" <ramin@cannon.eng.us.uu.net>
| To: <netfilter@lists.netfilter.org>
| Sent: Wednesday, July 23, 2003 10:42 PM
| Subject: Re: port-based filtering of IPsec packets?
|
|
|
|>Once the IPsec traffic has been terminated (decapsulated) you can
|>filter it based on the services (tcp or udp ports) prior to that
|>you only can filter based on the outer IP header...
|>
|>Ramin
|>
|>On Wed, Jul 23, 2003 at 02:35:19PM -0500, Rick Kennell wrote:
|>
|>
|>>I'm curious how I might do port-based filtering of IPsec packets with
|>>iptables.  Presently, filtering IPsec-encrypted packets is an
|>>all-or-nothing proposition because iptables can't look inside an ESP
|>>section to get the port info.  It can only filter ESP packets based on
|>>the SPI.  Actually, I'm not even sure how I'd get iptables to do
|>>address-based filtering of IPsec packets.
|>>
|>>Why would I want this?  Well, I might want to do opportunistic IPsec and
|>>allow arbitrary parties to interact with my host, but I still want to
|>>make sure that only selected services are made available.
|>>
|>>I noticed that a similar thing was asked over on the FreeBSD side of the
|>>world:
|>>
|>>   http://www.bsdforums.org/forums/showthread.php?threadid=11725
|>>
|>>Somehow, I don't expect the iptables solution to be quite so easy.
|>>
|>>--
|>>Rick Kennell <kennell@ecn.purdue.edu>
|>>Purdue University Department of Electrical and Computer Engineering
|>>
|>
|>
|
|
|
|


- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQE/Hv5qtUXjwPIRLVERAvUNAJwKffPGjDYeo0GmU72pyHN/cGjtAgCg8+Ix
1GuH8Ld7DE2x2B6yIwzUnpA=
=MVUN
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


