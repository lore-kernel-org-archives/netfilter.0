From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple PPTP clients behind iptables.
Date: Sun, 25 Apr 2004 14:20:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404251420.33408.Antony@Soft-Solutions.co.uk>
References: <GHEILNONPACCGBGKBEKKOEGNCFAA.mani@manikandan.org>
Reply-To: "Netfilter list" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKOEGNCFAA.mani@manikandan.org>
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
To: Netfilter list <netfilter@lists.netfilter.org>

On Sunday 25 April 2004 2:11 pm, Manikandan wrote:

> Somehow I managed to patch my kernel with pptp patch. But everytime when I
> load modules like ip_conntrack_pptp, ip_nat_pptp, I am getting an error
> like "ip_conntrack_pptp.c: bad csum" in the log file.
>
> Also the pptp connections are not stable. The pptp sessions are getting
> disconnected very often say every 2 mins.

Sounds like you need to do something about that word "somehow".

Make sure you have applied (the right version of) the patch correctly, 
recompiled both the kernel and iptables afterwards, without errors, and try 
connections again after that.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


