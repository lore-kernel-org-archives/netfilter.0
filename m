From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: libipq
Date: Thu, 8 Apr 2004 09:48:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404080948.09198.Antony@Soft-Solutions.co.uk>
References: <9723.1081409292@zworg.com> <40750E2D.2E4DA20@india.hp.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40750E2D.2E4DA20@india.hp.com>
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
To: netfilter@lists.netfilter.org

On Thursday 08 April 2004 9:32 am, Devaraj Das wrote:

> Hi all,
> If I have an application (using libipq) that's waiting for packets, and I
> want to inspect the payload, will the payload be encrypted in case I use
> esp/transport with kernel 2.6 (with built-in ipsec)?

This depends on which packets you inspect the payload of.

If you inspect the ESP packets, then yes, they will be encrypted under IPsec.

If you inpect the HTTP/FTP/SMTP/whatever packets which come out of the tunnel 
on the other side, then no, they will not be encrypted (unless, of course, 
you send ssh or https through your IPsec tunnel).

PS: Please don't quote an irrelevant previous posting, and please start a new 
thread for a new question.

Regards,

Antony.

-- 
I'm pink, therefore I'm Spam.

                                                     Please reply to the list;
                                                           please don't CC me.


