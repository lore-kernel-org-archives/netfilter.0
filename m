From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: more about martians
Date: Tue, 20 Apr 2004 18:18:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201818.16648.Antony@Soft-Solutions.co.uk>
References: <20040420170544.87914.qmail@web40702.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420170544.87914.qmail@web40702.mail.yahoo.com>
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

On Tuesday 20 April 2004 6:05 pm, udo wrote:

> Hello,
>
> As a follow up on my post about portforwarding to 127.0.0.1 and the 'martian
> destination 127.0.0.1' message I can tell I found the probable cause in
> /usr/src/linux/net/ipv4/route.c.
> A patch here could filter out the martian messages if a packet is related to
> sshd (in my case).
>
> Does anyone know if such a patch/solution exist already?
> Maybe there's a better way?

I think so, yes - connect to a real IP address, not the loopback address, when 
you're connecting from another machine?

Regards,

Antony

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


