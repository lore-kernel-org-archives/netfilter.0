From: Alexis <alexis@attla.net.ar>
Subject: Re: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 13:47:47 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032480310.20040221134747@attla.net.ar>
References: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
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
To: Andreas Meyer <anmeyer@gmx.net>
Cc: netfilter@lists.netfilter.org

That 192.168.20.60 is trying to connect to 209.225.0.6 is obviuos, by
the lenght and the syn looks like a get.

Have you checked if that box (168.20.60) has any virus or anything
like this??



Hello Andreas,

Saturday, February 21, 2004, 8:25:47 AM, you wrote:

AM> Hello!

AM> Just wrote a little iptables-script not allowing connections
AM> to port 80.
AM> Now in the log I see this:

AM> Feb 21 11:53:41 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
AM>  DST=209.225.0.6 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160 PROTO=TCP \
AM>  SPT=41197 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

AM> It seems that with every request to a website there is also a request to
AM> IP 209.225.0.6 wich leads to exodus.net.

AM> I am completely worried about this. Who can tell me what is going on?


AM> Regards


-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar


