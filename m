From: Martijn Lievaart <m@rtij.nl>
Subject: Re: -i interface filter not working for firewall
Date: Mon, 04 Dec 2006 19:58:25 +0100
Message-ID: <45746FD1.8010709@rtij.nl>
References: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>	
	<b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>	
	<4572F669.1000206@rtij.nl>
	<b020b8120612040541o1e713e77k51bd24aedc94b9e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b020b8120612040541o1e713e77k51bd24aedc94b9e@mail.gmail.com>
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
To: victor oliveira <victor.oliveira@concretesolutions.com.br>
Cc: netfilter@lists.netfilter.org

victor oliveira wrote:

>
> On 12/3/06, *Martijn Lievaart* <m@rtij.nl <mailto:m@rtij.nl>> wrote:
>
>     victor oliveira wrote:
>
>     > My problem is the following: I am able to connect from my machin=
e to
>     > the firewall using both eth2 and eth3. However, note that the IN=
PUT
>     > default is DROP, and the only rule on the INPUT SHOULD be filter=
ing
>     > and only allowing connections to the eth2 and not the eth3
>     > interface...
>
>
>     You rules are a bit messy, but it should probably work. Are you
>     sure you
>     connect through eth3? You do say it is from the same machine, if
>     you are
>     connected to eth2 and address the ip addres of eth3, you still
>     come in
>     through eth2.
>
> eth2 and eth3 are both connected to the same switch, and are not 
> virtual. Each with a different IP.
> eth2 has the IP 10.10.1.8 <http://10.10.1.8> and eth3 has the ip 
> 10.10.1.9 <http://10.10.1.9>.
> I=B4m using for testing a putty application from another machine, also=
 
> connected to the same switch.
> I know it should be working but it is not.
> Furthermore, I tested the mangle rules for multiple tables and it only=
 
> works without the -i option.
> My "solution" was to change to different subdomains and just not use 
> the -i restriction...
> any thoughts ?
>  


[ Please don't toppost]

Aha, but linux answers arp requests on any interface. So in this setup, 
an arp request for the address of eth3 can very well be answered by 
eth2. In fact it probably was, given your results. Try to turn of 
proxy_arp on the firewall or disconnect eth2 for the test. You'll 
probably see very different results then.

HTH
M4


