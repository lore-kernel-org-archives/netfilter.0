From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 23:55:44 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501192355140.27524-100000@darkstar.sysinfo.com>
References: <20050119114804.13549.qmail@web30806.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050119114804.13549.qmail@web30806.mail.mud.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Query <linux_query@yahoo.com>
Cc: netfilter@lists.netfilter.org


man arp would be a good place to start, prior to asking here perhaps?

Thanks,

Ron DuFresne


On Wed, 19 Jan 2005, Linux Query wrote:

> 
> --- George Alexandru Dragoi <waruiinu@gmail.com>
> wrote:
> 
> > You can make a file with pairs of <ip> <mac> and
> > load it with arp -f ,
> > or man ethers then you can make firewall rules based
> > on ips only, of
> > course don;t forget to drop traffic in FORWARD which
> > not match your
> > clients's source ip.
> > 
> 
> Thank you! I didnt know about the /etc/ethers file. Is
> it possible to assign two ips for a single mac in that
> file and a single ip for two macs ?
> 
> e.g.   ip1   <mac1>
>        ip2   <mac1> 
> 
> and
>        ip3   <mac2>
>        ip3   <mac3>  
>       
> Besides, if i leave out some of the clients from the
> /etc/ethers file (I dont know all mac addresses right
> now) , will it create problems for those who are not
> included ?
> 
> Thanks and regards,
> jim
> 
> 
> 
> 
> 		
> __________________________________ 
> Do you Yahoo!? 
> Meet the all-new My Yahoo! - Try it today! 
> http://my.yahoo.com 
>  
> 
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


