From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: One to One NAT
Date: Sat, 8 Feb 2003 13:24:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302081324.44635.netfilter@newkirk.us>
References: <4F7882716A6FD311AC7000508B6F4AEA5A814824@ranger.corp.cdw.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4F7882716A6FD311AC7000508B6F4AEA5A814824@ranger.corp.cdw.com>
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
To: EricRyd@cdw.com, netfilter@lists.netfilter.org

On Wednesday 05 February 2003 01:27 pm, EricRyd@cdw.com wrote:
> I have been given a task to setup One to One NAT on a Linux box.  If
> I'm correct I need to do this
>
> iptables -t nat -A PREROUTING -p tcp -d 192.168.1.1-j DNAT
> --to-destination 172.100.1.1
>
> First off, is this the correct syntax?  If not, I can't find for sure
> what I would have to do.  Any suggestions?

This rule will take any TCP packets entering the box with destIP of=20
192.168.1.1 and change that destIP to 172.100.1.1.  If that is the way=20
you want the packets changed (and not the other way around) then your=20
syntax is correct. :^)  You also have to ensure this traffic is ACCEPTed=20
in the FORWARD chain.  Also, you might (depending on the nature of the=20
traffic) want/need to allow ESTABLISHED and RELATED state connections=20
through FORWARD as well - you'd at least need return traffic ACCEPTed.

> Second, here is another scenario I have to do.  I work for Tech
> Support, and we have a lab full of devices to assist us when working
> with Customers.  Our internal IP Scheme is 192.168.0.0/16.  Some of
> the devices are 192.168.1.0/24 and can't be changed.  The original
> plan was to setup a 1:1 NAT with the Linux box to forward to the /24
> network so we could use all of the devices, but since I have been
> given the project I can't see it working. How will the Linux box know=09
> which network to pass information on to since they are both
> 192.168.x.x.  Any suggestions or ideas?

If the are on the same network wiring, and the 192.168.0.0/16 doesn't=20
have any machines with IPs overlapping the 192.168.1.0/24, you should be=20
fine.  The only problem you would have is the 192.168.1.0/24 machines=20
wouldn't realize that the others are actually local.  If there's no=20
overlap, and they don't need to talk to each other directly, you should=20
be able to do it.

If they are on separate wiring, separate interfaces in the Linux box, I=20
think you can get it to work by making sure the /24 route appears first,=20
before the /16 route, but I'm not certain of this, and it wouldn't=20
really be 'proper'...  Routing itself might be accomplished by marking=20
all /16 packets in mangle prerouting then setting up separate routing=20
for that mark, but again you couldn't handle any overlaps.

In iptables rules themselves you can 'cheat' and use a mask like=20
255.255.1.0 to separate odd and even numbers in the third octet, but=20
you'd need to ensure that the /24 network doesn't use any odd numbers=20
then.  Still not a good solution, and wouldn't address routing issues=20
without getting into full-time marking, since I don't believe that=20
iproute2 supports funky masks like this.  (I might be wrong though)

j

> Thanks in advance,
>
> Eric


