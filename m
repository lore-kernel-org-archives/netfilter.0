From: "Rio Martin." <rio@martin.mu>
Subject: Re: CONNLIMIT
Date: Thu, 7 Apr 2005 09:29:40 +0000
Message-ID: <200504070929.40549.rio@martin.mu>
References: <001301c53aea$3884c230$7100000a@wim2000>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001301c53aea$3884c230$7100000a@wim2000>
Content-Disposition: inline
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

Try using -j DROP instead of -j REJECT
And the last rule seemed to ACCEPT all of those rules you ve applied before.
Remove it.

Regards,
Rio Martin.
---------------------------------------------------------
Network & System Engineer
Network Operation Center
INSTITUT TEKNOLOGI NASIONAL 
Email: rio@martin.mu
Website: http://www.itenas.ac.id
---------------------------------------------------------

On Wednesday 06 April 2005 20:50, Luiz C. Spies wrote:
> Hi to all, i try many time limit my port 25 to 2 connection, but i have no
> achieve success yet!!!
>
> I tried this rulez!
> iptables -A INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above
> 2 --connlimit-mask 32 -j REJECT --reject-with tcp-reset
> iptables -A INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above
> 2 -j REJECT
> iptables -p tcp --syn --dport 25 -m connlimit --connlimit-above 2 -j REJECT
> iptables -p tcp --syn --dport 25 -m connlimit ! --connlimit-above 2 -j
> ACCEPT
>
> Anyone has idea!!!???
>
>
> Greeting's to all!
>
> PS: Sorry about my english!
>
>
> Luiz C. Spies

