From: Thorsten Scherf <tscherf@web.de>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 16:05:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309051605.36015.tscherf@web.de>
References: <032001c373b2$5daabf70$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <032001c373b2$5daabf70$49caa8c0@caris.priv>
Content-Disposition: inline
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter@lists.netfilter.org

>Hi.  I was wondering if someone could tell me what a good way is to set up
>DNAT and SNAT on a firewall if the external IP is not static ....

Do not use SNAT, use Maquerading. You don't have to know your external IP 
here:

iptables -t nat -A POSTROUTING -s $INT_NET -o $EXT_DEV -j MASQ

DNAT is also very simple, don't specify your external IP in DNAT Rule, just 
the Destination Port:

iptables -t nat -A PREROUTING -p tcp --dport 25 -i $EXT_DEV -j DNAT 
--to-destination $SMTP_SERVER


Greetings,

Thorsten Scherf,
RHCE, RHCX




