From: "Jason Neurohr" <Jason.Neurohr@uniqueworld.net>
Subject: RE: PPTP issue
Date: Thu, 9 Nov 2006 08:14:37 +1100
Message-ID: <4D82EB5486E2904A912F7A3A2089B548016DC59F@sydexch.sydney.uw.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Indeed the account that was being used to authenticate had expired. All =
working great now.

Thanks guys
	=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal =
Hambourg
Sent: Wednesday, 8 November 2006 11:09 AM
To: netfilter@lists.netfilter.org
Subject: Re: PPTP issue

Hello,

Jason Neurohr a =E9crit :
> Hello, trying to connect to pptp server through linux iptables =
firewall.
> I have the ip_conntrack_pptp and ip_nat_pptp modules loaded. Anyone =
know
> what the below means and how to fix it?
[...]
> 20:10:31.180676 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 3,
> length 48: CHAP, Challenge (0x01), id 2, Value
> bf1e69be064b99fd81c1810a9d05b0e5, Name 192.168.10.22

The server asks for authentication using CHAP.

> 20:10:31.219988 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 3, ack 3,
> length 55: CHAP, Response (0x02), id 2, Value
> 50e507db3f5f8330dc3622846e7ffbb3, Name aaa__aaaaaaa

The client sends the authentication using CHAP, name aaa__aaaaaaa.

> 20:10:31.249508 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 4, ack
> 3, length 64: CHAP, Fail (0x04), id 2, Msg CHAP authentication =
failure,
> unit 578938[|chap]

"CHAP authentication failure" means that the PPTP client failed to=20
authenticate itself on the server. Probably wrong login/password. The=20
TCP connection and GRE tunnel communications seem OK so I don't think=20
this has anything to do with Netfilter/iptables.


