From: jwlargent <jwlargent@vlsmaps.com>
Subject: Re: Dropping Connections
Date: Fri, 22 Dec 2006 11:54:50 -0600
Message-ID: <458C1BEA.7070002@vlsmaps.com>
References: <503576.13829.qm@web56206.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <503576.13829.qm@web56206.mail.re3.yahoo.com>
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

Elvir Kuric wrote:
> Hi Tolga, 
>
> iptables working in way that it first check first
> rules that are writen in your firewall script.
> So you first have to allow everything you want and
> after that to stop traffic you do not wanted.
>
> If you have rules , A, B , C , D written in script in
> this order 
> A
> B
> C
> D
> iptables will check rule A first and so on. If rule A
> drop some traffic it will be droped even if you allow
> it again in rule B, or some other rule after A.
> for example 
> iptables -A INPUT -p tcp -m state --state
> NEW,RELATED,ESTABLISHED -j DROP
>
> iptables -A INPUT -p tcp -m state --state
> NEW,RELATED,ESTABLISHED -j ACCEPT 
>
> the first  rule will be just checked and you will not
> be able to accept new connections in INPUT chain (
> first rule ) even you allow it in seccond one. 
>
>
> To drop everything you can use for example 
> iptables -A INPUT -s 0/0 -p tcp --syn -j DROP
> iptables -A INPUT -s 0/0 -p udp -j DROP
>
> but apply these rules after all your rules that allow
> necessary traffic.
> I recommend you to read ( in my opinion the best
> manual  I ever read )
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
>
> So conclusion will be,iptables looks first rules
> first.
> See of course man iptables.
>
> Regards 
>
> Elvir Kuric
>
>
> To drop everything you can use for example 
> iptables -A INPUT -s 0/0 -p tcp --syn -j DROP
> iptables -A INPUT -s 0/0 -p udp -j DROP
>
>   

Why no just:
  iptables -A INPUT -j DROP


> but apply these rules after all your rules that allow
> necessary traffic.
> I recommend you to read ( in my opinion the best
> manual  I ever read )
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
>
> So conclusion will be,iptables looks first rules
> first.
> See of course man iptables.
>
> Regards 
>
> Elvir Kuric 
>
>
> --- Tolga Onbay <tolgaonbay@yahoo.com> wrote:
>
>   
>> Hi,
>>
>> I want to drop all connections from/to subnet if I
>> don't allow. For example, accept msnmessenger
>> protocol with l7-filter and forward all 80
>> connections to content filtering software. Then I
>> want to drop all connections. I write the rules and
>> add the default action type to Drop. But now the
>> clients cannot connect to msnmessenger. (I write the
>> msnmessenger rule to FORWARD chain) 
>>
>> Also, noone answer my previous mail, If I asked to
>> wrong group or something wrong with the subject
>> please remind me.
>>
>> Thanks
>>
>>
>> Tolga
>>
>>
>> __________________________________________________
>> Do You Yahoo!?
>> Tired of spam?  Yahoo! Mail has the best spam
>> protection around 
>> http://mail.yahoo.com
>>
>>
>>     
>
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com 
>   


