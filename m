From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Is it possible to Jam windows network neighbour?
Date: Wed, 25 Aug 2004 08:10:03 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512CC@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> O.K.
> I am putting a fictitious situation as follows :
>
> Linux server with iptables firewall acts as Gateway
> for internet configured as DHCP server with only mac
> address setup in DHCP configuration file, having win
> 98 clients.
> Another Linux server acts as File server, having it's
> owm iptables rules to block unwanted mac-addresses
> same win 98 clients also acts as DHCP server.
>
> Now win client setup have Gateway IP as IP of Internet
> Gateway and WIN server IP as IP of file server.
>
> DHCP HOWTO asks to add following lines for individual
> clients in DHCP configuration file.
>
> ####
> host xyz {
>    hardware ethernet 08:00:2b:4c:59:23;
>    fixed-address 192.168.1.222;
> }
>
> ####
> In this case Can i use above setting by eliminating
> line specifying IP address (fixed-address
> 192.168.1.222;
> )?

you can use the combination of "host xyz { hardware ethernet =
08:00:2b:4c:59:23; }" in combination with "deny unknown clients;" in you =
pool declaration to achieve this.

> so that IP addrress/subnet of client will not be known
> to anybody.
>
> Now if outside user with Laptop try to connect to this
> network with one of the network switch, with concent
> of any win 98 client user and in absence of
> administator by assigning any IP address of any subnet
> (By trying permutation combination of 192.0.0.0,
> 10.0.0.0, 172.0.0.0) then will not get access to any
> win 98 machine by netbour neighbour.

if the laptop is connecting to the same switch as the "known" win 98 =
client, your internet gateway firewall is not really going to help you.  =
fancy DHCP isn't going to help you either.  the person with laptop can =
sit on the wire and figure out *very* quickly what IP addresses are =
assigned to the "known" win 98 clients.

your situation is one of the hardest to secure:  your attacker with the =
laptop not only has physical access, but also have the consent of the =
victim, and there's no administrative presence...  one defense would be =
to use win2000/xp on the "known" clients and lock them down via group =
policy and remove admin privileges from the users of those machines in =
an effort to save the users from themselves.  my guess is that this is =
completely infeasible for your situation.

-j

