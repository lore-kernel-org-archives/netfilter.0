From: "Yogini Parkhi" <yparkhi@bivio.net>
Subject: RE: measure traffic
Date: Tue, 8 Oct 2002 16:27:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385DA3327471554CA86AACAA2BBB8130250E7D@plstnexc01.corp.networkrobots.com>
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
To: Payal <payal@hotpop.com>, netfilter@lists.netfilter.org

Hi Payal,
I think you can just run cron jobs and take a snapshot of the ifconfig =
command or iptables -L -v  command. Then compare the outputs with dates =
and you will have the stats you need.

You can also zero the counters every hour if you want with iptables -Z =
after you save the counters for the last hour.
You can have your cron job add up packets etc.=20

Hope this helps,
Yogini


-----Original Message-----
From: Payal [mailto:payal@hotpop.com]
Sent: Tuesday, October 08, 2002 11:56 AM
To: netfilter@lists.netfilter.org
Subject: Re: measure traffic

Hi,
Thanks a lot all for the mail.
Well, I was thining more on lines of traffic every hour/day/week/month
etc. Cos' then I can challenge the server farm guys that their stats are
wrong.
Well, about ipac-ng I heard it has some problems with iptables 1.2.5 and
kernel 2.4.x. Does it work properly with these two?
Thanks a lot and bye.
-Payal
On Mon, Oct 07, 2002 at 09:17:33PM +0100, Antony Stone wrote:
> On Monday 07 October 2002 7:58 pm, PayalR wrote:
>
> > Hi,
> > I have a small urgent problem. As I told you all before, I have my =
single
> > Linux box at a server farm where I have to pay per Mb of data =
transmitted.
> > I have a doubt that those guys there are cheating me. They are =
taking more
> > money than actual data transmitted. Can I use iptables to log all =
incoming
> > and outgoing data and see total incoming/outgoing data in a =
day/week/month?
>
> Why not just use the byte counters in ifconfig ?
>
> eg: ifconfig eth1
>
> eth1      Link encap:Ethernet  HWaddr 00:02:2D:05:3F:8D
>           inet addr:192.168.44.101  Bcast:192.168.44.255  =
Mask:255.255.255.0
>           UP BROADCAST NOTRAILERS RUNNING  MTU:1500  Metric:1
>           RX packets:1930 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:1950 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:100
>           RX bytes:912045 (890.6 Kb)  TX bytes:265386 (259.1 Kb)
>           Interrupt:9 Base address:0x100
>
> So this machine I'm on now has received 912045 bytes and sent 265386 =
bytes
> since the interface was initialised....
>
> Antony.
>
> --
>
> The difference between theory and practice is that
> in theory there is no difference, whereas in practice there is.

