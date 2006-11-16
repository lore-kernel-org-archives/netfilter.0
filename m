From: Alex Feldman <alex@alexandrite.boisestate.edu>
Subject: Re: opening up an ipchain
Date: Thu, 16 Nov 2006 12:53:06 -0700
Message-ID: <200611161953.kAGJr6Sn027476@alexandrite.boisestate.edu>
References: <200611142055.kAEKt2IY017525@alexandrite.boisestate.edu>
	<455C9C5A.2090905@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <455C9C5A.2090905@plouf.fr.eu.org> (message from Pascal Hambourg
	on Thu, 16 Nov 2006 18:14:02 +0100)
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
To: pascal.mail@plouf.fr.eu.org
Cc: netfilter@lists.netfilter.org

>>>>> ":" =3D=3D Pascal Hambourg <pascal.mail@plouf.fr.eu.org> writes:

:> Hello, Alex Feldman a =C3=A9crit :
>>  I know nothing about ipchains.

:> Fine, here we're talking about iptable, the successor of
:> ipchains. :-)

Right, but evry tutorial or FAQ I pick up seems to refer back to
ipchains, an I wanted to discourage people from ding that here.

>> iptables -A INPUT -p udp -i eth0 --sport 53 --dport 1024:65535 -j
>> ACCEPT iptables -A INPUT -p tcp -i eth0 --sport 53 --dport 1024:65535
>> -j ACCEPT

:> These two rules are possibly harmful : they allow any incoming packet
:> to a non privileged local port from any host using source port
:> 53. Better deal with DNS replies in the generic rule allowing
:> established/related connections.

Yes, good point.  Even if they aren't harmful, that's a better way to do
it.=20

>> iptables -A INPUT -p tcp -i eth0 --dport 80 --sport 1024:65535 -m
>> state --state NEW -j ACCEPT
>>=20
>> #---------------------------------------------------------------
>> # Allow previously established connections
>> #---------------------------------------------------------------
>> iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED -i
>> eth0 -p tcp

:> Don't restrict this rule to TCP. It's also needed for other protocols
:> : DNS replies using UDP, ICMP ping and traceroute replies, ICMP
:> signalling messages...

Again, good point.  Thanks.

>> *********************************************************************
>>=20
>> Some of this I copied off the web, and I do not understand why I need
>> all of it, e.g., all the 1024:65535 port identifiers.

:> "--sport 1024:65535" means that connections to your services should
:> are expected to come from unprivileged source ports, which is usually
:> true.  However it's not really useful.

Good.  Thanks.

>> However, I would like to open up the computer further, maybe not all
>> the way but for the moment that would be OK, to my own laptop via its
>> mac address - I figure that would be pretty safe, but if not, I'd
>> like to hear why not.

:> It is not safe because it is very easy to spoof a MAC address.

OK.  This was just for use around the house, but it didn't work anyway,
see below.

>> So I added the line:
>>=20
>> iptables -A INPUT -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT
>>=20
>> and some variations on it, like with "-p all" in there, at various
>> places in the file, but none of them worked (and they all had my real
>> mac address in there, I just took it out before I displayed this to
>> the world).

:> Be aware that this will work only when the client and the server are
:> on the same network (link layer). MAC addresses don't go through
:> routers.

And apparantly the wireless box I have that the phone company sold me
does this.  I thought it wouldn't be a problem, since I treat the house
as one segment, but apparantly it is.

>> especially since the basic file seems to work even though the first
>> thing I do is drop all input, and then allow some back later.

:> No, you don't drop first then allow later, else nothing would
:> work. The first three commands (--policy or -P) just set the default
:> policy of the chains to DROP. The default policy tells what to do
:> when the packet doesn't match any rule with a "terminal" target and
:> reaches the end of the chain. So it's rules first then default
:> policy, regardless of the location of the --policy commands in the
:> script.

Thanks, I finally figured this out, and it is nice to have it further
clarified.=20

OK, so here is my idea now: Open up the computer to port 22 for a ssh
connection, with keys that I put on my computer at home and my laptop.
THen I can ssh in, securely.  The risk is that I leave my laptop
somewhere, there would be no way to get in without that key.  Once in
via ssh, I would open up a few other ports via ipchains to let me get my
IMAP mail or whatever else, and then close them right back down again.
That seems simple enough.

Thanks very much - this has been very halpful.

--=20
	--alex			alex@math.boisestate.edu

        <a href=3D"http://math.boisestate.edu/~alex/">Alex Feldman</a>

