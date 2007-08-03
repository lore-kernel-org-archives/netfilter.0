From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Iptables rules processing
Date: Fri, 03 Aug 2007 18:23:10 +0200
Message-ID: <46B3566E.1010407@rchq.co.za>
References: <20070803161302.GB7815@sid.toystory.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------010601080700000507070308"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070803161302.GB7815@sid.toystory.lan>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010601080700000507070308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Franck Joncourt wrote:
> Hi,
>
> Assuming we have the next two rules in our ruleset :
>
> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 443 -j ACCEPT
>
> I was wondering whether rules are processed one by one.
> In the two rules above, we have to check the source address
> 192.168.10.14, so I think this is done for the first one, and then for
> the second one. I am not quite sure ; Can anyone confirm that ?
>
>   
Yes, rules are processed one by one until a rule matches the packet.

So the first rule above would be matched for traffic coming from 
192.168.10.14 going to port 80 (192.168.10.14 browses a website)
The second rule would be matched when 192.168.10.14 tried to browse a 
secure website.

Since bothe these rules are in the INPUT chain, they will only be 
matched when the source ip tried to access those ports on the machine 
running iptables.


-- 
<img src='http://www.danasoft.com/sig/spoonssig.jpg' />
--------------------------------------------------
RCHQ Hobbies cc
http://www.rchq.co.za and http://store.rchq.co.za
Fax: +27 86 652 2773       eMail: admin@rchq.co.za
P O Box 10376, Vorna Valley, Midrand, 1686
--------------------------------------------------


--------------010601080700000507070308--

