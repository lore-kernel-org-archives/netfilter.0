From: "=?iso-8859-1?Q?Geffrey_Vel=E1squez?=" <g_netfilter@netfids.com>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 14:11:14 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9659.200.48.142.50.1070997074.squirrel@www.netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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


Hi,

> Hello,
>
> 	First make sure you are using tcpsyn_cookies:
>
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compiled


Is that valid for forwarded packets? or only destinated to the firewall?



Regards,
Geffrey.




