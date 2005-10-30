From: "Insomniac" <insomniac@bloodbowlonline.com>
Subject: Same machine source IP modification
Date: Sun, 30 Oct 2005 16:33:36 +0800
Message-ID: <018c01c5dd2c$a2388600$6500a8c0@BM>
Reply-To: Insomniac <insomniac@bloodbowlonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

My situation is that I want to modify all incoming UDP traffic going to a
specific port so that the source IP appears to be from the local network. I
completely realise this creates a problem as far as monitoring traffic goes,
but that is unimportant at this point. Being on the same machine, I have
found I cannot use the nat table, so SNAT and MASQUERADE are not available
to me. Any suggestions on a fast and efficient way to pull this off?


