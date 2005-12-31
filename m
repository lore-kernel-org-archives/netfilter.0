From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: [LARTC] Routing multiple conntections to the same ISP
Date: Sat, 31 Dec 2005 10:48:13 -0400
Message-ID: <65aa6af90512310648w7f95cfe5l877261bd36d13c52@mail.gmail.com>
References: <000e01c60df2$167f8360$eeeea8c0@OLE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c60df2$167f8360$eeeea8c0@OLE>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I think it's wrong.

Your original configuration was only migssing one entry: from
192.168.0.2 use table 4

it would be something like:
ip rule add pref 32000 from 192.168.0.2 table 4

and in table 4 you just need to have the default GW through the
desired device and that devices IP as the source.

Hope that's something you can start working with.

On 12/31/05, Niels Ole Salscheider <niels_ole@salscheider-online.de> wrote:
>
> Hi,
>
> I have established two connections to the same ISP. After that ip route l=
ist
> showed this:
>
> 195.14.247.94 dev ppp0  proto kernel  scope link  src 81.173.141.207
> 195.14.247.94 dev ppp1  proto kernel  scope link  src 81.173.237.84
> 192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.1
> default via 195.14.247.94 dev ppp0
>
> I want 192.168.0.2 to connect to the internet by ppp1 and all other
> computers to connect by ppp0. So I entered following commands in the shel=
l:
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables --table filter --policy FORWARD ACCEPT
>
> iptables --table mangle --append PREROUTING -s 192.168.0.2 --jump MARK
> --set-mark 4
> ip rule add fwmark 4 table 4
>
> Then I modified the main table and table 4, so that they looked like this=
:
>
> Server:~# ip route list
> 195.14.247.94 dev ppp0  proto kernel  scope link  src 81.173.141.207
> 192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.1
> default via 195.14.247.94 dev ppp0
>
> Server:~# ip route list table 4
> 195.14.247.94 dev ppp1  proto kernel  scope link  src 81.173.237.84
> 192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.1
> default via 195.14.247.94 dev ppp1
>
> an entered ip route flush cache in the shell.
>
> But after this, 192.168.0.2 could not connect to the internet anymore.
>
> What is wrong with my routing tables?
>
> Thanks,
>
> Ole
> _______________________________________________
> LARTC mailing list
> LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
>
>
>

