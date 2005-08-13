From: "Joris Dobbelsteen" <joris.dobbelsteen@mail.com>
Subject: RE: Blocking Google Earth
Date: Sat, 13 Aug 2005 21:44:26 +0200
Message-ID: <B9833546B2643B43A56C4E962E13174602A996@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Other solutions might include:

* Request the user not to use the application.
* Install a HTTP proxy server that catches all port 80 traffic. Squid =
might be a good candidate. Here you can easily make a policy to deny =
access to the kh.google.com servers (it was I believe).

An advantage of a proxy is increased response times for your users (and =
also a little decrease in bandwidth requirements). My experience with 3 =
users behind it was that response times decreased and bandwidth =
requirements did not change (noticably). With 600+ users that situation =
will change significantly.
Some proxies can also limit the priority of some traffic, e.g. for =
kh.google.com. Unfortunally google.com doesn't allow caching of google =
earth traffic (sigh), I forced it on my proxy. Yeah, I know, it =
increases the administrative workload...

Of course, I guess you use a decent machine for routing for 600+ users.

- Joris Dobbelsteen

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
>Thilo Schulz
>Sent: zaterdag, 13 augustus 2005 17:11
>To: netfilter@lists.netfilter.org
>Subject: Re: Blocking Google Earth
>
>On Saturday 13 August 2005 16:14, Leonardo Rodrigues Magalh=E3es wrote:
>>     I really dont think it's easy to limit bandwidth usage ONLY for=20
>> Earth Google without making bad experiencies on doing=20
>searchs on Google.
>> No matter if searches are low-bandwidth. If you get some QoS=20
>and band=20
>> limitation on google IPs, be sure that your google earth users will=20
>> use ALL the available bandwidth, thus making google earth as well as=20
>> google serching probably extremely slow.
>
>He only had that problem with one single user. Likewise, he=20
>can restrict bandwidth to google only for that one single user=20
>too. Like I already said, your proxy method can be easily=20
>circumvented using something like an SSL proxy after your=20
>proxy, whereas QoS can selectively keep a user from unfairly=20
>exceeding certain bandwidth. This will not only solve problems=20
>with the http protocol, but also problems with the user using=20
>too much bandwidth in general.
>
>--
>Thilo Schulz
>

