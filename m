From: shardul Adhikari <free2squid@gmail.com>
Subject: iptables query
Date: Fri, 25 Mar 2005 11:07:06 +0530
Message-ID: <6c2d1c9d05032421374d594338@mail.gmail.com>
Reply-To: shardul Adhikari <free2squid@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi list, 
I am relatively new to iptables 

i am trying this 

iptables -A PREROUTING -t nat -i eth0 -d 202.75.112.3 --dport 8080 -j
REDIRECT --to-port 3128 .
Now the problem is it does not get redirected , 
if i remove the -d part , it works just fine 
but i do not want to redirect for any destination , but only if
request comes for a particular destination .
Is there any thing wrong that i am doing , or do i have to use some
different chain or ruleset ,

please help

