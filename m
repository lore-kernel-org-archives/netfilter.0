From: Sertys <sertys@supportivo.org>
Subject: Re: netfilter - DROP lists .. efficiency under DDOS?
Date: Tue, 15 Mar 2005 00:03:32 +0200
Message-ID: <opsnnd76vu76nf2y@xonix>
References: <98432234187.20050314163445@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <98432234187.20050314163445@dslr.net>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

On Mon, 14 Mar 2005 16:34:45 -0500, <cmbb@dslr.net> wrote:

It really depends on the matches. It is stupid to have 10000 drops in the
filter table, cause each packet(SYN) has to be matched against each rule
and that's where your problem is.
You can(if you want) sector your traffic on smaller tables and drop there=
.
I.E everything in the range x.x.x.x - x.x.x.x2 going to table drop1,
y.y.y.y-y.y.y.y2 going to table drop2 and so on. This way you don't have
to traverse the whole rule tree everytime a packet hits your interface.
Normalization of rules is vital to you. If you're in front of fully rando=
m
IP's - that's a tough task to do. Log the flood packets and write a perl
parser to categorize them for you(i.e. sort them in classes). And the
enter them as rules in iptables or iproute2.

> I had an experience with a DDOS attack comprising some 10,000 IPs.
> Adding them individually as INPUT DROPS did not work because after 5000
> or so IPs, the box became too slow to pickup new packets from the card
> quickly enough, so we replaced one problem (flood) with another (random
> overruns on the card).
>
> The traffic was about 6mbit of small packets (SYNs and tiny data
> packets). About 10,000 packets per second.
>
> The more DROPs, the less packets per second could be handled. Removing
> all DROPS meant all packets could be handled .. although that just
> pushed the problem onto apache.
>
> My question is this .. how many DROPS can the latest netfilter
> adequately cope with before impacting the PPS speed of the linux box?
> Would -t raw have been a much better solution here?
>
> My network driver was e1000.o with NAPI compiled. Kernel was latest 2.4
> smp kernel. Machine was dual xeon with 2gb of memory. Nothing else of
> consequence running on the box.
>
> thanks
>



--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

