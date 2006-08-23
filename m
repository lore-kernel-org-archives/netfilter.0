From: Matt Singerman <msingerman@ncemch.org>
Subject: Re: Problems configuring iptables
Date: Wed, 23 Aug 2006 13:54:52 -0400
Message-ID: <44EC966C.6000002@ncemch.org>
References: <580B00011E6B2F4980CAC67A08FECC3AF765CE@rpo.oldplacerville.csvaluation.lan>
	<44EC95B0.1090808@ncemch.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44EC95B0.1090808@ncemch.org>
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

Wow, that came out looking all messed up, let me try sending that again:

Hmmm...  That is definitely part of it, yeah.  But there is something 
else going on here.

So I tried changing the chain policy to ACCEPT and to just block all 
traffic using an iptables rule.  When I implement the rules as follows, 
things work:

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination       
ACCEPT     tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
flags:FIN,SYN,RST,ACK/SYN
DROP       tcp  --  anywhere             anywhere      tcp dpt:ssh 
flags:FIN,SYN,RST,ACK/SYN

As you can see, that is just blocking all traffic from anywhere to 
anywhere on port 22 after allowing traffic from x.y.z.116 to x.y.z.120 
through.  (x.y.z.116 and x.y.z.120 are both on the same subnet, but 120 
is behind the firewall and 116 is not.)  x.y.z.116 can SSH in to 
x.y.z.120, but nothing else can.

If I try to change it so that it isn't just blocking traffic on port 22, 
but rather all traffic:

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination       
ACCEPT     tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
flags:FIN,SYN,RST,ACK/SYN
DROP       tcp  --  anywhere             anywhere

No SSH connections can get through at all, even from host x.y.z.116.

Any ideas what could be causing this odd behavior?

Matt Singerman wrote:
> Hmmm...  That is definitely part of it, yeah.  But there is something 
> else going on here.
>
> So I tried changing the chain policy to ACCEPT and to just block all 
> traffic using an iptables rule.  When I implement the rules as 
> follows, things work:
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        ACCEPT     
> tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
> flags:FIN,SYN,RST,ACK/SYN
> DROP       tcp  --  anywhere             anywhere      tcp dpt:ssh 
> flags:FIN,SYN,RST,ACK/SYN
>
> As you can see, that is just blocking all traffic from anywhere to 
> anywhere on port 22 after allowing traffic from x.y.z.116 to x.y.z.120 
> through.  (x.y.z.116 and x.y.z.120 are both on the same subnet, but 
> 120 is behind the firewall and 116 is not.)  x.y.z.116 can SSH in to 
> x.y.z.120, but nothing else can.
>
> If I try to change it so that it isn't just blocking traffic on port 
> 22, but rather all traffic:
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        ACCEPT     
> tcp  --  x.y.z.116            x.y.z.120     tcp dpt:ssh 
> flags:FIN,SYN,RST,ACK/SYN
> DROP       tcp  --  anywhere             anywhere
>
> No SSH connections can get through at all, even from host x.y.z.116.
>
> Any ideas what could be causing this odd behavior?
>
> Ross A. Del Duca wrote:
>> The 'hanging' is likely a result of a DNS lookup failing.  If you add 
>> -n to
>> your iptables command, it will not attempt to resolve DNS names, and 
>> may get
>> you around at least that little part.
>>
>>
>> Ross A. Del Duca, GCIH
>>  
>>> -----Original Message-----
>>> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
>>> bounces@lists.netfilter.org] On Behalf Of Matt Singerman
>>> Sent: Wednesday, August 23, 2006 8:49 AM
>>> To: netfilter@lists.netfilter.org
>>> Subject: Problems configuring iptables
>>>
>>> < SNIP >
>>>     
>>
>>  
>>> Also, if I try to add a rule to allow, say, SSH traffic to a specific
>>> machine behind the firewall, I run into other problems.  If I type:
>>>
>>> iptables -A FORWARD -s 0/0 -d w.x.y.z -p tcp --dport 22 --syn -j ACCEPT
>>>
>>> This is, so far as I am aware, the format I would use.  However, when I
>>> type iptables -L, the list just hangs just before listing that rule.
>>>
>>> Can anyone offer any pointers as to what I may be doing wrong, and what
>>> I can do to get this working?  Thanks!
>>>
>>> Regards,
>>>
>>> Matt
>>>     
>>
>>   
>

