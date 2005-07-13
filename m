From: /dev/rob0 <rob0@gmx.co.uk>
Subject: OUTPUT filtering (was: Re: Ip_conntrack_ftp ...)
Date: Wed, 13 Jul 2005 09:45:50 -0500
Message-ID: <42D5291E.7090308@gmx.co.uk>
References: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>	<42D4E11C.2080100@mnemon.de>
	<Pine.LNX.4.61.0507131212090.14635@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507131212090.14635@yvahk01.tjqt.qr>
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

Jan Engelhardt wrote:
>>Hmm, many people, including myself, think, that filtering in OUTPUT is
>>pointless. More troublesome than usefull. If you decide to set OUTPUT
>>policy to ACCEPT, you don't need the first two rules. Up to you.
> 
> Not at all. Because certains things can not happen in certain environments, 
> e.g. I read/write mail by logging into a mail server via SSH / no sendmail 
> running, I can exclude certain things. In netfilter parlance:
> 
>  -P OUTPUT ACCEPT (same for FORWARD, btw)
>  -A OUTPUT -j REJECT -p tcp --dport 25
> 
> This stops users that also have access to my machine to not spam smtp servers, 
> should they find an open one.

(Be sure you also restrict access to any sendmail(1)-style mail 
injection binary in that case, if there's an MTA running.)

True, you have illustrated one example of sane OUTPUT filtering. The 
OP's use of OUTPUT filtering was not in this category.

Note that OUTPUT filtering only controls non-root users. A root user can 
disable or bypass it. If you have local shell users who cannot be 
trusted, and if you didn't already understand all this, chances are 
those users already have rooted you. :)

I agree with Joerg above. I don't think you have contradicted his 
general point. Netfilters should:
   1. Learn to walk before they try to run
      Rule of thumb: if you need to post here to try to get explanations
      of what your rules are doing, you're not ready for OUTPUT filters.
   2. Only experiment with carefully-crafted OUTPUT rules
   3. Generally not attempt "iptables -P OUTPUT DROP" (see #1.)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

