From: Florian Boelstler <euphoria@web.de>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 23:47:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E334EC.1080606@web.de>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv> <200406301429.14248.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406301429.14248.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I have a similar problem.

My traceroute says:

traceroute to www.google.akadns.net (66.102.11.99), 30 hops max, 38 byte
packets
traceroute: sendto: Operation not permitted
 1 traceroute: wrote www.google.akadns.net 38 chars, ret=-1
[ ... ]

My setup is rather simple. I have "black-boxed" router connected to the
internet, that is able to forward traceroutes. My client is equipped
with netfilter.
When I disable my local netfilter on the client, traceroute works fine.

I use

$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

at the beginning of my firewall script.

Nevertheless traceroute does not work.

Do I miss something?

Thanks.

Cheers,

  Florian


Antony Stone wrote:
> On Wednesday 30 June 2004 2:05 pm, Peter Marshall wrote:
>
>
>>Hi.  I was wondering what I would need for rules to have traceroute work
>>through my firewall.  (I have a box behind the firewall trying to get out
>>using traceroute).
>>
>>I have an allow established connections on my forwared chain, and I am
>>allowing anything from the source IP of the box in question to leave
... It
>>appears that the problem is on the packets comming back in .. but I am not
>>sure what I have to do to fix it ....
>
>
> Allow RELATED packets as well as ESTABLISHED.
>
> Regards,
>
> Antony.
>




...............................

Someone on the net said:
Frank, have you been sniffing medical samples again? - Hawkeye


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFA4zTswT2gPfZm6tURAoOnAKCtHbVHsvg7nrTBCviE4DVydenpQgCfeVuS
jdBS08sKpALhTTMJ+gGYcsc=
=g53n
-----END PGP SIGNATURE-----

