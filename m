From: Daniel VRABIOIU <danyvip@pattco.ro>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 17:53:53 +0200
Message-ID: <41EE8291.20505@pattco.ro>
References: <20050119114804.13549.qmail@web30806.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

arp -f only force for an ip a static mac. so you cant specify 2 mac 
addresses or 2 ips in ethers. you can do that using iptables instead.
also, if you dont know the mac associated with an ip then you can ping 
it then use arp to see it. if an ip isnt listed in ethers then it can be 
used with any mac address.


Linux Query wrote:

>Thank you! I didnt know about the /etc/ethers file. Is
>it possible to assign two ips for a single mac in that
>file and a single ip for two macs ?
>
>e.g.   ip1   <mac1>
>       ip2   <mac1> 
>
>and
>       ip3   <mac2>
>       ip3   <mac3>  
>      
>Besides, if i leave out some of the clients from the
>/etc/ethers file (I dont know all mac addresses right
>now) , will it create problems for those who are not
>included ?
>
>Thanks and regards,
>jim
>  
>


