From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: bandwidth monitoring
Date: Thu, 6 Jan 2005 11:04:22 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3AA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "J. Nerius" <jnerius@gmail.com>, Les Mikesell <les@futuresource.com>
Cc: netfilter@lists.netfilter.org

J. Nerius wrote:
> ntop is great for *short term* monitoring. Generally it will become
> unmanageable if run for too long. If you want to monitor and keep
> stats over a longer period of time, bandwidthd will probably work
> better for you.
>=20
> J.N.
>=20
> On Thu, 2005-01-06 at 11:42 -0600, Les Mikesell wrote:
>> On Thu, 2005-01-06 at 10:28, patrick.leduc@novipro.com wrote:
>>=20
>>> Does somebody know a program for monitoring bandwidth by ip? I have
>>> one internet interface and I must monitor many ips adresses on this
>>> interface. I tried Ipac-ng and, I worked a lot to do this config
>>> but it seems not working this way.
>>=20
>> Ntop might do what you need.  http://www.ntop.org.  It can summarize
>> and sort traffic by address/port/protocol, etc.  I don't use it
>> continuously but fire it up for a while if I think something is
>> hogging the network.=20

I'll address this as well. Ntop is fantastic at giving you snapshot data
of a network, but it is inanely heavy at long term monitoring of
services. It got to the point that monitoring traffic from the firewall
filled memory and CPU usage if run long enough. It doesn't work for
continuous operations.

The one really good thing about iptables is that every rule has a
counter fo the number of hits that you run through it, so it  is
possible to create custom counters for your software. This is not a
'simple' process, but it'll give you accurate traffic flows with
filtering, etc. that a normal libcap based tool can't give you. PS:
/proc/net/dev data is incorrect when netfilter & NAT are enabled. I
believe its because NAT (return?) traffic bypass this counter, so any
management tool that uses this technique for monitoring bandwith will
also be flawed on a netfilter router.


