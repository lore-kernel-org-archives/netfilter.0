From: "Zhen Zhou" <zhouzhenzj@gmail.com>
Subject: Re: is it possible to nat to the routed IP?
Date: Tue, 12 Dec 2006 23:18:42 +0800
Message-ID: <ad41208c0612120718q3fff3c3ai2e668e62b5fb4408@mail.gmail.com>
References: <ad41208c0612112234m5f2e564fm217faff87955641a@mail.gmail.com>
	<1148.193.173.119.247.1165911824.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1148.193.173.119.247.1165911824.squirrel@webmail.sterenborg.info>
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
content-type: text/plain; format="flowed"
To: netfilter@lists.netfilter.org

On 12/12/06, Rob Sterenborg <rob@sterenborg.info> wrote:
>
> On Tue, December 12, 2006 07:34, Zhen Zhou wrote:
> > Hi all,
> >
> >
> > one example network looks like:
>
> [ASCII image skipped)
>
> > So is it possible to nat from 210.153.22.y to 192.168.2.208?
> > If possible, how to do it=1B
>
> The gateway must have a route for 192.168.2.x set to 192.168.5.202.
> The default gateway for the router must be 192.168.5.201.
> The default gateway for 192.168.2.208 must be 192.168.3.254.
>
> Packet arrives at 210.153.22.y.
> Packet is DNAT-ed to 192.168.2.208.
> Gateway sends packet to 192.168.5.202.
> Router at 192.168.5.202 routes packet to 192.168.2.208.
>
> Example, http:
>
> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -d 192.168.2.208 \
>   -p tcp --dport 80 -j ACCEPT
>
> $ipt -t nat -A PREROUTING -d 210.153.22.y -p tcp --dport 80 \
>   -j DNAT --to 192.168.2.208
>
>
> Grts,
> Rob
>

Thanks a lot, now it works perfect.

Now the another issue is coming:

before we monitor the gateway network traffic via snmp, because I
assign 210.153.22.y to eth1, so I get snmp figure from eth1, and then
draw the network traffic, but  I am lazy to IP alias, so I use:
ip addr add 210.153.22.y dev eth1

Ofcs, the result is that I couldn't monitor it via snmp, at this kind
status, how could I monitor network traffic?

any tips, thanks a lot,

Zhou

