From: "Jonathan" <phonic@antisocial.nu>
Subject: Re: Route packets from an interface to another
Date: Fri, 9 Sep 2005 23:18:03 +0200 (CEST)
Message-ID: <2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509091636.37287.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509091636.37287.rob0@gmx.co.uk>
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

> On Friday 2005-September-09 14:51, Jonathan wrote:
>> I think so. On box1 I type these commands:
>
> You think so, what? Is there some way I should be able to tell what
> you're on about? Please, this top-posting makes it very difficult; show
> some consideration for your readers.
sorry. :-)
>
>> >> > On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
>> >> >> I have the following interface configuration on two boxes:
>> >> >> box1: eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
>> 192.121.234.223
>>
>> >> >> box2: lo:0 192.121.234.213 netmask 255.255.255.255
>
> lo:0 ?? Don't do this. Why are you trying to bind another IP to lo?
a guy I talked to told me to do it, I have no other explaination.
>
>> >> >> between box1 and box2 I have a OpenVPN tunnel (endpoints
>> >> >> 10.1.0.1 and 10.1.0.2).
>
> Why these IP's? You could simplify by using the remote static IP as the
> IP for your home endpoint. IINM you wouldn't need NAT at all.
>
> Remote eth0: 192.121.234.212 netmask 255.255.255.240
> Remote tun0: 192.121.234.212 netmask 255.255.255.240
> Home tun0 192.121.234.213 netmask 255.255.255.240
>
> When something comes in on eth0 with a destination IP of
> 192.121.234.213, your kernel knows it needs to go out tun0. If routing
> is enabled and nothing blocking it in table filter chain FORWARD, out
> it goes.
>
> What you are talking about is indeed possible. I did it myself before
> figuring out the better way of doing it. :) You need to do both SNAT
> and DNAT.
Yeah, your solution was much better than mine. :-p
If I understand you right, the only thing I have to do is to edit my
openvpn-config and restart the tunnel? No edit in routing tables? And I
have to set up 192.121.234.213 as an alias of eth0 at the remote box,
right?


I also found out this when I played with my solution. Dunno if it's
interesting...
I'm trying to establish an SSH session from a machine on a totally
different network.
# ssh 192.121.234.213
Read from socket failed: Connection reset by peer
# ssh 192.121.234.213
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
bla, bla, bla, bla. And the RSA key fingerprint belongs to box2. Then I
deleted the key from known_hosts and ssh'd again
# ssh 192.121.234.213
and I could log into box2.
but the connection freezed a second after the login, so I ssh'd again.
# ssh 192.121.234.213
ssh: connect to host 192.121.234.213 port 22: No route to host

192.121.234.213 was NOT in the kernel routing table at this time.
so I added it, flushed cache and deleted it again, and suddenly I could
log in and establish an IRC session. But then I tried to FTP to my home
box via 192.121.234.213 -- and everything freezed and I got the error
message "no route to host". Then I repeated the same procedure, but I
ftp'd the box first this time, and then ssh'd and established an IRC
session. Everything worked. But when I tried to reach the box via HTTP th=
e
connection freezed.


