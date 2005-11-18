From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Many client with same IP
Date: Fri, 18 Nov 2005 11:07:32 -0400
Message-ID: <65aa6af90511180707s7aaee0bdqea24a60b0909fb51@mail.gmail.com>
References: <IQ5C7O$E2767ECC0C41D2F2833F0216F3EF135D@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <IQ5C7O$E2767ECC0C41D2F2833F0216F3EF135D@uol.com.br>
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

I would use a linux box that would snat (or masquerade) traffic going
to the DB. It would be a hup between your clients and the server, that
way traffic arriving at the server would appear as coming from this
linux box.

Say:

DB Server -- Linux Hub --  4 clients

on the linux hub:

iptables -t nat -A POSTROUTING -d serverIP -j SNAT --to myIP

You could also try connecting all of them to the same physical
network, but it would take a different approach:

To the clients, the "hub" would be the DB server... only that the hub
will forward traffic (with DNAT) to the server and it would have to
masquerade traffic going to the server so that the server (once again)
believe that it has a single client.

iptables -t nat -A PREROUTING -d myIP [additional rules to recognize
DB service traffic] -j DNAT --to-destination serverIP

iptables -t nat -A POSTROUTING -d serverIP -j SNAT --to myIP

Make sure forwarding is enabled and that would be it..... I guess. ;-)

On 11/18/05, Pedro Drimel <pedrodrimel@uol.com.br> wrote:
> Hi all,
>
> I need to do a configuration in a server that I don't know if is possible=
.
>
> The clients connect to the server under ssh to access the database, I nee=
d that some clients connect under only one IP, because the database count o=
nly one license for four IPs. The first thing that I tought was to take a m=
achine and do it a gateway and the clients of local network connect to the =
server thgouth this new server and in this new server will be a SNAT, well =
OK with a sub network but I thinked that this could be possible using iptab=
les on the server that run the databse (the server ever is linux). The clie=
nts use putty with Windows XP.
>
> Firstly I configured another IP on the network device:
> ifconfig eth0:0 10.0.0.10 netmask 255.255.255.0
> then I did this rule:
> iptables -t nat -A POSTROUTING -s 10.0.0.20 -j SNAT --to 10.0.0.10
>
> 10.0.0.20 is the IP of the client
> 10.0.0.10 is the IP of "logic" network device
>
> but it did not function... I tried this rule with the IP of eth0 (10.0.0.=
9) but eighter did not function...
>
> Sorry for my bad english...
>
> Best Regards.
>
>
>

