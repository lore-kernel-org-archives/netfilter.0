From: Kim Jensen <kimj@dawn.dk>
Subject: Re: clearing basics: semi-OT
Date: Thu, 10 Apr 2003 17:21:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304101721.36861.kimj@dawn.dk>
References: <20030410080650.GA1720@linux.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410080650.GA1720@linux.localdomain>
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
To: Payal Rathod <linux@rpayal.cjb.net>, netfilter@lists.netfilter.org

On Thursday 10 April 2003 10:06, Payal Rathod wrote:
> Hi,
> I am trying to clear some of my basics. I am reading IP-Masquerading HO=
WTO.
> In it these things were mentioned,
>
> UNIVERSE=3D"0.0.0.0/0"
> $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
>
> What exactly does 0.0.0.0/0 mean? And why should we be concerned with
> it? And what is the use of rule given after it?
>
0.0.0.0/0 means everybody!

The rule is saying that everything from and to the localhost should be=20
accepted - in general a very good thing, unless you know what you are doi=
ng!

> INTNET=3D"192.168.1.0/24"
> INTIP=3D"192.168.1.1/24"
>
> The first one means the entire network of 192.168.1.x? What exactly is
> the second one. Does it just means 192.168.1.1 then why "/24"?
> And lastly,
>
The 192.168.1.0/24 means: everything from 192.168.1.0 to 192.168.1.255. T=
he=20
/24 is part of the mask, read=20
http://www.netfilter.org/documentation/HOWTO//networking-concepts-HOWTO.t=
xt.

> $IPTABLES -N drop-and-log-it
> $IPTABLES -A drop-and-log-it -j DROP
>
> Why was this rule made? And why was it "dropped"? What is the logic
> behind this? Shouldn't it be,
> $IPTABLES -P drop-and-log-it DROP
>
There is no default chain called drop-and-log-it, which is why you make a=
=20
custom chain. A better version would be:
$IPTABLES -N drop-and-log-it
$IPTABLES -F drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG
$IPTABLES -A drop-and-log-it -j DROP

The first line creates a new chain (-N) with the name drop-and-log-it. Th=
e=20
second line (-F) flushes the new chain in case you already have this chai=
n=20
running. The third lines appends a rule which logs everything and finally=
 the=20
fourth line drops the packets.

/Kim


