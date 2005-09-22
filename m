From: colorchip@sify.com
Subject: raw packet capture based on offset
Date: Thu, 22 Sep 2005 09:29:07 +0600 (IST)
Message-ID: <1127361547.43322c0b7a8da@mail.sify.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

I want to capture raw packets based on the ethernet source (mac) and a 16 bit identifier following the ethtype. I am unable to find a generic filter which gives me a freedom to filter the packet based on any bit length and offset from the beginning of the packet. Can anyone help?

-nks
