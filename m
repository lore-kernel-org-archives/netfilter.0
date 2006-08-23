From: Matt Singerman <msingerman@ncemch.org>
Subject: Re: Problems configuring iptables
Date: Wed, 23 Aug 2006 14:58:18 -0400
Message-ID: <44ECA54A.2000905@ncemch.org>
References: <580B00011E6B2F4980CAC67A08FECC3AF765CE@rpo.oldplacerville.csvaluation.lan>	<44EC95B0.1090808@ncemch.org>
	<44EC966C.6000002@ncemch.org> <44EC9CE0.10308@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44EC9CE0.10308@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Martijn Lievaart wrote:
> Matt Singerman wrote:
>
>> Wow, that came out looking all messed up, let me try sending that again:
>>
>> Hmmm...  That is definitely part of it, yeah.  But there is something 
>> else going on here.
>>
>> So I tried changing the chain policy to ACCEPT and to just block all 
>> traffic using an iptables rule.  When I implement the rules as 
>> follows, things work:
>>
>> Chain FORWARD (policy ACCEPT)
>> target     prot opt source               destination       ACCEPT     
>> tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
>> flags:FIN,SYN,RST,ACK/SYN
>> DROP       tcp  --  anywhere             anywhere      tcp dpt:ssh 
>> flags:FIN,SYN,RST,ACK/SYN
>>
>> As you can see, that is just blocking all traffic from anywhere to 
>> anywhere on port 22 after allowing traffic from x.y.z.116 to 
>> x.y.z.120 through.  (x.y.z.116 and x.y.z.120 are both on the same 
>> subnet, but 120 is behind the firewall and 116 is not.)  x.y.z.116 
>> can SSH in to x.y.z.120, but nothing else can.
>>
>> If I try to change it so that it isn't just blocking traffic on port 
>> 22, but rather all traffic:
>>
>> Chain FORWARD (policy ACCEPT)
>> target     prot opt source               destination       ACCEPT     
>> tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
>> flags:FIN,SYN,RST,ACK/SYN
>> DROP       tcp  --  anywhere             anywhere
>>
>> No SSH connections can get through at all, even from host x.y.z.116.
>>
>> Any ideas what could be causing this odd behavior?
>>
>
> Nothing odd here. First you allow all all syns from .116 to .120. You 
> dorp all other syns. You allow all other traffic, which includes all 
> non-syn traffic. In the second scenario you aloow the syns, but frop 
> all non syn traffic. So the syn gets through, but the syn-ack from the 
> ssh server gets dropped.
>
> What you should be doing is this:
>
> # let through all traffic from established connections
> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> # let through the connection request
> -A FORWARD -p tcp --dport 22 -s x.y.z.116 -d x.y.z.130 -j ACCEPT
> # log and drop all other traffic
> -A FORWARD -j LOG
> -A FORWARD -j DROP
>
> For further information, read the howtos at the www.netfilter.org site.
>
> HTH,
> M4
>

Hi Martijn,

This did work, yes!  Thanks!  I am experiencing a new problem, though: 
it took an extremely long time for the connection to go through.  Once 
it connected, it runs at normal speed, but it took a good 30 or 40 
seconds for ssh to prompt me for my password.  What could be causing 
this?  I am guessing it is some sort of routing issue?

