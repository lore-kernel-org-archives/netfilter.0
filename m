From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: how to check ip_conntrack number?
Date: Wed, 19 Mar 2003 13:50:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030319135018.182e8dbe.arnt@c2i.net>
References: <F190QR7j1HaKtKufVma00000070@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F190QR7j1HaKtKufVma00000070@hotmail.com>
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

On Wed, 19 Mar 2003 10:42:47 +0000, 
"SB CH" <chulmin2@hotmail.com> wrote in message 
<F190QR7j1HaKtKufVma00000070@hotmail.com>:

> Hello.
> 
> I would like to check "ip_conntrack" number.
> But when I check like this the load is so high and the system
> would be freezed.
> 
> # cat /proc/net/ip_conntrack |wc -l
> 
> Is there another method to check current conntrack number?
> 
> and what is the maximum number of the "net.ipv4.ip_conntrack_max"?
> 
> 
> Thanks in advance.
>  
> 

..http://ipsysctl-tutorial.frozentux.net/chunkyhtml/
& http://iptables-tutorial.frozentux.net/chunkyhtml/

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



