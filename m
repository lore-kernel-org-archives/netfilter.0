From: Andrey Tverdokhleb <at@tigry.net>
Subject: How to control DF in iptables
Date: Mon, 17 Nov 2003 15:38:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB95C06.7090606@tigry.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi all!

Is there way to enable fragmentation on per-interface or per-IP or 
per-Whatever basis?
I don't want to disable DF globally in ip_no_pmtu_disc, but I want some 
packets forwarded
without DF and fragmented if needed.

Thanks,
Andrey Tverdokhleb


