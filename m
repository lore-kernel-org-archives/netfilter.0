From: "Andrius Cibulskis" <can@centras.lt>
Subject: RE: netfilter digest, Vol 1 #811 - 7 msgs
Date: Sun, 4 May 2003 11:26:44 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c31216$e8e9e910$0201040a@can>
References: <20030502222622.31281.6575.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030502222622.31281.6575.Mailman@kashyyyk>
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

Hello,

I apply route patch and after that I cannot compile iptables. Could
anybody tell me what is wrong?

Thank you.



cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_ROUTE_sh.o -c
extensions/libipt_ROUTE.c
extensions/libipt_ROUTE.c: In function `init':
extensions/libipt_ROUTE.c:44: structure has no member named `oif'
extensions/libipt_ROUTE.c:45: structure has no member named `iif'
extensions/libipt_ROUTE.c:46: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `parse':
extensions/libipt_ROUTE.c:73: structure has no member named `oif'
extensions/libipt_ROUTE.c:76: structure has no member named `oif'
extensions/libipt_ROUTE.c:78: structure has no member named `oif'
extensions/libipt_ROUTE.c:78: structure has no member named `oif'
extensions/libipt_ROUTE.c:78: structure has no member named `oif'
extensions/libipt_ROUTE.c:91: structure has no member named `iif'
extensions/libipt_ROUTE.c:94: structure has no member named `iif'
extensions/libipt_ROUTE.c:96: structure has no member named `iif'
extensions/libipt_ROUTE.c:96: structure has no member named `iif'
extensions/libipt_ROUTE.c:96: structure has no member named `iif'
extensions/libipt_ROUTE.c:105: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:142: structure has no member named `oif'
extensions/libipt_ROUTE.c:143: structure has no member named `oif'
extensions/libipt_ROUTE.c:145: structure has no member named `iif'
extensions/libipt_ROUTE.c:146: structure has no member named `iif'
extensions/libipt_ROUTE.c:148: structure has no member named `gw'
extensions/libipt_ROUTE.c:149: structure has no member named `gw'
extensions/libipt_ROUTE.c: In function `save':
extensions/libipt_ROUTE.c:161: structure has no member named `oif'
extensions/libipt_ROUTE.c:162: structure has no member named `oif'
extensions/libipt_ROUTE.c:164: structure has no member named `iif'
extensions/libipt_ROUTE.c:165: structure has no member named `iif'
extensions/libipt_ROUTE.c:167: structure has no member named `gw'
extensions/libipt_ROUTE.c:168: structure has no member named `gw'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1




