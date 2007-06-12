From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Transparent web proxy
Date: Tue, 12 Jun 2007 15:39:12 +0200
Message-ID: <466EA200.6010202@freemail.hu>
References: <D91179BA-2C19-4DF7-9395-F06D13BF2149@ianmoyce.co.uk>
	<200706121338.41595.raymondl@knowledgefactory.co.za>
	<2A64E4F2-D73E-4E91-95EC-A80FCE6C33D3@ianmoyce.co.uk>
	<200706121514.18368.raymondl@knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200706121514.18368.raymondl@knowledgefactory.co.za>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: netfilter@lists.netfilter.org

Ray Leach =EDrta:
> On Tuesday 12 June 2007 13:44:07 Ian Moyce wrote:
>  =20
>> On 12 Jun 2007, at 12:38, Ray Leach wrote:
>>    =20
>>> On Tuesday 12 June 2007 13:13:08 Ian Moyce wrote:
>>>      =20
>>>> Hello,
>>>>
>>>> I am trying to set up transparent web proxy server, but from the
>>>> examples I have found on the web, I can not make it work.
>>>>
>>>> I am trying:
>>>>
>>>> iptables -A FORWARD -i vnet0 -o tun0 -p tcp -m state --state
>>>> ESTABLISHED,RELATED -j ACCEPT
>>>> iptables -t nat -A PREROUTING -i venet0 -p tcp --dport 80 -j REDIREC=
T
>>>> --to 8888
>>>>        =20
Maybe a mistype but: venet0 or vnet0 ???
>>>> Where tun0 is the VPN port, vnet0 (its actually vnet0:0) is the
>>>> network interface.
>>>>        =20
vnet0:0 ??? then you should use vnet0:0 or vnet+ in the rule.
>>>> Squid is listening on localhost:8888
>>>>
>>>> I get an error message when I run these 2 lines:
>>>>
>>>> # iptables -t nat -A PREROUTING -i venet0 -p tcp --dport 80 -j
>>>> REDIRECT --to 8888
>>>> iptables: No chain/target/match by that name
>>>>
>>>>
>>>> Help!!!
>>>>
>>>> Thanks
>>>>
>>>> Ian Moyce
>>>>        =20
>>> Seems like you're missing NAT support in your kernel maybe?
>>>      =20
>> Hi,
>>
>> NAT seems to be working okay as I am using it as a VPN server...!
>>    =20
I do not get it... I think you mix up something...
VPN !=3D NAT
>
> Specifically the REDIRECT target needs to be compiled into the kernel o=
r full=20
> nat support.
>  =20
Not true... You may have it as a module too.

Check if the NAT module loaded:

lsmod | grep iptable_nat

REDIRECT module:

lsmod | grep ipt_REDIRECT

>
>
> -----------------------------------------------------------------------=
-------------------
> This e-mail was checked by the e-Sweeper Service.
> For more information visit our website, Clearswift Corporation e-Sweepe=
r :
> http://www.mimesweeper.com/products/esweeper/
> -----------------------------------------------------------------------=
-------------------
>
>
>
>  =20



