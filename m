From: Rick Mann <rmann@latencyzero.com>
Subject: Guaranteeing bandwidth through netfilter-based router?
Date: Thu, 6 Jan 2005 12:39:34 -0800
Message-ID: <132A17DB-6023-11D9-BC93-000A95CFE5AA@latencyzero.com>
Mime-Version: 1.0 (Apple Message framework v619)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi. I have a netfilter-based router set up on Fedora Core 2 that's 
working very well. However, one of the things I run behind it is a VoIP 
box, and sometimes voice quality suffers if other hosts are consuming 
bandwidth.

Is there a way to give priority to UDP traffic to/from a particular 
host, without permanently reserving bandwidth for it?

TIA,

-- 
Rick


