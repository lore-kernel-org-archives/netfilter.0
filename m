From: "Mam Ruoc" <mamruoc@hotmail.com>
Subject: RE: Something wrong with my script!
Date: Mon, 10 Feb 2003 11:46:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F34E9ql2RkeS8YkdavN0000881c@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: rsterenborg@xs4all.nl, netfilter@lists.netfilter.org

I used nmap from another computer that's connected to internet with it's ow=
n=20
firewall, the only thing the to computers share is a switch....

i get three ip from my ISP..

----Original Message Follows----
From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
To: <netfilter@lists.netfilter.org>
Subject: RE: Something wrong with my script!
Date: Mon, 10 Feb 2003 11:25:10 +0100

 > I got a problem with my iptables script. It seemed to run
 > fined, and I
 > started using --state flag...
 >
 > But recently I did a nmap on my computer and got suprising
 > results, s=E5 I
 > tried several other port scanner and got results alike nmap..

Did you start nmap from the firewall itself ? If so, you shouldn't do
that.
Nmap your machine from another (internet) host.


Rob




_________________________________________________________________
MSN Messenger http://www.msn.no/messenger - Den korteste veien mellom deg o=
g=20
dine venner


