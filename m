From: =?iso-8859-1?Q?Herv=E9?= <herve@lucidia.net>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 14:32:16 -0000 (GMT)
Message-ID: <63838.57.66.65.39.1107354736.squirrel@57.66.65.39>
References: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
	<4200A1F3.8030609@imag.fr>
	<5172.57.66.65.39.1107338261.squirrel@57.66.65.39>
	<4200AB33.1010308@imag.fr> <1107352680.4916.8.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1107352680.4916.8.camel@hubcap.ljm.dom>
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
To: netfilter  <netfilter@lists.netfilter.org>

> On Wed, 2005-02-02 at 05:28, Raphael Jacquot wrote:
>> Herv=E9 wrote:
>> >>having 2 interfaces on the same box with the same IP address
>> >>
>> >>repeat after me :
>> >>
>> >>WILL NOT WORK
>> >
>> >
>> > Well, I can't see why not. Can you explain?
>
> maybe this is easier to grasp:
>
>   $ cd /var/tmp
>   $ mkdir new
>   $ mkdir new
>   mkdir: cannot create directory `new': File exists
>
> you're trying to do the same thing in the kernel.
>
> -j
>
> --
> "Dear Mr. President, there are too many states nowadays, please
>  eliminate three. I am not a crackpot."
>  --The Simpsons
>
Sorry guys, but this is indeed allowed. Your example might be valid if
you're talking MAC addresses and do not bridge the NICs, and even then I'=
m
not sure.

In my case, the point is to help the routing by modifying the source
address. For example, you give eth0 two addresses: 192.168.100.1 and
192.168.101.1, and eth1: 192.168.100.1 (yes, the same) and 192.168.102.1.

Now if you mangle the source address from 192.168.100.2 to 192.168.101.2
when it comes through eth0 and to 192.168.102.2 when it comes through
eth1, then the routing will work (chose the right interface) for the
reply. All you have to do is to change the addresses back before sending
on the network.

So, I want rules like this:
Prerouting:
- if interface is eth1, change network to 192.168.101.0
- if interface is eth2, change network to 192.168.102.0
Postrouting:
- if network is 192.168.101.0 or 192.168.102.0, then change network to
192.168.100.0

But I don't know how to enter just those rules...

Cheers,
Herv=E9.


