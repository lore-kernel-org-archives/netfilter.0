From: Linux Query <linux_query@yahoo.com>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 03:48:04 -0800 (PST)
Message-ID: <20050119114804.13549.qmail@web30806.mail.mud.yahoo.com>
References: <3063e50501190257de42d67@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50501190257de42d67@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


--- George Alexandru Dragoi <waruiinu@gmail.com>
wrote:

> You can make a file with pairs of <ip> <mac> and
> load it with arp -f ,
> or man ethers then you can make firewall rules based
> on ips only, of
> course don;t forget to drop traffic in FORWARD which
> not match your
> clients's source ip.
> 

Thank you! I didnt know about the /etc/ethers file. Is
it possible to assign two ips for a single mac in that
file and a single ip for two macs ?

e.g.   ip1   <mac1>
       ip2   <mac1> 

and
       ip3   <mac2>
       ip3   <mac3>  
      
Besides, if i leave out some of the clients from the
/etc/ethers file (I dont know all mac addresses right
now) , will it create problems for those who are not
included ?

Thanks and regards,
jim




		
__________________________________ 
Do you Yahoo!? 
Meet the all-new My Yahoo! - Try it today! 
http://my.yahoo.com 
 


