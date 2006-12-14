From: jwlargent <jwlargent@vlsmaps.com>
Subject: Re: Shouldn't this rule catch all packets
Date: Thu, 14 Dec 2006 15:46:33 -0600
Message-ID: <4581C639.5040208@vlsmaps.com>
References: <4581A2F1.10305@vlsmaps.com>
	<slrneo3b2o.8uu.xpisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrneo3b2o.8uu.xpisar@album.ics.muni.cz>
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
To: NetFilter <netfilter@lists.netfilter.org>

Petr Pisar wrote:
> On 2006-12-14, jwlargent <jwlargent@vlsmaps.com> wrote:
>   
>> I was trying to debug some errors in my iptables setup so I added the 
>> following rules to my OUTPUT, just to see what packets were going out.
>>
>> iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>> iptables -A OUTPUT -j ACCEPT
>>
>> When I do iptables -L OUTPUT -v it shows some packets are falling 
>> through to the last rule.
>> Shouldn't the first rule catch all the packets?
>>
>>     
> No. There exists forth state called INVALID. E.g. TCP packet with ACK
> witch is not part of any tracked TCP connection is INVALID. Naturally,
> INVALID packets are ill packets and they shoudn't appear, but the reality
> is different.
>
> -- Petr
>
>   
So I put in a log rule for --state INVALID and sure enough thats what it 
was.
The packets are part of my ssh connection, tcp with ACK.

IN= OUT=eth0 SRC=xxx.xxx.xxx.xxx DST=xxx.xxx.xxx.xxx LEN=276 TOS=0x10 
PREC=0x00 TTL=64 ID=1146 DF PROTO=TCP SPT=22 DPT=38858 WINDOW=3228 
RES=0x00 ACK PSH URGP=0


