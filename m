From: Sudheer Divakaran <sudheer@svw.com>
Subject: Re:recent module  --hitcount problem
Date: Wed, 09 Mar 2005 21:22:38 +0530
Message-ID: <422F1BC6.3090806@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

> 
> Hi,
> 
> Is there anything wrong with these commands?.  It seems that the recent 
> module (0.3.1) is not considering  the '--hitcount 10' attribute if the 
> machine is running for a long time (in the long run).  But when I tested 
> these rules from another machine, it worked properly.  But on the live 
> server, iptables blocks hosts if they attempted to access the SMTP port 
> within 60 seconds for a second time.
> 
> IPT=/sbin/iptables
> 
> $IPT -N SMTP_HAMMER
> $IPT -N CHECK_SMTP
> 
> 
> $IPT -A SMTP_HAMMER -j LOG --log-level debug
> $IPT -A SMTP_HAMMER -m recent --set --name hammer -j DROP
> 
> $IPT -A CHECK_SMTP    -m recent     --rcheck --seconds 480 --name hammer 
>    -j DROP
> $IPT -A CHECK_SMTP    -m recent     --rcheck --seconds 60  --hitcount 
> 10     -j SMTP_HAMMER
> $IPT -A CHECK_SMTP    -m recent     --update                      
>           -j ACCEPT
> $IPT -A CHECK_SMTP    -m recent     --set                          
>          -j ACCEPT
> 
> 
> $IPT -A INPUT -i $WAN_IFACE    -p tcp --dport 25 -m state --state NEW  -j CHECK_SMTP
> 
> <.... Other rulles follows ..>


> --
> 
> Thanks
> Sudheer
> 
> 
> 
> 

Hi All,
	When I rebooted the machine, the server is working fine.  I have also 
noticed that when the recent module behaves unexpectedly, it just adds 
one 'last_pkts' entry to the file /proc/net/ipt_recent/DEFAULT for each 
host even though there should be more entries (i.e, if the hosts are 
connecting for more than one time).


Has anybody experienced it?. So this should be a bug???

--
Thanks
Sudheer

