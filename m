From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Dynamic DNS
Date: Wed, 09 Mar 2005 15:41:52 -0500
Message-ID: <422F5F90.6080005@SCampbell.net>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050309062542.GA27660@gw.home.tux-labor.de>
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

Sebastian Docktor wrote:

>Hi,
>
>I want to allow a Dynamic DNS Client to Access the SSH-Server 
>on my Firewall. But I don't want to open SSH for all IPs,
>Is it possible that iptables always looks up the ip address from the 
>hostname, so that only the ip has access which is registrated under
>the dyndns?
>
>  
>

IMO, it's a very bad idea to lower the security of iptables firewall by 
making it dependent on DNS for any portion of authorization 
certification.  DNS isn't exactly known for it's stellar security :)   
Allow me to suggest an alternate path.  Use RSA keyfiles and disallow 
ssh password authentication, this way you can leave the port open but 
user's without public keys installed on the server cannot gain access.  
Generally speaking DNS should have nothing to do with anyone's firewall 
because DNS would then become the weak link in the security chain and 
SSH has methods that are better applied to these needs.






