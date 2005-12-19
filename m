From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: multiple internet connections and routing
Date: Mon, 19 Dec 2005 11:06:08 -0400
Message-ID: <65aa6af90512190706o4d1d6f1co656bc5c5f3eed21d@mail.gmail.com>
References: <43A68D0F.7000807@vdbogaard.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A68D0F.7000807@vdbogaard.com>
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

You set ip to use separate routing tables.

with iproute2 you can use different routing tables for different traffic.

You can tell ip to use a routing table X (which only has a single
default GW using one of your wan links) for traffic coming from LAN x,
and to use routing table Y (which only has a default gateway using the
other wan link) for traffic coming from lan y. That should do.

Guidelines:
http://lartc.org/howto/lartc.rpdb.html
This is interesting too:
http://lartc.org/howto/lartc.rpdb.multiple-links.html

Oh... and consider posting in the larct mail list, cause I think it's
"fitter" there. :-)... you're welcome. ;-)

On 12/19/05, Paul van den Bogaard <paul@vdbogaard.com> wrote:
> Hi,
>
> currently I have two firewalls. Each firewall connects its own internal
> network to the Internet using its own single (broadband) connection.
>
> This means I have two similar setups running in parallel
>
> I would like to do this all on a single firewall. Not sure how to go ther=
e.
>
> Result should be one firewall doing NAT, such that
>
>         all trafic from/to network 10.1.5 (interface eth1) should go inte=
rface
> eth0 (internet gateway 1)
>         all trafic from/to network 10.1.6 (interface eth2) should go to
> interface eth3 (internet gateway 2)
>
>         If one of the internet gateways is unable to operate (provider fa=
ilure,
> routing error up stream) I should be able to temporarely route all
> traffic to the other internet gateway.
>
> How to configure the box?
>
> Help, links etc are very much appreciated.
>
> Thanks
> Paul van den Bogaard
>
>

