From: Tomasz Wrona <tw@eter.tym.pl>
Subject: Re: Fwd: IPTables stops logging after long uptime
Date: Tue, 11 Feb 2003 00:20:58 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.30.0302110014290.25887-100000@king.klan.gda.pl>
References: <200302092247.20930.fabrice@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302092247.20930.fabrice@netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabrice MARIE <fabrice@netfilter.org>
Cc: netfilter@lists.netfilter.org

On Sun, 9 Feb 2003, Fabrice MARIE wrote:

> Anybody had this problem ?
>
> [I don't have this problem since my
> uptime is never that long..]


I have the same behaviour...
I looked at logs after I read this mail. Uptime of my system is 84 days
and I do not see any syslog firewall entries in my oldest rotated logs...
so it happened a lot time ago.. [Also I have simmilar problem with crontab
which pauses logging after few days..]

2.4.19-grsec; iptables v1.2.7a


Regards
tw
-- 

----------------
 ck.eter.tym.pl

"Never let shooling disturb Your education"


