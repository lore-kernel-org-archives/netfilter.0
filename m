From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: FTP Forwarding
Date: Tue, 18 Jan 2005 07:49:02 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD06F5F85@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
Content-Type: text/plain; charset="us-ascii"
To: TestMail <testmail@peterpaul.com.ph>, Jason Opperisano <opie@817west.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

JASON,

is this your network? or is it the companies?
what i would suggest s/be analyzed based on whose it is.

if its your network or its the firms and you can convince them it
would be worth the effort. put a bastion ftp server on the outside=20
lock it down and NEVER let the Internet inside otherwise why even
have a firewall....

kiss principle..

any other ideas the list comes up with will no doubt be of technical
assistance to you but for a longer life do it this way.=20

control types of traffic outbound and NEVER let the outside use internal
resources ever.

~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of TestMail
Sent: Sunday, January 16, 2005 11:32 PM
To: Jason Opperisano
Cc: Netfilter Mailing List
Subject: Re: FTP Forwarding



----- Original Message -----
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 14, 2005 10:23 PM
Subject: Re: FTP Forwarding


> On Fri, 2005-01-14 at 03:57, Test Mail wrote:
> > Hi!Can i have a follow up question regarding FTP server inside =
internal
LAN
> > which can be seen in the internet.....
> > now what if the scenario is i want to restrict a specific Public IP
Address
> > in using my FTP what will be the rules that i should  apply?
> >
> > I was thinking of setting up a rule that will filter incomming =
Public IP
> > Address request for ftp before it forwards it into my internal FTP
Server.
> >
> > Below are the sample entry in my iptables:
> > iptables -t filter -A INPUT -p tcp -s $PublicIPAdd --dport 20:21 -j
ACCEPT
> > <--- is this correct?
> > iptables -t filter -A INPUT -j DROP
> >
> > Below are the previous solution that you gave.
> >
> > modprobe ip_conntrack_ftp
> > modprobe ip_nat_ftp
> >
> >  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d 202.147.167.99 \
> >    --dport 21 -j DNAT --to-destination 192.168.0.5
> >
> >  iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d =
192.168.0.5 \
> >    --dport 21 -j ACCEPT
>
> change that rule to something like:
>
>   iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn \
>     -s $PublicIPAdd -d 192.168.0.5 --dport 21 -j ACCEPT
>
> repeat for multiple instances of $PublicIPAdd.
>
> -j
>
> --
> "It's not easy to juggle a pregnant wife and a troubled child, but
>  somehow I managed to fit in eight hours of TV a day."
> --The Simpsons
>

I'm sorry but i think this rule will not be the solution to my problem =
cause
my ftp server is inside my internal network and automatically my gateway
will "only" be the source from the -s $PublicIPAdd Forward rule =
parameter...
i think???

Below is my schematic on how i want it to be ..
    1. only 202...1 ip address in my branch office should be allowed to =
use
my ftp server in my head office

        so incoming ftp request should be filtered and only 202....1 ip
address that is coming from my branch office should be allowed.

| Branch | eth0 202. .1       < external
       |
       |
| WAN  |
       |
       |
|gateway:firewall:FCore2|  eth0 192.168...  < internal <<<<<<
       |                                 eth1 202........    <external
       |
       |
|Ftp Server:FCore2| eth0 192.168.0.5 < Internal
--------CUT =
----------------------------------------------------------------
:::::2nd Question:::::
if i apply a policy >>>> iptables -P INPUT DROP
                                    iptables -t filter -A INPUT -p tcp =
-s
192.168.0.1 -d 192.168.0.2 --dport 20:21 ACCEPT

means only 192.168.0.1 will only be allowed to use ftp and the rest will =
be
drop ???? am i correct??

--------CUT--------------------------------------------------------------=
---

Thanks in advance.

Still learning iptables..
Milo




