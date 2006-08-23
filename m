From: David Cary Hart <Fedora@TQMcube.com>
Subject: Save Problem on UML Host
Date: Wed, 23 Aug 2006 15:17:43 -0400
Message-ID: <20060823151743.11b52a24@dch.TQMcube.com>
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

Driving me nuts.

I keep getting the following error:
# iptables-save >/etc/sysconfig/iptables
Can't find library for match `tcp'

I have installed IPT from RPMs and from source.  I have tried a
static build. The host recompiled the kernel. No matter what I do,
the error persists. 

What I find really odd - if not frustrating - is that I can save from
webmin with no problems.

-- 
      Do NOT Send Email to <spam trap> Fedora@TQMcube,com
Our DNSRBL - Eliminate Spam at The Source: http://www.TQMcube.com
               Don't Subsidize Criminals: http://boulderpledge.org

