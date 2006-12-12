From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: is it possible to nat to the routed IP?
Date: Tue, 12 Dec 2006 09:23:44 +0100 (CET)
Message-ID: <1148.193.173.119.247.1165911824.squirrel@webmail.sterenborg.info>
References: <ad41208c0612112234m5f2e564fm217faff87955641a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ad41208c0612112234m5f2e564fm217faff87955641a@mail.gmail.com>
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
content-type: text/plain
To: netfilter@lists.netfilter.org


On Tue, December 12, 2006 07:34, Zhen Zhou wrote:
> Hi all,
>
>
> one example network looks like:

[ASCII image skipped)

> So is it possible to nat from 210.153.22.y to 192.168.2.208?
> If possible, how to do it=1B

The gateway must have a route for 192.168.2.x set to 192.168.5.202.
The default gateway for the router must be 192.168.5.201.
The default gateway for 192.168.2.208 must be 192.168.3.254.

Packet arrives at 210.153.22.y.
Packet is DNAT-ed to 192.168.2.208.
Gateway sends packet to 192.168.5.202.
Router at 192.168.5.202 routes packet to 192.168.2.208.

Example, http:

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -d 192.168.2.208 \
  -p tcp --dport 80 -j ACCEPT

$ipt -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 \
  -j DNAT --to 192.168.2.208


Grts,
Rob



