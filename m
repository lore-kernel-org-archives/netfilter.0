From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: IPs blocked still able to connect
Date: Mon, 14 Jun 2004 09:32:14 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040614093214.4e35cf16@mgalepc.utilitran.com>
References: <20040613135859.51704919@mgalepc.utilitran.com>
	<200406140853.i5E8rsqE031321@ylpvm43.prodigy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406140853.i5E8rsqE031321@ylpvm43.prodigy.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	I did not mean you should be using -I for all your inserts .... when you load
you rules from a script ... a "-A" will work fine. But when adding a rules on
the fly later .. you most likely want to do a "-I" so it is at the top of the
list.

Example:

From script:

iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -i eth0 -j DROP

Now you find that you want to block spam from mai.hotmail.com (1.1.1.1)

Doing this:
iptables -A INPUT -i eth0 -s 1.1.1.1 -p tcp --dport 25 -j DROP 

Would cause the following to happen:
INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
INPUT -i eth0 -j DROP
INPUT -i eth0 -s 1.1.1.1 -p tcp --dport 25 -j DROP 

This has the port 25 ACCEPT happening before the DROP rule for 1.1.1.1 ... so it
would be accepted.

If you run:
iptables -I INPUT -i eth0 -s 1.1.1.1 -p tcp --dport 25 -j DROP 

Then you would of had:
INPUT -i eth0 -s 1.1.1.1 -p tcp --dport 25 -j DROP 
INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
INPUT -i eth0 -j DROP

As you can see the DROP for 1.1.1.1 comes first .. so SMTP from 1.1.1.1 would be
dropped before the ACCEPT ... blocking SMTP from 1.1.1.1

Michael.


On Mon, 14 Jun 2004 01:54:19 -0700
"Spiro Azkoul" <spiro@snacorp.net> wrote:

> By doing the -I transition no one could connect to my server anymore. 
> 
> Knowing that I had a bunch of rules such as 
> 
> [root@linux root]# iptables -L INPUT 
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> DROP       all  --  YahooBB219000000000.bbtec.net/8  anywhere           
> DROP       all  --  AAnnecy-204-1-27-120.w81-249.abo.wanadoo.fr  anywhere
> 
> DROP       all  --  61.178.0.0/16        anywhere           
> DROP       all  --  53-bem-10.acn.waw.pl  anywhere           
> DROP       all  --  216.155.64.0/19      anywhere    
> RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere           
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3
> 
> That did not work
> No one could connect for POP or SMTP. 
> What is wrong with that config?
> Thanks
>        
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

