From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Setting a default policy does not work :(
Date: Tue, 02 Dec 2003 10:53:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070380411.2057.21.camel@grendel>
References: <20031202083315.212b9e05.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202083315.212b9e05.mgale@utilitran.com>
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
To: Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-12-02 at 10:33, Michael Gale wrote:
>
> Inserting the following to the bottom of my firewall script:
> 
> ### Causes all traffic to or from the box on either interface to be dropped regardless of all other rules.
> 
> iptables --policy INPUT DROP
> iptables --policy OUTPUT DROP
> iptables --policy FORWARD DROP

Try:
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

Works for me on multiple firewalls using multiple interfaces.

> ### But when adding:
> 
> iptables -A INPUT -i $EXT_FACE -j DROP
> iptables -A INPUT -i $INT_FACE -j DROP
> iptables -A OUTPUT -o $EXT_FACE -j DROP
> iptables -A OUTPUT -o $INT_FACE -j DROP
> iptables -A FORWARD -i $EXT_FACE -j DROP
> iptables -A FORWARD -i $INT_FACE -j DROP
> 
> The firewall rules behave as they should only allow traffic that matches the rules and the default policy now is DROP based on the rules.

Actually, this does not change the policy but would rather make the last
rule in each chain a drop rule. If you moved these commands to the
beginning of your script you would have the same problem as above. Using
-P should fix your problem.

HTH,
C



