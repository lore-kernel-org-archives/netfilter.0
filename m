From: lucas <lucas@webone.com.au>
Subject: iptables logs going to all ttys
Date: Tue, 14 Oct 2003 08:58:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8B2E19.7090601@webone.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: iptables mailing list <netfilter@lists.netfilter.org>

Morning all,

I have the following in my firewall script, and to my knowledge this is 
meant to stop all logs from going to all ttys but this is not the case 
and its a real *pain* in the ass.

$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG --log-level info
$IPTABLES -A drop-and-log-it -j DROP

If someone could give me a hint as to what i have overlooked that would 
be much appreciated, thanks

General Details:
   iptables v1.2.8
   syslogd 1.4.1
   LFS 4.1

-- 
lucas                                    $(lucas@webone.com.au)

"Experience is something you don't get until just after you need it."





