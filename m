From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Drop random 20% of packets on port?
Date: Fri, 9 Feb 2007 00:37:37 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702090036540.24888@yvahk01.tjqt.qr>
References: <20070208181407.78f630a8.mba2000@ioplex.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070208181407.78f630a8.mba2000@ioplex.com>
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
To: Michael B Allen <mba2000@ioplex.com>
Cc: netfilter@lists.netfilter.org


On Feb 8 2007 18:14, Michael B Allen wrote:
>
>I have several network protocol handlers that I would like to test. Can
>someone recommend a method to deliberatedly drop a certain percentage
>of packets destined for a particular port and in a random way using
>netfilter or something else?

-m statistic --mode random --probability 0.5 -j DROP



Jan
-- 

