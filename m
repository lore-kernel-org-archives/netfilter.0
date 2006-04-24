From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: Adaptive stealthing/unstealthing of port 113
Date: Mon, 24 Apr 2006 02:54:18 +0200
Message-ID: <444C21BA.90800@gmx.net>
References: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
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
To: Asfand Yar Qazi <ayqazi@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

Asfand Yar Qazi schrieb:
> 
> "Adaptive Stealthing" means that when a TCP SYN packet arrives to
> request a connection to your machine's port 113, ZoneAlarm checks, on
> the fly, to see whether your machine currently has any sort of
> "relationship" with the remote machine (such as a pending outgoing
> connection attempt).
> 
> I wanna do it on my ADSL firewall!

Why? Just don't drop connects to port 113 but reject them with RST
instead. "Adaptive stealthing" is just crap. If your machine is active
on the net, it can be detected (there are exceptions, but they do NOT
apply to ADSL connections and for sophisticated attackers these
exceptions almost always don't apply). If your machine is switched
off, you do not care.
So "adaptive stealthing" gives you two chances in bullshit bingo, but
not anything useful.

Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

