From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 14:25:36 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40351bc0.48d2.0@arbbs.net>
Reply-To: black@arbbs.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


>I think you simply need to remove the "-d 161.x.x.x/21" from your rule and

>things will start working the way you want.
>
>Regards,
>

just wanted to make sure this is right.
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0  -j SNAT --to 161.x.x.x


<iptables -t nat -L -n> gives me

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
 
Chain POSTROUTING (policy ACCEPT) 
target     prot opt source               destination
SNAT       all  --  192.168.0.0/24       0.0.0.0/0          to:161.x.x.x

is that right? so that should mask my internetwork?  

john
 

http://www.arbbs.net/

