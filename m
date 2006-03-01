From: "Master" <account@netje.nl>
Subject: RE: Outgoing port is wrong
Date: Wed, 1 Mar 2006 13:51:57 +0100
Message-ID: <000001c63d2e$ec88b510$7b82a8c0@aladin>
References: <62850.193.173.147.3.1141216557.squirrel@webmail.sterenborg.info>
Reply-To: account@netje.nl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <62850.193.173.147.3.1141216557.squirrel@webmail.sterenborg.info>
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
To: 'Rob Sterenborg' <rob@sterenborg.info>, netfilter@lists.netfilter.org

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob =
Sterenborg
Sent: Wednesday, March 01, 2006 1:36 PM
To: netfilter@lists.netfilter.org
Subject: Re: Outgoing port is wrong

On Wed, March 1, 2006 13:19, account@netje.nl wrote:
> I am having a lot of problems with setting up something relatively =
easy,
but
> does not seem to work.
>
> Situation:
>
>                +-------------+         |--- Box1  192.168.1.107:15009
> Internet ------| eth0    eth1|---------|--- Box2  192.168.1.108:15009
>                +-------------+         |--- Box3  192.168.1.109:15009
>          62.59.197.53     192.168.1.1
>
> I have 3 boxes running the same services in a DMZ. Via the internet, I
want
> the ability to access the different boxes, based on a different port
number
> on the out-side. Out-side port 18107 should go to internal
> 192.168.1.107:15009, 18108 should go to 192.168.1.108:15009 and Port =
18109
> should go to 192.168.1.109:15009.
> This was working, but the new security of the applications does demand
that
> the services should be able to reinitiate the connection, using the =
same
> port as on the way in. So I need to make sure that box1
> (192.168.1.107:15009) always uses 62.59.197.53:18107 to connect to the
> outside.
>
> How do I setup these rules correctly for in and out going?

Have you looked at "man iptables", the SNAT section ?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   SNAT
....
It takes one type of option:

       --to-source  ipaddr[-ipaddr][:port-port]

which  can  specify  a  single  new source IP address, an inclusive =
range of
IP addresses, and optionally, a port range (which is only valid if the =
rule
also specifies -p tcp  or  -p  udp).
....
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It looks like :

$ipt -A POSTROUTING -s 192.168.1.107 -p tcp --sport 15009 \
  -j SNAT 65.59.197.53:18107

should do the trick.


Gr,
ROb


Hoi Rob,

I have looked it through and many more documents, but still missing
something.

I used:
-A POSTROUTING -s 192.168.1.107 -p tcp --sport 15009 \
  -j SNAT -o eth0 --to 65.59.197.53:18107

Should this be in the 'nat' or 'mangle' part?
Should I also add an INPUT ACCEPT for 192.168.1.107:15009?





