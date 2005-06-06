From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: bad packets crash firewall.
Date: Mon, 06 Jun 2005 10:43:55 -0500
Message-ID: <42A46F3B.1080507@gmx.co.uk>
References: <42A4674C.30102@caris.com> <42A46D7E.4020805@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A46D7E.4020805@gmx.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

I wrote:
>> I am not sure if this is related to bad packets, a bad pptp patch, 
>> poor kernal .. I am at a loss.
> 
> [snip]
> 
> Check your logs, do debugging of the more likely suspect, pptpd.

Or, on further thought, the MPPE kernel patch you used is equally 
suspect. Are the Windows users using MPPE? How about the Linux one?

Please note, this is not an invitation to continue in an offtopic thread 
here, I am only trying to be complete in providing something which might 
be useful to you. I no longer support pptpd at my sites; we are moving 
them to openvpn.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

