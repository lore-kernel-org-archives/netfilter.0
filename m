From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT in mangle
Date: Fri, 3 Dec 2004 10:45:15 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0412031044170.29577@yvahk01.tjqt.qr>
References: <OFC9635424.8C60BA44-ONC1256F5F.0034050C-C1256F5F.0034402B@promon.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFC9635424.8C60BA44-ONC1256F5F.0034050C-C1256F5F.0034402B@promon.cz>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: netfilter@lists.netfilter.org

>Are you sure you have that allowed in kernel?
>
>taken from linux-2.4.27 Documentation/Configure.help
>
>Local NAT support
>CONFIG_IP_NF_NAT_LOCAL

Right, looks like it could be of use. I could never imagine what NAT_LOCAL
would be good for. Now, apprently, I do.
Thanks.



Jan Engelhardt
-- 
ENOSPC

