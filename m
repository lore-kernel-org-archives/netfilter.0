From: Ashutosh <ashutosh@teneoris.com>
Subject: Re: FTP problems on ports other than 21
Date: Tue, 27 Jul 2004 12:45:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsbsbrkig2fsc0m@192.168.1.10>
References: <4915A8E67C498D42BAB5CB1351FD026E23CB60@3webad1.3WebMedia.int> <20040727045526.A427320AB@sterenborg.info> <20040727063311.GL2117@jgomez-p-latitude.asia.unity>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040727063311.GL2117@jgomez-p-latitude.asia.unity>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org


> If what you want is for conntrack to be able to track ftp data ports,
> but where the control channel is not on tcp/21, the modules support
> arguments upon loading.

Specify all the ports as Additional Module Parameters..

#ifdef MODULE_PARM
MODULE_PARM(ports, "1-" __MODULE_STRING(MAX_PORTS) "i");
#endif

At this moment, MAX_PORTS = 8, I guess.

This will ensure that ur connection tracking and NAT modules will be 
called for all those ports

-- 
Ashutosh Naik
Teneoris Networks India Pvt. Ltd.

