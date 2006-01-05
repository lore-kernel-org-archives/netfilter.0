From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: processing non ip traffic
Date: Thu, 5 Jan 2006 11:53:42 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601051119390.21555@yvahk01.tjqt.qr>
References: <20060105015019.477.qmail@web52408.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060105015019.477.qmail@web52408.mail.yahoo.com>
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
To: Scott MacKay <scottmackay@yahoo.com>
Cc: netfilter@lists.netfilter.org

>Hiyas, 
>  Under the 2.6 kernel, can you process non-ip
>protocol traffic?  I am curious about this mainly in
>bridge mode and am not concerned about explicit rule
>declaration (so maybe it all all gathered under a
>catch-all rule).

Yes.
  ebtables -p 0x41
should select IPv6 traffic. This works with any protocol number/name.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/
| jengelh's site, http://jengelh.hopto.org/

