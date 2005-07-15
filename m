From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 20:52:18 +0200
Message-ID: <42D805E2.4050004@fastwebnet.it>
References: <BAY17-F18542F2DB3D75F41B0487580D00@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F18542F2DB3D75F41B0487580D00@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Suzana Lojic-Skoric wrote:

>
>
>> From: J=F6rg Harmuth <harmuth@mnemon.de>
>> To: netfilter@lists.netfilter.org
>> Subject: Re: DNS and NAT
>> Date: Fri, 15 Jul 2005 10:53:17 +0200
>>
>> Suzana Lojic-Skoric schrieb:
>>
>> > I don't think proxy can help because it is just caching the web page=
s,
>> > it does not change the IP addresses. I'll check if tunneling can hel=
p,
>> > if not then I'll have to change iptables to inspect DNS answer and
>> > replace the IP in the payload.
>>
>> No. Introducing a proxy at the right location, is much more than just
>> caching web sites. It means significant changes to at least to the IP
>> headers.
>>
>> Wether a proxy helps you or not depends totally on where you place the
>> proxy. If you place it on the nat box (like primero said) or between
>> this nasty dropping box and the nat box, everything is probably fine.
>> The requests will then go to 10.x.x.x and the answers will originate
>> from 10.x.x.x. The e.g. google address of 216.239.39.99 is within the
>> *data* part of the 4th packet - not in the headers (headers are
>> src=3D10.y.y.y dst=3D10.x.x.x). As long as the nasty dropping box does=
n't
>> scan the packets payload for proxy requests and the like and drops the=
m,
>> everything should work.
>
>
> I can put the proxy on the NAT machine.
> As I said, right now just with the NAT, if I send a DNS request for=20
> the google.com from the client 10.0.0.1 behind the nasty dropping box,=20
> it will go out through the nasty dropping box and the NAT gateway. NAT=20
> will change its 10.x.x.x source and destination from 10.x.x.x to some=20
> outside addresses e.g. 150.x.x.x. The DNS answer comes back to NAT,=20
> it's source and destination gets translated back to 10.x.x.x and=20
> 10.0.0.1 destination, and the google address 216.239.39.99 is within=20
> the *data* part. This goes fine through the nasty dropping box back to=20
> the client 10.0.0.1. Client then takes the answer from the data part=20
> of the message, which is 216.239.39.99 and tries to contact it. It=20
> sends an HTTP message to destination 216.239.39.99. This gets dropped=20
> on the nasty dropping box since it is not 10.x.x.x (This is what's=20
> happening when you type in www.google.com in the browser on the client=20
> 10.0.0.1).
> So the DNS request and answer can get through the internal network,=20
> but what I need is to somehow replace the 216.239.39.99 that is=20
> embedded in the DNS *data* with 10.z.z.z. Also my NAT needs to know=20
> that 10.z.z.z is actually 216.239.39.99. to be able to translate it=20
> for outside.
>
> Do you still think proxy can help?
>
with a *standard proxy* configured on the browser of client 10.0.0.1=20
your request for 216.239.39.99 will be in the payload of the proxy=20
request that has the IP address of your proxy machine in the destination=20
address field of the network layer ... it should be good for your nasty=20
dropping box.
 From there the HTTP request will be managed from your proxy wich will=20
answer to your client with a connection completely inside the 10.x.x.x=20
network.


bye
<f>

