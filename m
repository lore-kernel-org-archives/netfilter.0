From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: :INPUT DROP [82:20563]
Date: Mon, 24 Feb 2003 12:20:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302241220.08835.netfilter@newkirk.us>
References: <001c01c2dc22$60a80ca0$11eb7080@princeton.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001c01c2dc22$60a80ca0$11eb7080@princeton.edu>
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
To: Chi <clu@Princeton.EDU>, netfilter@lists.netfilter.org

On Monday 24 February 2003 11:32 am, Chi wrote:
> I'm new to iptables so ....

If you haven't already, bookmark and read through the documentation at=20
http://netfilter.org , and Oskar Andreasson's fantastic tutorial at=20
http://iptables-tutorial.frozentux.net .


> After I use #iptables -P INPUT DROP
>                 #iptables -P FORWARD DROP
>                 #iptables -P OUTPUT DROP
> and # service iptables save
>
> I have this in the /etc/sysconfig/iptables:
> :INPUT DROP [82:20563]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
>
> So what is exactly those numbers for? and can I manually change it?
> also I have noticed that those numbers changes every time when I
> changed the rules.

The numbers are Packets:Bytes that have matched.  If you have several=20
rules (instead of simply a DROP policy for the chain) this will show you=20
how much traffic matched each rule.  You shouldn't manually edit it, but=20
if you want to reset it use "iptables -Z" (to zero the counts for the=20
default table, filter) and/or "iptables -t nat -Z". (to zero counts for=20
the NAT table)  If you list the active rules with "iptables -v -n -L" it=20
will list all the filter table rules along with packets and bytes that=20
matched each, and here again "-t nat" will specify the nat table instead=20
of the default filter table.

j

> Thanks.
>
> Chi


