From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Detecting/Defeating Spambots
Date: Tue, 07 Jun 2005 14:51:39 +0300
Message-ID: <42A58A4B.3090801@hotpop.com>
References: <Pine.LNX.4.61.0506061244340.1874@UniXpress93.unixpress.com>	<42A585A8.3060001@hotpop.com>
	<42A586B5.7020405@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A586B5.7020405@hotpop.com>
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
To: netfilter@lists.netfilter.org

Georgi Alexandrov wrote:

> Georgi Alexandrov wrote:
>
>> Lucky Leavell wrote:
>>
>>> OS: SuSE 9.3 Pro
>>>
>>> I work with a small ISP and we are encountering with increasing 
>>> frequency Windows machines which have been compromised and 
>>> apparently being used as spambots based on their attempted 
>>> connection to port 25 of foreign hosts instead on using our mail 
>>> server for outgoing mail.
>>>
>>> With allowance for legitimate exceptions, could we simply disallow 
>>> port 25 connections from within our networks to any but our mail 
>>> servers?
>>
>>
>> Yes, something like that:
>> iptables -A FORWARD -p tcp -s $our_networks -d ! 
>> $our_mail_server_ip_addr --dport 25 -j DROP
>
>
> Or, if you have multiple mail servers, something like that:
> iptables -A FORWARD -p tcp -s $our_networks -d $first_mail_server 
> --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp -s $our_networks -d $second_mail_server 
> --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp -s $our_networks -d $third_mail_server 
> --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp -s $our_networks --dport 25 -j DROP

Or, you can DNAT all requests to port 25/tcp to your server, like that:
iptables -t nat -A PREROUTING -p tcp -s $our_networks --dport 25 -j DNAT 
--to $our_mail_server

>
>>
>>> (We run all outgoing -as well as incoming- mail thru 
>>> amavis/clamav/spamassassin.)
>>>
>>> Any other thoughts or links to resources?
>>>
>>> Thank you,
>>> Lucky
>>>
>>>
>>>  
>>>
>>
>>
>>
> regards,
> Georgi Alexandrov
>
>


