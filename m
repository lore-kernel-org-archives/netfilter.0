From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Unicast packets to multiple destinations  -only-
Date: Thu, 18 Nov 2004 11:22:56 -0500 (EST)
Message-ID: <31550.142.169.215.10.1100794976.squirrel@142.169.215.10>
References: <419C6FF3.9070908@lucomp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419C6FF3.9070908@lucomp.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Luigi Corsello <mlreader@lucomp.net>
Cc: netfilter@lists.netfilter.org

On Thu, November 18, 2004 4:48 am, Luigi Corsello said:

> You can't have multiple -d in rules. My quick solution was 3 tables

Try `iptables -m iprange -h'


> Cheers,
> /lc
>
>

Regards,

Samuel
CookingLinux TM


