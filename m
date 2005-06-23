From: Jason Opperisano <opie@817west.com>
Subject: Re: Help!!!
Date: Thu, 23 Jun 2005 10:35:39 -0400
Message-ID: <20050623143539.GA16666@bender.817west.com>
References: <14209331.20050623145054@adm.utm.md>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <14209331.20050623145054@adm.utm.md>
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

On Thu, Jun 23, 2005 at 02:50:54PM +0300, radu wrote:
> Hello all,
> 
>       My networck config:
> 
>   Internet -> linux box -> My PC(192.168.50.101)
> 
>   linux box
>   eth0 local 192.168.50.0/24
>   eth1 Internet
>   
>   my iptables config:
> 
> iptables -P FORWARD DROP
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 -j DNAT --to 192.168.50.101
> iptables -I FORWARD  -d 192.168.50.101 -p tcp --dport 4662 -j ACCEPT
> iptables -I FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -I FORWARD -s 192.168.50.101 -j ACCEPT
> iptables -t nat -I POSTROUTING -o eth1 -j MASQUERADE

a cleaned-up version of your script:

  iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 \
    -j DNAT --to 192.168.50.101
  iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

  iptables -P FORWARD DROP
  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A FORWARD -p tcp -d 192.168.50.101 --dport 4662 -j ACCEPT
  iptables -A FORWARD -s 192.168.50.101 -j ACCEPT

-j

--
"Meg: Oh no! I'm missing the news!
 Peter: We all miss The News, Meg, but Huey Lewis needs time to create,
 and we need to be patient."
        --Family Guy

