From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 17:15:16 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0507131709070.14092@darkstar.sysinfo.com>
References: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Chandra.Vempali@infineon.com
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 13 Jul 2005 Chandra.Vempali@infineon.com wrote:

> Hi
> Thanks for your reply.
>
> My ip_conntrack_ftp module gets loaded properly.
>
> If I keep a rule like "iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT"
> It means that traffic is allowed to pass through for all ports which should not be done for security reasons.

no, it means that traffic that is started from the FW is allowed back to 
the FW from whatever system<s> the fw was trying to communicate with to 
begin with.  If you require something more secure then this, then there 
should be no network card in the system to begin with.

>
> As for passive FTP, I added two rules to allow traffic thru only 21 port.
> iptables -A INPUT -p tcp --sport 21 -m state --state  ESTABLISHED,NEW -j ACCEPT
> iptables -A OUTPUT -p tcp --dport 21 -m  state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>

NEW is the problem you though you were abvoiding in the first comment, 
should not be required.  Not unless something totally insecure like 
allowing folks to ftp to the fw from outside.  The rules provied in the 
prior post which you are commenting on her, would require that the fw box 
innitiate the ftp, here you are trying to do something less secure and 
allow anyone to ftp to the fw.   Certainly it is highly unlikly you intend 
to allow that.  rtfm might help, the concepts of NEW, ESTABLISHED and 
RELATED semm to have you confuzzeled.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC1YRnst+vzJSwZikRAu5OAJwJcFX31ZGYx4tkq2HhGBsPeyqbzwCg2ETL
4P5PUgKa9KiTBZitSWs/ANQ=
=qnTq
-----END PGP SIGNATURE-----

