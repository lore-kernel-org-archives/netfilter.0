From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Invalid argument in -j SNAT
Date: Tue, 2 Dec 2003 21:18:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202201831.EAB3C1710@sterenborg.info>
References: <13211830200.20031202215027@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <13211830200.20031202215027@internetplustravel.ru>
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
To: 'Oleg Savostyanov' <savostyanov@internetplustravel.ru>, netfilter@lists.netfilter.org

> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
> XXX.XXX.XXX.XXX
> with an error "iptables: Invalid argument" I suspect, that an argument
> is XXX.XXX.XXX.XXX

Did you compile and load the module iptable_nat ?


Gr,
Rob


