From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: Iptables LOG
Date: Thu, 25 Dec 2003 13:00:21 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312251300000.12179-100000@cic-mail.lanl.gov>
References: <200312251225.12203.mrakotom@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312251225.12203.mrakotom@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rakotomandimby Mihamina <mrakotom@free.fr>
Cc: netfilter@lists.netfilter.org

On Thu, 25 Dec 2003, Rakotomandimby Mihamina wrote:

>Hi every one :-)
>
>I'm using :
>kernel 2.4.23 
>iptables 1.2.8

Does it work if you set it to another level? IE say set it to emerg or
info? If it doesnt then I would say the kernel isnt doing what it is
supposed to do or klogd isnt running.

                                                                                                                                                         

-- 
Stephen John Smoogen            smoogen@lanl.gov
Los Alamos National Labrador  CCN-5 Sched 5/40  PH: 5-8058
Ta-03 SM-261  MailStop P208 DP 17U  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


