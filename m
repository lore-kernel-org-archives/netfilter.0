From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: opening port for SSH
Date: Fri, 09 Dec 2005 16:23:44 +0200
Message-ID: <43999370.8010504@gmail.com>
References: <dn9dag$je3$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dn9dag$je3$1@sea.gmane.org>
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

Edwin Kapauni wrote:

> From the recent thread 
> <http://www.spinics.net/lists/netfilter/msg33021.html> I have adopted 
> this ruleset for a standalone computer.
>
> Now, I need some help teaching me how to open ports for SSH and VoIP.
> That shouldn't be too difficult, right?
>
> ######################### start ###########################
>
>
> iptables -F
> iptables -X
> iptables -Z
> iptables -t nat -F
> iptables -t nat -X
> iptables -t nat -Z
> iptables -t mangle -F
> iptables -t mangle -X
> iptables -t mangle -Z
>
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
>
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
> iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT
> iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT
> iptables -A INPUT -p tcp --syn --dport 113 -j REJECT --reject-with 
> tcp-reset
>
>
> ############################# end #################################
>
> Thanks for any help.
>
>
>
If you are running your ssh server on port 22, you should add the 
following line to the script:
iptables -A INPUT -p tcp --syn --dport 22 -j ACCEPT

But i highy recommend bindind the ssh server to a higher port.


regards,
Georgi Alexandrov

