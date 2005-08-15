From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: ftp issue cont.
Date: Mon, 15 Aug 2005 07:54:54 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCC72@farmer.vikus.com>
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
To: netfilter@lists.netfilter.org

It must be our firewall then: I didn't build it myself and I don't know =
if conntrack_ftp is loaded in the kernel or not - guess I could always =
modprobe eh? We have a 24/7 production shop so I'm editing it live until =
I get around to building another firewall myself. I always thought that =
passive FTP ports had to be opened specifically because the only =
indication of a new connection is in the data of the packet itself.

Thanks for the clarification,

Derick=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of J=F6rg =
Harmuth
Sent: Monday, August 15, 2005 5:13 AM
To: netfilter@lists.netfilter.org
Subject: Re: ftp issue cont.

Derick Anderson schrieb:
> FTP passive mode creates an entirely new connection for data transfer.
> It is not 'related' to the original connection and so iptables doesn't =

> pick it up as such (nor do any other stateful firewalls that I'm aware =

> of).

No, not really. Iptables regards FTP data traffic as related stuff. To =
be more exactly, the respective helper module does so =
(ip_conntrack_ftp.[k]o). So, normally all you have to do, is load this =
module, allow ESTABLISHED,RELATED traffic in and out and allow FTP in.
This looks something like this (assumed that policies are DROP and =
OUTPUT is ACCEPT and also assumed that the box is directly connected to =
the internet and that the FTP server is on the firewall box):

modprobe ip_conntrack_ftp.[k]o

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT =
iptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT

This will work for active and passive FTP. If the ftp-module isn't on =
the system in question, varun_saa has to configure the kernel correctly =
and recompile as needed.

BTW, the original ruleset didn't explain anything. IN|OUTPUT =3D=3D =
ACCEPT and in FORWARD no rule concerning FTP. So, what is this guy doing =
? If the FTP server is on the firewall box, there is no iptables problem =
at all (on this box). If not, there are no rules that permit FTP and =
thus it cannot work. The whole thing looks quite mysterious to me, =
including the -P issue Rob mentioned. May be a tiny ASCII art network =
picture would clarify the situation :)

Have a nice time,

Joerg




