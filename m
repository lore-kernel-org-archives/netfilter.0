From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Filtered Port
Date: Tue, 31 Jan 2006 08:28:03 -0600
Message-ID: <200601310828.03996.rob0@gmx.co.uk>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
	<61929.193.173.147.3.1138716397.squirrel@webmail.sterenborg.info>
	<43DF7196.6070606@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF7196.6070606@mail.bloomfield.k12.mo.us>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 2006-January-31 08:17, Scott Mayo wrote:
> I still have no idea why port 3389 is shown as being filtered.  I
> have no rules in my iptables that explicitly filter it.

This is normal for a forwarded port which cannot get replies back to  
the originator. Closed means you get an icmp-port-unreachable reply 
back. Open means the SYN/ACK connection negotiation succeeds (although 
with a stealth scan you do not complete the negotiation.) Filtered 
means ... anything else. You don't get anything back.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

