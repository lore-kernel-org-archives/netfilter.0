From: edwardspl@ita.org.mo
Subject: Re: [Fwd: Server machines behind Firewall]
Date: Sat, 08 Jan 2005 12:39:58 +0800
Message-ID: <41DF641E.962D1780@ita.org.mo>
References: <Pine.LNX.4.05.10501071608200.16399-100000@darkstar.sysinfo.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

"R. DuFresne" wrote:

> On Fri, 7 Jan 2005 edwardspl@ita.org.mo wrote:
>
> > Jason Opperisano wrote:
> >
> > > > Sorry, what useful about the following function ( command line ) =
?
> > > >
> > > > > iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1=
 \
> > > > > ? --dport 80 -j ACCEPT
> > >
> > > um--it allows the packet through the FORWARD chain of the filter ta=
ble.
> > > remember--you're trying to build a firewall here.
> >
> > So, must I enable this kind of function for using the Firewall ?
> >
>
> unless the firewall(ed) system is a stand alone <no other ststems on th=
e
> network> then yes, if you wish to forward or pass traffic to the intern=
et
> and the other systems.=A0 A stand alone box with a firewall can get by =
with
> just input and output rules.

Actually, there is only one machine for me to setup a system ( network ) =
for
Internet...
So, I'm planning the following functions with a single machine :
Firewall + Internet Server ( eg : DNS, WWW, Mail , FTP behind Firewall ) =
+ NAT
( for other PCs / Clients connect to Internet ).

PS : There are TWO Network Interface with the single machine ( I think on=
e port
connect with leased line / boardband, another one port with HUB to other
Clients )

Is there a sample nat scripts for using the multi-functions ?

Edward.




