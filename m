From: =?ISO-8859-1?Q?J=F6rn_Nettingsmeier?= <pol-admin@uni-duisburg.de>
Subject: reducing the scan rate of worms?
Date: Wed, 29 Sep 2004 13:57:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415AA30C.3090003@uni-duisburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi netfilter folks!


i would like to reduce the amount of damage that scanning worms such=20
as slammer can do by limiting the number of destination ips per=20
second that a host in my network can connect to.
ideally, the host would be blackholed after repeatedly hitting this=20
limit, and a LOG message would trigger an alert to the admin.

the way i understand the _limit_ match, it can only be used to=20
reduce throughput to or from particular address, but does not have=20
enough state information that would allow to correlate different=20
connections from the same host.

now i have googled up=20
http://www.ukuug.org/events/linux2004/programme/paper-AStone-2/Firewalls.=
pdf,=20
which mentions the _dstlimit_ match, but i'm not sure how it works.=20
i found the source file in netfilter cvs, but did not really=20
understand it. might it be what i'm looking for?


if this has been discussed before, please point me to the relevant=20
threads - i searched far and wide, but nothing.

i would appreciate a cc: on replies, since i'm not subscribed to the=20
list.


best regards,

j=F6rn

--=20
"Some universities are dead set against giving [software code] away.
But I don't think universities should be in the moneymaking
business. They ought to be in the changing-the-world business, and
open source is a great vehicle for changing the world."
	- Larry Smarr, supercomputing expert and
	  professor of computer science at UCSD

J=F6rn Nettingsmeier, EDV-Administrator
Institut f=FCr Politikwissenschaft
Universit=E4t Duisburg-Essen, Campus Duisburg
Tel.: 0203/379-1419, Fax: 0203/379-2318


