From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: monitor masq. packets
Date: Sat, 07 Dec 2002 13:06:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF1E43F.8040008@karlsbakk.net>
References: <001a01c29d6e$2dedd580$7900a8c0@ibmfhyhjarw99d>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: zmooth <zmooth@btinternet.com>
Cc: netfilter@lists.netfilter.org

zmooth wrote:

>Hi, ive noticed that : netstat -M does not work anymore. Is it just me ? i
>get :
>
>    netstat: no support for 'ip_masquerade' on this system, while iptables
>is loaded and masquerading already. Please help
>
>
>  
>
it's not only you

[root@fw root]# netstat -M
netstat: no support for `ip_masquerade' on this system.

and I'm using the MASQUERADE target, yes

roy




