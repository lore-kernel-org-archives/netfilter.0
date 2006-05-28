From: "Manfred Stock" <manfred.stock@gmail.com>
Subject: Re: Controlling an iptables-match from userspace
Date: Sun, 28 May 2006 20:19:10 +0200
Message-ID: <815d745e0605281119g1ab45281h80f080b760399469@mail.gmail.com>
References: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
	<Pine.LNX.4.64.0605231402210.27281@mercury.sdinet.de>
	<815d745e0605230800t4b4f58a3s76f160788025fa95@mail.gmail.com>
	<200605260000.56259.max@nucleus.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605260000.56259.max@nucleus.it>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 5/26/06, Massimiliano Hofer <max@nucleus.it> wrote:
> I recently became maintainer of the condition patch.
> You can find a new version at
> "http://www.nucleus.it/pom-repo/condition.tar.gz". From now on it will be
> handled as an external repository.
>
> I'm working on some other changes that should make it more acceptable,
> althought I've been busy in the last couple of weeks.

Sounds good :) Btw. is there somewhere some more recent
Netfilter-Hacking-Howto-like documentation besides the kernel sources?
The Howto was not even for 2.6, and at least 2.6.16 had some larger
netfilter-related changes...


> Some considerations:
> - adding a new system call or ioctl is more intrusive than a proc interfa=
ce;

Definitely. Adding a new setsockopt option as mentioned in the Howto
would be another possibility, but it at least feels a little weird if
you can create a socket, set a special option on it and as a result
you have influenced the behaviour of netfilter... Nevertheless it's
fairly easy to use on the kernel side. Probably netlink/nfnetlink
would be another (not file based) alternative.


> - a file interface doesn't require a special app.

It also fits nicely into the "everything is a file" paradigm, and it's
easy to use if you do write a special app to use that functionality.


> You could argue about putting it in /sys or in the brand new configfs.
> I'd like feedback about the best way to handle this.

/sys seems to be intended for devices and their drivers and
configuration, so I'd rather not use it for the configuration of a
netfilter match. But after a short look at
Documentation/filesystems/configfs/configfs.txt I would say that
configfs was intended for this kind of stuff. As for /proc, I don't
really know what to say, but my feelings are that it should rather not
be used for new non process related things - they have duplicated some
hardware related things in /sys which were in /proc already (e.g. the
information in /proc/scsi/scsi), and even moved things out of /proc
into /sys (iirc, this happened to some i2c/sensors-related stuff).
Similar things might happen with configfs. This is why I would prefer
a solution not involving /proc. But as I'm not really into kernel
programming, I might be completely wrong ;).


Best regards
Manfred

