From: "Mark C. Casey" <markcc@jadepress.co.uk>
Subject: RE: Redirecting from one ip to another problem
Date: Fri, 25 Jun 2004 11:44:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <627ED3D5182532448B61510FFAB3D37F10A944@srvdc01.jade.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Thanks for the help, it's much appreciated.

That 62.39.23.52 is a bit of a problem, with the current firewall if i =
try accessing 62.39.23.52 internally from say 192.168.0.1 or 172.16.0.1 =
I'm able to access 172.16.0.1 fine.

Anyways, not such a big deal for it (although I do admit it would be =
nice to have) as I'll be using domains and can simply point the domains =
at 172.16.0.1 for the internal network.

Thanks again,

Mark

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: 25 June 2004 11:34
To: netfilter@lists.netfilter.org
Subject: Re: Redirecting from one ip to another problem


On Friday 25 June 2004 11:02 am, Mark C. Casey wrote:

> Thanks, for dport would I have to do a couple of rules for the =
different
> ports?
>
> For example:
>
> iptables -A PREROUTING -t nat -s 172.16.0.1 -d 172.16.0.2 -p tcp =
--dport
> 1433 -j DNAT --to 192.168.0.1
> iptables -A FORWARD -s 172.16.0.1 -d 192.168.0.1 -p tcp --dport 1433 =
-j
> ACCEPT
>
> and
>
> iptables -A PREROUTING -t nat -s 172.16.0.1 -d 172.16.0.2 -p tcp =
--dport
> 5000:5025 -j DNAT --to 192.168.0.1
> iptables -A FORWARD -s 172.16.0.1 -d 192.168.0.1 -p tcp --dport =
5000:5025 -j
> ACCEPT

Yes.

> Or would it be possible to do multiple ports in the two rules?

There is a multi-port match patch available in patch-o-matic, however =
for the=20
limited number of ports you seem to want I suspect it's not worth going =
to=20
that bother.

On Friday 25 June 2004 11:16 am, Mark C. Casey wrote:

> Oh, another question.
>
> Is it possible to point an external ip address that we have to an =
internal
> machine so when said machine tries accessing the external ip address =
it
> simply accesses itself?

No, replies won't work.

> For example, say externally (on the internet) I have an ip address of
> 62.39.23.52. If 172.16.0.1 tries accessing 62.39.23.52 it simply =
points to
> 172.16.0.1 instead? (so, say I tried pinging or ftp'ing to 62.39.23.52 =
it
> would be accessing 172.16.0.1 from 172.16.0.1)

Think about it:

172.16.0.1 sends a packet to 62.39.23.52
Firewall NATs this address to 172.16.0.1
172.16.0.1 receives a packet with its own source address, and replies.
172.16.0.1 gets a reply packet from 172.16.0.1 (or, possibly, 127.0.0.1) =
when=20
it expected the reply to come back from 62.39.23.52
Machine unhappy - doesn't work.

Regards,

Antony.

--=20
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.



