From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: General denial question (tarpitting)
Date: Thu, 25 Mar 2004 20:40:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4063B458.4030501@smgtec.com>
References: <Pine.LNX.4.44.0403251546510.29753-100000@e-smith.charlieb.ott.istop.com> <40634D80.9050609@pay2send.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40634D80.9050609@pay2send.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Nicol <davidnicol@pay2send.com>
Cc: Charlie Brady <charlieb-qpsmtpd@budge.apana.org.au>, qpsmtpd ML <qpsmtpd@perl.org>, netfilter@lists.netfilter.org

Check out the Patch-o-matic enhancements to netfilter.
TARPIT? Check.

David Nicol wrote:

>
>
> Charlie Braddy wrote, on the qpsmtpd list, which is about
> a perl drop-in replacement for qmail-smtpd:
>
>> If you are going to undertake the noble task of sucking up their 
>> bandwidth, then I'd suggest that you do the job thoroughly, and make 
>> sure that their TCP stack decides to retransmit as many packets as 
>> possible. Use iptables (for instance) to selectively/randomly drop 
>> packets.
>
>
> That's brilliant!  does iptables have a TARPIT target that causes
> the peer to retransmit as much as possible? Can we add one?
>
> CC to netfilter@lists.netfilter.org, the iptables discussion list.
>

