From: narendra prabhu <naren@deeproot.co.in>
Subject: Re: block mirc, messenger
Date: Thu, 19 Jun 2003 15:09:55 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EF184EB.4030101@deeproot.co.in>
References: <062e01c33643$69dee570$0300a8c0@medannic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <062e01c33643$69dee570$0300a8c0@medannic>
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
To: netfilter@lists.netfilter.org

HTB wrote:

> Hello ,
>  
> I already install RH. 8, with 2 interface (eth0 10.10.10.8), (eth1 
> 192.168.1.1), i want blocking mirc, messeger. I type this command
>  
> /sbin/iptables -I INPUT -i eth0 -p tcp -s 10.10.10.8/32 --dport 6667 
> -j DROP

Few things that you may interested to know

    Not all IRC server use listen at port number 6667
    Are you using a proxy?

My suggestion to you that is that instead going in this way, identifing 
the services you dont want to allow, identifing the services that you 
want to allow and disallow the rest of them.

Hope this helps.

//Narendra.


