From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ip range generic matches
Date: Wed, 26 Feb 2003 03:31:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302260331.32469.netfilter@newkirk.us>
References: <7dfe27f780.7f7807dfe2@student.uml.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7dfe27f780.7f7807dfe2@student.uml.edu>
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
To: William Olbrys <william_olbrys@student.uml.edu>, netfilter@lists.netfilter.org

On Wednesday 26 February 2003 01:23 am, William Olbrys wrote:
> is there a syntax to to create a generic match for a range of ips
> instead of the whole thing?
>
> ex.: $IPTABLES -t filter -A FORWARD -s 10.1.2.0-10.1.5.255 -j ACCEPT
>
> i tried to do this and it gave me an error about not being able to
> find the host. is there a workaround?
>
> will olbrys

Using a mask value.  You won't get that particular range into a single=20
rule with a mask though. 10.1.2.0/21 or 10.1.2.0/255.255.248.0 will=20
match 10.1.0.0 through 10.1.7.255, for example.  Your simplest rules for=20
an accurate match to the range you listed above are:

$IPTABLES -A FORWARD -s 10.1.2.0/23 -j ACCEPT
$IPTABLES -A FORWARD -s 10.1.4.0/23 -j ACCEPT

where the first will match 10.1.2.0-10.1.3.255 and the second will match=20
10.1.4.0-10.1.5.255.  Keep in mind that the mask used in an iptables=20
rule doesn't have to have any real meaning outside the rule - it's not=20
the subnet mask, just specifying which bits are fixed and which are=20
variable to match the rule. =20

It's also handy sometimes to know that you can use non-contiguous bits in=
=20
the mask: 10.1.1.1/255.255.0.1 is valid, and will match all odd numbers=20
in the last octet, throughout the whole 10.1.x.y address range.=20
(obviously this mask can't be expressed as an integer, and cannot be a=20
valid subnet mask)  You can accomplish really interesting things with=20
this, like routing odd vs even DHCP-assigned IP's out different routes=20
with the MARK target.  (often closer to an even distribution than trying=20
to split into 2 fixed ranges of IPs :^)  It can also be convenient for=20
DROPping some broadcasts - 10.1.1.255/0.0.0.255 will match ANY address=20
that ends in a 255.

j


