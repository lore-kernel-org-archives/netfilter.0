From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Chains policy and rules
Date: Mon, 28 Jul 2003 23:31:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030728233159.4ff89f5d.arnt@c2i.net>
References: <87969271865366.03228@send3.inner-21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87969271865366.03228@send3.inner-21cn.com>
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
To: LiMeiYong <jobsli@21cn.com>
Cc: netfilter@lists.netfilter.org

On Mon, 28 Jul 2003 13:47:25 +0800, 
"LiMeiYong" <jobsli@21cn.com> wrote in message 
<87969271865366.03228@send3.inner-21cn.com>:

> 
>  I use a PC with 3 NICs. 
>  Their configurations are:
>  eth0: 152.201.3.179 mask 255.255.0.0
>  eth1: 152.20.3.181 mask 255.255.0.0

..you route traffic for, uh...:
ipcalc -bnmp 152.201.3.179/16
NETMASK=255.255.0.0
PREFIX=16
BROADCAST=152.201.255.255
NETWORK=152.201.0.0

...around 130 thousand boxes on one pc???  Not at all bad!  ;-)

..or, are these netmasks too wide?  Searching 130 000 takes 
a _while_, even if everything else works ok.  Depending on 
your network layout, reconsider your sub net strategy, 
chances are _fat_ a few thousand subnets with an handful 
of hosts in each, will prove faster.  Good Luck.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


