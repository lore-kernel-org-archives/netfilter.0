From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: New user and MRTG error help
Date: Tue, 5 Aug 2003 15:21:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E18@alderaan.smgtec.com>
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
To: Paul Baxter <ppabaxte@bigpond.net.au>, netfilter@lists.netfilter.org

This is not directly related to your problem, but you must watch what
you are trying to log. I found that MRTG couldn't give accurate numbers
for the interface because of the mangling that iptables does to it.

To solve it, I used blank rules inside the MANGLE table that detects
packets in the PREROUTING and POSTROUTING tables. Once detected, I use
cron to probe the iptables -nvxL | grep <whatever> to spit back the
usage of the interface. I can give you the scripts if need be.




-----Original Message-----
From: Paul Baxter [mailto:ppabaxte@bigpond.net.au]=20
Sent: Tuesday, August 05, 2003 3:04 PM
To: netfilter@lists.netfilter.org
Subject: New user and MRTG error help

Does anyone know what this warning means, the interface is working I'm=20
using it now.

WARNING: Problem with External get '/usr/bin/monthlystats eth0':
   Expected a Number for 'in' but got '*'

WARNING: Problem with Externale get '/usr/bin/monthlystats eth0':
   Expected a Number for 'out' but got '* ERROR: Interface is down,=20
aborting'

ERROR: Target[host-eth0][_IN_] ' $$target[0]{$mode} ' did not eval into=20
defined data
ERROR: Target[host-eth0][_OUT_] ' $$target[0]{$mode} ' did not eval into

defined data
WARNING: Skipping Update of host-eth0, inlast is not defined
WARNING: Skipping Update of host-eth0, outlast is not defined

If you can help you will be doing me a huge service.
Regards
Paul Baxter



