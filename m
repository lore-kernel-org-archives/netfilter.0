From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: remove duplicate rules
Date: Mon, 28 Nov 2005 17:50:30 -0600
Message-ID: <200511281750.30511.rob0@gmx.co.uk>
References: <FAC4E024BF776842876169173CE2F01313B14A@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B14A@mailbox.vikus.com>
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

On Monday 2005-November-28 11:15, Derick Anderson wrote:
> >     I think you should manually check the existence of possible
> >     duplicate before adding rule. Also you can do somethig like:
> >
> >     iptables -D INPUT -d 192.168.0.2/32 -i eth1 -j DROP
> >     iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
> >
> >     Then you will never get duplicates.
> >     But the first way is more correct.

> Just don't use that method remotely.

Sure, just do them as a single command separated by ";".
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

