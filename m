From: "Nigel Clarke" <nigel@forever-networks.com>
Subject: RE: monitor masq. packets
Date: Sat, 7 Dec 2002 11:26:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEFKJOAPEBPJCGDAGMFIEMGCAAA.nigel@forever-networks.com>
References: <3DF1E43F.8040008@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF1E43F.8040008@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, zmooth <zmooth@btinternet.com>
Cc: netfilter@lists.netfilter.org

What kernel version are you using?

--
Nigel Clarke                 Forever Networks
Network Security Engineer    Consultant
*********www.forever-networks.com************

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Roy Sigurd
Karlsbakk
Sent: Saturday, December 07, 2002 4:06 AM
To: zmooth
Cc: netfilter@lists.netfilter.org
Subject: Re: monitor masq. packets


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





