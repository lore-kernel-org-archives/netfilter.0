From: "Diana Asnani" <sakal_woman@hotmail.com>
Subject: Re: newbie at routing
Date: Thu, 08 Jun 2006 18:51:06 +0800
Message-ID: <BAY19-F195FD9DD1C7DF4B681F1759E8B0@phx.gbl>
References: <4487FCDD.5070702@bernardi.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4487FCDD.5070702@bernardi.net>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Matt,

yup... this was included in the /etc/sysctl.conf file in the 192.168.206.1 
PC:
net/ipv4/ip_forward = 1


>From: Matteo Cisilino <bdm@bernardi.net>
>To: Diana Asnani <sakal_woman@hotmail.com>
>Subject: Re: newbie at routing
>Date: Thu, 08 Jun 2006 12:33:01 +0200
>
>Diana Asnani wrote:
>>Hi,
>>
>>its Diana again...after setting "route add -net 202.184.41.0/24 gw 
>>192.168.202.14", i still could not ping 202.184.41.41 ( the PC )....i 
>>could ping the 202.184.41.0 add
>>i also set the "route add -net 202.184.41.0/24 gw 192.168.206.1" but it 
>>says network unreachable....
>>
>>_________________________________________________________________
>>Find love online with MSN Personals. 
>>http://match.msn.com.my/match/mt.cfm?pg=channel
>>
>>
>Are you sure that 192.168.206.1 pc forwards the packates ? Even not do this 
>via root
>
>echo 1 > /proc/sys/net/ipv4/ip_forward
>
>to allow forwarding
>
>--
>Matto Cisilino
>
>http://wiki.alproject.org/index.php/Linux_Camp_2006
>
>

_________________________________________________________________
Get your mobile ringtones, operator logos and picture messages from MSN 
Mobile http://msn.smsfactory.no/


