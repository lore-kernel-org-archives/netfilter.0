From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 08:46:22 -0300
Message-ID: <000c01c4d6d2$3756ad00$8b00000a@casa>
References: <OF477B7587.3D58856F-ON65256F5C.00384B89@pricol.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org


    Dont forget that this rule will block ANY type of resolutions for 
domains that contains MX in their names, just like 'flashmx.com' for 
example.

    I think you should get some tcpdump's and get the exactly HEX dump of 
the MX query type and use with --string --hex-string instead of using simple 
string rules.


    Sincerily,
    Leonardo Rodrigues

----- Original Message ----- 
From: <hclfm@pricol.co.in>
To: "pravin rane" <pgr_80@yahoo.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, November 30, 2004 7:36 AM
Subject: RE: How to block only MX query made to DNS server


>
>>>I tried to run following command
>
>>># iptables -t filter -A INPUT -p udp --dport 53 -m
> string --string "MX" -j DROP
>
>>>But I am getting Error like
>
>>>iptables v1.2.8: Couldn't load match
>>>`string':/lib/iptables/libipt_string.so: cannot open
>>>shared object file: No such file or directory
>
>>>:-( Do I need to upgrade my iptables RPM
>
> Yes. Or rebuild kernel with strings modules support and compile iptables
> userspace
> again if necessary. Sorry for top posting in my previous reply.


