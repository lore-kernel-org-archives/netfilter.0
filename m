From: "Shaun T. Erickson" <sterickson@gmail.com>
Subject: Iptables & ftp (no natting or forwarding)
Date: Mon, 16 Oct 2006 14:35:34 -0400
Message-ID: <92da24e00610161135v47ea20d3s45bcba52563239c5@mail.gmail.com>
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

I just installed an ftp server on a server, here at work, that's using
iptable as a host-based firewall.

I don't know if the ftp client will be able to do passive mode or not, yet.

How do I configure iptables to allow active or passive ftp
connections, while poking the least amount of holes in the firewall?

-- 
        -ste

