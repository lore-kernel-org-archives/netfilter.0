From: leolistas@solutti.com.br
Subject: Re: Performanace fo the Iptables Server
Date: Thu, 28 Aug 2003 23:21:25 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062123685.3f4eb8a5cc8d8@www.solutti.com.br>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall>
Content-Disposition: inline
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



   This is a very hard to answer question ....... 

   There are several other variables that should be analised to decide if 
this machine is enough for doing this accounting without having 
performance problems on the machine.

   1) it doesnt matter how many machines we have, we do matter about how 
much TRAFFIC flows thru this machine. Is this a 256k leased line for 
internet access ? T1 ? 10Mbit ? 100Mbit ??

   2) are your disks IDE or SCSI ? Which size ? Probably newest SCSI 
disks will handle heavy I/O better than IDE.

   3) will graphs be generated once a day, twice a day, every hour, on 
the fly ....... generation of the graphs on the same machine will impact 
on the CPU performance and I/O because you'll have one client doing HEAVY 
reads on MySQL database and iptables doing HEAVY inserts. Generating 
graphs on other machine wont take too much cpu power, but will surely 
take I/O because of MySQL reading and writing .....


   So, as you can see, there are some other variables that should be 
analised. If we're talking on something as 256k, 512k, maybe this machine 
will do it without problems. But if we're talking on heavier traffic, 
maybe this machine wont be enough.

   And, unfortunelly, i dont know an exact way of choosing the right 
computer configurations for a specific need. You'll have to try and watch 
for its performance ........ if it's not enough, get a bigger machine. 
If's that's enough, so that's enough :)


  Sincerily,
  Leonardo Rodrigues


Citando hare ram <hareram@sol.net.in>:

> Hi all
> 
> I have RH 9.0
> PIII with 550Mhz
> 512MB RAM
> 
> working fine with Iptables+TC+HTB
> 
> Now i want o make accounting system using ULOG
> 
> so i introduced  to send all logs to Mysql
> So i can make my own Graphs
> 
> iptables -A INPUT -j ULOG
> iptables -A FORWARD -j ULOG
> iptables -A OUTPUT -j ULOG
> 
> 
> the Server is connected to Several Clients
> 
> does this server will have any Impact of performance
> or this PC can handle Easily
> 
> how can caluculate the PC configuration,



