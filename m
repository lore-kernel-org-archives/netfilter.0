From: Samuel =?iso-8859-1?B?RO1heiBHYXJj7WE=?= <samueldg@arcoscom.com>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 13:09:43 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923110943.14715.qmail@arcoscom.com>
References: <415290B1.5030401@imag.fr>
	<20040923103428.GK27327@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923103428.GK27327@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

For DNS query only UDP is necesary, not TCP. 

Regards, 

Nick Drage writes: 

> On Thu, Sep 23, 2004 at 11:00:33AM +0200, Raphael Jacquot wrote:
>> hi,
>> I have a setup that looks like :
>>  _____                                ____
>> [     ] 192.168.0.100                [    ]
>> [ DNS ]------------------------------[ FW ]----
>> [_____]                192.168.0.254 [____] (isp) 
>> 
>> and I want the DNS to answer to queries from the outside
>> what's the proper way of doing this ?
> 
> I'm presuming that you want to answer queries from everywhere, rather
> than just from specific hosts, in which case: 
> 
> iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p udp --dport
> 53 -j DNAT --to-destination 192.168.0.100 
> 
> iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p tcp --dport
> 53 -j DNAT --to-destination 192.168.0.100 
> 
> iptables -A FORWARD --destination 192.168.0.100 -p udp --dport 53 -j
> ACCEPT 
> 
> iptables -A FORWARD --destination 192.168.0.100 -p tcp --dport 53 -j
> ACCEPT 
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 
> 
> I'd be interested to hear how you get on by the way, I'm not quite sure
> that my iptables rulebases are keeping state on DNS requests correctly.=
 
> 
> -- 
> mors omnia vincit 
> 
 


Samuel D=EDaz Garc=ED=ADa
Director Gerente
ArcosCom Wireless, S.L.L. 

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn/fax: 956 70 13 15 



