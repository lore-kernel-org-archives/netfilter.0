From: "Julius Wijaya" <wijayaj@gmx.net>
Subject: FWD: Re: How to block a range of IPs?
Date: Sun, 27 Apr 2003 18:45:24 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304271845240285.000B69C7@smtp.nikonbw.com>
References: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
Reply-To: wijayaj@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org

I have been told something like this, but haven't tried it yet.

On Sat, 19 Apr 2003, Magos=E1nyi =C1rp=E1d wrote:

> A levelez=F5m azt hiszi, hogy Wijaya, J. a k=F6vetkez=F5eket =EDrta:
> > I am trying to block yahoo messenger for my LAN, but only on certain ip
> > range, how can i do this? i already read some articles that we can't do
> > this with iptables, but is there any other way to work around this
task??
>
> I have ran into the problem just two days ago. J=F3zsef Kadlecsik made
some
> vague promise-like statements to the phone about writing a match for the
> ip range case.

I have just committed the iprange match in the netfilter cvs

as a base patch in patch-o-matic.

The new match makes possible to match source/destination IP addresses
against inclusive IP address ranges.

Examples:

iptables -A FORWARD -m iprange --src-range 192.168.1.5-192.168.1.124 -j
ACCEPT
iptables -A FORWARD -m iprange --dst-range 10.0.0.0-10.5.255.255.255 -j
ACCEPT

Visit http://www.netfilter.org on how to access the cvs repository.

Best regards,
Jozsef
--
E-mail : kadlec@sunserv.kfki.hu, kadlec@blackhole.kfki.hu
PGP key: http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address: KFKI Research Institute for Particle and Nuclear Physics
         H-1525 Budapest 114, POB. 49, Hungary


*********** REPLY SEPARATOR  ***********

On 27/04/2003 at 10:41 AM Afshin Lamei wrote:

>Hi,
>How can I write a rule for a custom range of IPs? for example, I want to 
>block every WWW packet incoming from eth1, which source is an IP between 
>192.168.1.10 and 192.168.1.20.
>please help me writing an example.
>thank you
>afshin
>
>
>
>
>
>_________________________________________________________________
>Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
>http://join.msn.com/?page=3Dfeatures/junkmail




