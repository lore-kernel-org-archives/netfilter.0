From: David Ranch <dranch@trinnet.net>
Subject: Re: nimda, "code red", IIS hacks VS iptables
Date: Thu, 12 Sep 2002 01:10:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.3.2.7.0.20020912005725.00c9cba0@trinity3.trinnet.net>
References: <OE70U9LLm3OFk8nmxkl000052c8@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OE70U9LLm3OFk8nmxkl000052c8@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Robert Searle <robertsearle@hotmail.com>, netfilter@lists.samba.org


Hello Robert,

 >    I was wondering how do I setup a iptables to protect a machine agains
 >nimda, code red, or any of the bottom junk?  Basically how do I say block
 >any ip that is sending me this crap!  Is there a way to do it with
 >http://www.snort.org/

IPTABLES is a stateful layer-3 packet filter.  To match against
Nimda, CodeRed, etc., IPTABLES would have to scan the Layer4-7
payload to check for any matches.

As I understand it, the stock IPTABLES code doesn't support
anything like this but it seems that the "string" patch from
the EXTRA patch-o-matic section might be what you are looking
for:

    http://www.netfilter.org/documentation/pomlist/pom-extra.html


I've never used this patch so the Netfilter folk will be able
to better help you with this.  One note to the wise though..
please be aware that enabling Layer4-7 filtering might cause
significant performance impacts.  I recommend to test things
before and after you add in this patch.

Good luck!


Btw:  some possible alternatives could be to use some creative
       scripts to parse your HTTP logs add those infected IPs into
       a input DROP filter.

       Other tools like Portsentry might be able to do this
       by now too.


--David



 >
 >Also, if you could look at
 >http://www.platinumarchitecturegroup.com/articles/installNotes.html and=
 give
 >me any feedback. Please don't publish this link yet, I am still trying to
 >finish it off!
 >
 >Thanks
 >--Robert
 >
 >[Sat Aug 31 18:42:48 2002] [error] [client 24.156.237.179] File does not
 >exist: /var/www/htdocs/platinumjava.com/MSADC/root.exe
 >[Sat Aug 31 18:42:55 2002] [error] [client 24.156.237.179] File does not
 >exist: /var/www/htdocs/platinumjava.com/c/winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:02 2002] [error] [client 24.156.237.179] File does not
 >exist: /var/www/htdocs/platinumjava.com/d/winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:05 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..%5c../winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:08 2002] [error] [client 24.156.237.179] File does not
 >exist:
=
 >/var/www/htdocs/platinumjava.com/_vti_bin/..%5c../..%5c../..%5c../winnt/sy=
st
 >em32/cmd.exe
 >[Sat Aug 31 18:43:12 2002] [error] [client 24.156.237.179] File does not
 >exist:
=
 >/var/www/htdocs/platinumjava.com/_mem_bin/..%5c../..%5c../..%5c../winnt/sy=
st
 >em32/cmd.exe
 >[Sat Aug 31 18:43:18 2002] [error] [client 24.156.237.179] File does not
 >exist:
=
 >/var/www/htdocs/platinumjava.com/msadc/..%5c../..%5c../..%5c/..=C1^\../..=
=C1^\..
 >/..=C1^\../winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:24 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..=C1^\../winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:38 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..=C0=AF../winnt/system32/cmd.exe
 >[Sat Aug 31 18:43:46 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..=C1~\../winnt/system32/cmd.exe
 >[Sat Aug 31 18:44:07 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..%5c../winnt/system32/cmd.exe
 >[Sat Aug 31 18:44:14 2002] [error] [client 24.156.237.179] File does not
 >exist:
 >/var/www/htdocs/platinumjava.com/scripts/..%2f../winnt/system32/cmd.exe
 >[Sat Aug 31 19:02:26 2002] [error] [client 24.156.237.179] File does not
 >exist: /var/www/htdocs/platinumjava.com/scripts/root.exe
 >[Sat Aug 31 19:02:28 2002] [error] [client 24.156.237.179
.---------------------------------------------------------------------------=
-.
|  David A. Ranch - Linux/Networking/PC hardware         dranch@trinnet.net =
 |
!----                                                                   =
 ----!
`----- For more detailed info, see http://www.ecst.csuchico.edu/~dranch ----=
-'


