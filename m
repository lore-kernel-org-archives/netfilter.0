From: a.ledvinka@promon.cz
Subject: Re: DNAT in mangle
Date: Fri, 3 Dec 2004 10:30:42 +0100
Message-ID: <OFC9635424.8C60BA44-ONC1256F5F.0034050C-C1256F5F.0034402B@promon.cz>
References: <Pine.LNX.4.53.0412030938100.12707@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0412030938100.12707@yvahk01.tjqt.qr>
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
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Are you sure you have that allowed in kernel?

taken from linux-2.4.27 Documentation/Configure.help

Local NAT support
CONFIG_IP_NF_NAT_LOCAL
  This option enables support for NAT of locally originated connections.
  Enable this if you need to use destination NAT on connections
  originating from local processes on the nat box itself.

  Please note that you will need a recent version (>= 1.2.6a)
  of the iptables userspace program in order to use this feature.
  See <http://www.iptables.org/> for download instructions.

  If unsure, say 'N'.


