From: Petrisor Bobalca <petry.b@gmail.com>
Subject: Re: port blocking
Date: Fri, 25 Mar 2005 16:05:27 +0200
Message-ID: <1215179231.20050325160527@gmail.com>
References: <20050325120012.38609.qmail@web51910.mail.yahoo.com>
Reply-To: Petrisor Bobalca <petry.b@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hello,

usually you can bind the webserver on a specific IP address (for apache
use BindAddress in httpd.conf). if not, use this iptables rule before
accepting packets on eth0, eth2, eth3, eth4:

iptables -A INPUT -p tcp -i ! eth1 --dport 10000 -j DROP

On Friday, March 25, 2005, 2:00:12 PM, Manish wrote:

> Hi,
=20
> I am having 5 network inteface card on my server,  2 connected to
> ethernet and 3 connected to wireless. i am also running webserver on
> port 10000 in the same machine. I only wanted the users from eth1 to
> be able to connect to my web server. users from other interface i.e
> eth0, eth2.eth3 and eth4 will not be able to connect to my web
> server. What iptables rule should i use.
=20
> Thanks.

=09=09
> ---------------------------------
> Do you Yahoo!?
>  Yahoo! Mail - 250MB free storage. Do more. Manage less.



--=20
Best regards,
 Petrisor                            mailto:petry.b@gmail.com


