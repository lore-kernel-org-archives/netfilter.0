From: "deepali" <deepali@gecsl.com>
Subject: Re: port forward using iptables not happening
Date: Sat, 6 Jul 2002 08:04:48 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <008201c22495$b59a98d0$0805010a@gecs.net>
References: <001e01c223ef$7bdc0d50$0805010a@gecs.net> <02070513202502.14428@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: jan.humme@xs4all.nl, netfilter@lists.samba.org

Dear
There was a typing mistake in syntax which i had given
I have entered the correct one in my iptable.
IF i am enabling ip_forward then there is no need to put put another iptable
prerouting rule for LAN ip the request should automatically get forwarded to
other interface ..which is not happening.
CAN u pls help me to get thru for my first case.
in tcp dump i can see the packet getting forwarded to 192.168.220.90:25 port
but cant see the reverse packet??
What could be the problem

Thanks and Regards
Deepali

----- Original Message -----
From: "Jan Humme" <jan.humme@xs4all.nl>
To: "deepali" <deepali@gecsl.com>; <netfilter@lists.samba.org>
Sent: Friday, July 05, 2002 4:50 PM
Subject: Re: port forward using iptables not happening


> On Friday 05 July 2002 08:44, deepali wrote:
> > Dear Support
> > My setup is ..I have one linux box having eth0(valid ip202.140.152.33)
and
> > eth1(invalid ip-local lan192.168.220.250) .I have one more machine in my
> > Local Lan (192.168.220.90) which is a mail server in my local LAN.Now I
> > want to 1.enable port forwarding ie any request comming on
202.140.152.33
> > port 285 should get forwarded to 192.168.220.90 port 25 my mail server.
> >
> > 2.Also any request comming from my lan ie 192.168.220.0/24 to invalid ip
of
> > linux box ie 192.168.220.90 285 should also forwarded to my Mail server
in
> > lan ie 192.168.220.30 port 25.
> >
> > My first synario is also not working.
> >
> > my rules are
> >
> > iptables -t nat -A PREROUTING -i eth0  -p tcp -d 202.140.136.90 --dport
285
> > -j DNAT 182.168.220.90:25
>
> You must have seen syntax error complaints about the DNAT option from
> iptables; in fact it should be:
>
> #iptables -t nat -A PREROUTING -i eth0 -p tcp -d 202.140.136.90 --dport
285
> -j DNAT --to-destination 192.168.220.90:25
>
> > iptables -t nat -A POSTROUTING  -o eth0 -j MASQURADE
>
> Should read: MASQUERADE, but in that case is OK, and allows your local
> machines to get out to the internet.
>
> > iptables -t nat -A POSTROUTING -s 192.168.220.0/24 -j MASQURADE
>
> ?? Why? Isn't this already covered by the previous masquerading rule?
>
> And how about:
>
> #iptables -t nat -A PREROUTING -p tcp -d 192.168.220.90 --dport 285 -j
DNAT
> --to-destination 192.168.220.90:25
>
> This is the exact equivalent of your point 2), only expressed in iptables
> syntax.
>
> Jan Humme.
>


