From: Andy Lego <legoandy@gmail.com>
Subject: Re: Forward specific port to another ip
Date: Tue, 27 Dec 2005 13:36:57 -0500
Message-ID: <a46d47540512271036v71e355epf1f87cbb564b2996@mail.gmail.com>
References: <a46d47540512251043i5cb5ed51k64c58f41f9afd9f5@mail.gmail.com>
	<65aa6af90512251916p6e15b2c5pe044142c92ae0797@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90512251916p6e15b2c5pe044142c92ae0797@mail.gmail.com>
Content-Disposition: inline
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
To: Edmundo Carmona <eantoranz@gmail.com>, netfilter@lists.netfilter.org

Hi Edmundo,

Looks like I am doing something wrong:

root@andoria # iptables -t nat -A PREROUTING -p tcp --dport 8080 -j
DNAT --to-destination 192.168.114.100:80
root@andoria # telnet localhost 8080
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused
telnet: Unable to connect to remote host: Connection refused
root@andoria # telnet 192.168.114.100 80
Trying 192.168.114.100...
Connected to a.xx.com (192.168.114.100).
Escape character is '^]'.
^]
telnet> close
Connection closed.

iptables -t nat -L                                                   =20
                                                 ~
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere            tcp
dpt:webcache to:192.168.114.100:80

Is there anything else I should be doing?

Thank you.

Andy

On 12/25/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> that would be a DNAT rule on NAT PREROUTING, for starters (assuming
> we're working on a.xx.com).
>
> iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT
> --to-destination b.xx.com:80
>
> On 12/25/05, Andy Lego <legoandy@gmail.com> wrote:
> > Hi,
> >
> > I would like to forward all requests that come to system a.xx.com at
> > port 8080 to go to another system b.xx.com to port 80.
> >
> > For example, I am running a web server on system b.xx.com, but I want
> > it to look like it is running on a.xx.com on different port.
> >
> > Also, I want to do this on a.xx.com only, without touching the
> > firewall or b.xx.com.
> >
> > Any ideas?
> >
> > Thank you.
> >
> >   Andy
> >
> >
>


--
http://legoandy.com

