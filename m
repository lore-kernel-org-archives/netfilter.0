From: "Gabor Csuri" <gcsuri@ceauto.com>
Subject: mark connections based a quote
Date: Thu, 14 Nov 2002 22:40:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLBOMOLDNJFMPIGKLGEAPCFAA.gcsuri@ceauto.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

 I need to restrict some connections into a bandwidth on my local network.
The long downloads (and uploads) are very bad for our 800k/128k bandwidth.
I thougth I would restrict the long downloads into a lower bandwidth, but I
don't know how can I mark the long downloads.
Can I mark the packets which are a part of a long connection maybe like
this:
iptables -m cquote --cquote 2000000 -j MARK --set-mark 1
means it marks packet within a connection which are over 2MB.

How can I do this?

Thanks in advice, Gabor Csuri.


