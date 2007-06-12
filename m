From: Ian Moyce <ian@ianmoyce.co.uk>
Subject: Re: Transparent web proxy
Date: Tue, 12 Jun 2007 12:44:07 +0100
Message-ID: <2A64E4F2-D73E-4E91-95EC-A80FCE6C33D3@ianmoyce.co.uk>
References: <D91179BA-2C19-4DF7-9395-F06D13BF2149@ianmoyce.co.uk>
	<200706121338.41595.raymondl@knowledgefactory.co.za>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200706121338.41595.raymondl@knowledgefactory.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Leach <raymondl@knowledgefactory.co.za>, netfilter@lists.netfilter.org

On 12 Jun 2007, at 12:38, Ray Leach wrote:

> On Tuesday 12 June 2007 13:13:08 Ian Moyce wrote:
>> Hello,
>>
>> I am trying to set up transparent web proxy server, but from the
>> examples I have found on the web, I can not make it work.
>>
>> I am trying:
>>
>> iptables -A FORWARD -i vnet0 -o tun0 -p tcp -m state --state
>> ESTABLISHED,RELATED -j ACCEPT
>> iptables -t nat -A PREROUTING -i venet0 -p tcp --dport 80 -j REDIRECT
>> --to 8888
>>
>> Where tun0 is the VPN port, vnet0 (its actually vnet0:0) is the
>> network interface.
>>
>> Squid is listening on localhost:8888
>>
>> I get an error message when I run these 2 lines:
>>
>> # iptables -t nat -A PREROUTING -i venet0 -p tcp --dport 80 -j
>> REDIRECT --to 8888
>> iptables: No chain/target/match by that name
>>
>>
>> Help!!!
>>
>> Thanks
>>
>> Ian Moyce
>
>
> Seems like you're missing NAT support in your kernel maybe?
>

Hi,

NAT seems to be working okay as I am using it as a VPN server...!


