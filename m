From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Complex multi-homed/NAT setup
Date: Fri, 14 Jun 2002 07:57:48 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206140757.49121.raymondl@knowledgefactory.co.za>
References: <Pine.LNX.3.96.1020523114750.1680A-100000@defian.alphanet.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.3.96.1020523114750.1680A-100000@defian.alphanet.ch>
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
To: Marc SCHAEFER <schaefer@alphanet.ch>, netfilter@lists.samba.org

On Thursday 23 May 2002 12:51, Marc SCHAEFER wrote:
> Hi,
>
> I have the following setup:
>
>     external_net_1     \
>                          firewall  ---- internal_net
>     external_net_2     /
>
> the machine on the internal_net only has one IP address (in this case
> 193.72.186.6, could be e.g. 192.168.x.x), but must be reachable from =
the
> outside as: 62.2.159.14 and 194.38.85.209.
>
> The firewall has addresses 62.2.159.15, 194.38.85.206 and =
193.72.186.15
> (again, this one could have been 192.168.x.x).
>
> [ http://www-internal.alphanet.ch/~schaefer/nf_firewall/firewall.eps
>   for the graphical version
> ]
>
> The machine on the internal_net cannot do any special tricks. She =
must
> receive all packets to 193.72.186.6 (the from can be an external =
address).
> Now, the firewall must remember what was the incoming address =
(62.2.159.14
> or 194.38.85.209) and re-NAT it accordingly when it goes out, and =
send it
> on the correct outgoing interface.
>
> So far I have problems to make the SECOND thing work (ie it works for
> 62.2.159.14, but not for the other: the address is correctly NATed
> according to tcpdump -i external_net_2 -n, but does not ever reach =
the
> inside).
>
> You can look at the scripts and graphics at:
>
>   http://www-internal.alphanet.ch/~schaefer/nf_firewall/
>
> if you have any idea or hint please do :)
>
> I will try to debug this more, but I wanted to know if what I wanted =
is at
> all possible.
>
> thanks for any idea.

My solution was to bind the public ips for the internal machine on the=20
respective interfaces on the firewall. Therefore the firewall will =
reply to=20
arp requests from routers.
eg.
ifconfig eth1:0 62.2.159.14 netmask 255.255.255.192	<-- replace the =
netmask=20
with your own.
ifconfig eht2:0 194.38.85.209 netmask 255.255.255.0

Hope this helps

Ray

--=20
----------------------------------------

Ray Leach (Technical Network Specialist)

Knowledge Factory

www: http://www.knowledgefactory.co.za

Tel: +27-11-445-8100 Direct: 445-8263

Fax: +27-11-445-8101

"No matter where you go, there you are."

----------------------------------------

