From: Jason Opperisano <opie@817west.com>
Subject: Re: port blocking
Date: Fri, 25 Mar 2005 10:00:30 -0500
Message-ID: <1111762830.4745.3.camel@hubcap.ljm.dom>
References: <20050325120012.38609.qmail@web51910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050325120012.38609.qmail@web51910.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2005-03-25 at 07:00, Manish wrote:
> Hi,
>  
> I am having 5 network inteface card on my server,  2 connected to ethernet and 3 connected to wireless. i am also running webserver on port 10000 in the same machine. I only wanted the users from eth1 to be able to connect to my web server. users from other interface i.e eth0, eth2.eth3 and eth4 will not be able to connect to my web server. What iptables rule should i use.

run a default drop policy, and then allow what you want:

  iptables -P INPUT DROP
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A INPUT -i eth1 -p tcp --syn --dport 10000 -j ACCEPT

-j
 
--
"Man, you go through life, you try to be nice to people, you struggle
 to resist the urge to punch 'em in the face, and for what?"
	--The Simpsons


