From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: where is libipt_match.so?
Date: Thu, 29 May 2003 13:54:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D40@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: David T-G <davidtg-netfilter@justpickone.org>, NetFilter Users' List <netfilter@lists.netfilter.org>

Have you searched for the file?

# Unix compatible search. ;)
find / -name libipt_match.so -exec ls -l {} \;

if it's in a different location just symbolic link it to where ever it's
looking for it.. ;) cheap way out..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: David T-G [mailto:davidtg-netfilter@justpickone.org]
Sent: Thursday, May 29, 2003 1:44 PM
To: NetFilter Users' List
Subject: where is libipt_match.so?


Hi again, all --

I have finally gotten my client to rebuild his SCO UnitedLinux machine
from scratch to give me a guaranteed-clean base and I tried running my
iptables setup script.  Everything (NIC discovery, init script creation,
etcetc) appears to have gone well but iptables has a problem:

  ...
  iptables -t filter -A INPUT -i eth0 -m match NEW,RELATED,ESTABLISHED
-j ACCEPT
  iptables v1.2.7a: Couldn't load match
`match':/usr/lib/iptables/libipt_match.so: cannot open shared object
file: No such file or directory

This worked before, but I had also mucked around with the SuSEfirewall2
scripts before; sure enough, it isn't there now.  Where does that file
live?  Do I need another RPM, perhaps?


TIA & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral
courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and
Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl
Npg!


