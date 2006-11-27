From: "alok pathak" <alokpathak79@gmail.com>
Subject: Iptables, squid
Date: Mon, 27 Nov 2006 14:18:52 +0530
Message-ID: <c31bf6690611270048w653eed56m375636d92e98c3ab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

The problem with me:
1. I want my users to access the internet(but bandwith must be limited
to each of them say 64kbps).
2. I configured delay pools in squid for this.
3. I also don't want to specify proxy settings on each users computer.
4. I also want to let my users use Yahoo WebCam, Bittorrent clients
etc, but without proxy settings.
5. I configured transparent proxy, but able to impose bandwidth limit
on http traffic only (port 80)
Can I use something other than squid?
Please help.
Thanks,
Alok Pathak

