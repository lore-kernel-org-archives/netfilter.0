From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: feature request
Date: Thu, 14 Apr 2005 15:37:04 -0300
Message-ID: <425EB850.1060506@solutti.com.br>
References: <aec22fc50504140950949956c@mail.gmail.com>
	<425EB3F5.5020003@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425EB3F5.5020003@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


    Guys, how about using the new comment module for making grepping 
easy ???? Instead of grepping the rules parameters, you can include an 
unique ID as a comment in your rule and simply grep for it !!! What do 
you think ??

iptables -I FORWARD -i eth0 -o ppp0 -p tcp -s 12.34.56.78 -d 10.20.30.40 
-m state --state NEW,ESTABLISHED -m time --timestart 08:00 --timestop 
15:45 --days Mon,Wed,Fri -m comment --comment "my_super_crazy_rule" -j 
ACCEPT

[root@correio ~]# iptables -nL FORWARD -v | grep my_super_crazy_rule | wc -l
1
[root@correio ~]# iptables -nL FORWARD -v | grep 
my_nonexistant_super_crazy_rule | wc -l    
0
[root@correio ~]#


    Sincerily,
    Leonardo Rodrigues

Taylor, Grant escreveu:

>> more? Why not return failure and say "rule already loaded?" It`s not a
>> critic, i just want to understand why i can need more than 1 same rule
>> for 1 chain.
>
>
> I'm just guessing here but I'd be willing to bet that the actual 
> kernel space of IPTables is more like a database that gets traversed 
> in kernel space.  The iptables command line tool is probably a user 
> land space tool for listing, inserting, updating, and deleting entries 
> in that database.  I'd say that to make things simpler the kernel does 
> not do any checking to make sure that a rule is distinct as there is 
> no harm in having multiple identical rules saver for the fact that it 
> is an additional rule to traverse.  The iptables command line tool was 
> not written to do any checking either as it is not required and this 
> would probably complicate things quite a bit more.
>
>> So, i`d prefer to write something simular to init scripts, when i have
>> to remember state of each loaded rule: is it loaded or not. But here
>> there are other problems: what if i manually add/delete rule? this
>> should not happen if i have 'my super system', but it`s life... so
>> again i have to reinvent wheel.
>
>
> You might try taking a look at iptables-save and iptables-restore 
> respectively.  From the output of iptables-save it looks like all the 
> lines that it generates would go directly after the iptables command.  
> I.e. if you would normally type:
>
> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
>
> You would see the following in the iptables-save output:
>
> -A FORWARD -i eth0 -o eth1 -j ACCEPT
>
> I'd be willing to bet that it is easier to parse this output than the 
> normal iptables output for what you are doing.  Take a look at it and 
> see if it will work for you.
>
>
>
> Grant. . . .
>
>
