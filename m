From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 08:47:00 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019948@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
To: =?iso-8859-1?B?SGVyduk=?= <herve@lucidia.net>, netfilter  <netfilter@lists.netfilter.org>

But if you giving eth0 IP addresses on two different subnets then you =
could just plug everything that's on eth1 onto the same network as eth0.

Just because it's Linux doesn't mean you can redefine IP routing and =
expect it to work.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Herv=E9
Sent: Wednesday, February 02, 2005 8:41 AM
To: netfilter=20
Subject: Re: Two NICS with same IP and same client IP

> Herv=E9 wrote:
>>
>> In my case, the point is to help the routing by modifying the source
>> address. For example, you give eth0 two addresses: 192.168.100.1 and
>> 192.168.101.1, and eth1: 192.168.100.1 (yes, the same) and
>> 192.168.102.1.
>
> what's the point ???
>
I have two identical test benches, in which one box has a fixed IP
address, hence I can't change the subnets.
What is more, this box always accesses the same IP address for the =
server.

Yeah, not so easy, but hey, it's Linux, so it's possible!

Cheers,
Herv=E9.


