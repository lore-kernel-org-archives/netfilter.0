From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: nat
Date: Tue, 25 Nov 2003 22:33:03 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC4491F.1020002@smgtec.com>
References: <GGEFKDNEPJHKAMAGGLFLGEDLCBAA.wpfontenot@cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GGEFKDNEPJHKAMAGGLFLGEDLCBAA.wpfontenot@cox.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Fontenot <wpfontenot@cox.net>
Cc: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i <your inet iface> --destination 1.1.1.1 
-p tcp --dport 3306 -j DNAT --to 192.168.1.1
   If you have sane filtering rules (same as IOS access-list), you will 
also have to open up the FORWARD chain for inbound traffic:
iptables -A FORWARD -i <your inet iface> --destination 192.168.1.1 -p 
tcp --dport 3306 -j ACCEPT

reading the iptables man pages fills in most of the important stuff, and 
if that isn't enough, you could always read the documentation on 
netfilter.org for more info than you'll need.

Paul Fontenot wrote:

>Not sure what the ipfilter lingo is for what i want to do so I will
>demonstrate with a Cisco PIX ACL.
>
>access-list outside_access_in permit tcp any host 1.1.1.1 eq 3306
>
>There would be a static for the 1.1.1.1 address:
>
>static (inside,outside) 192.168.1.1 1.1.1.1
>
>Where the MySQL server is running on host 192.168.1.1 and that ip is mapped
>via a static translation to 1.1.1.1 on the PIX's outside interface.
>
>
>
>  
>


