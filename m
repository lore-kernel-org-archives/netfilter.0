From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 14:19:50 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031023211950.82822.qmail@web40208.mail.yahoo.com>
References: <20031023204752.GB15311@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031023204752.GB15311@cannon.eng.us.uu.net>
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
Content-Transfer-Encoding: 7bit
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, nf <netfilter@lists.netfilter.org>
Cc: Daniel Chemko <dchemko@smgtec.com>, Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, nf <netfilter@lists.netfilter.org>


--- Ramin Dousti <ramin@cannon.eng.us.uu.net> wrote:
> Look. tos can be set in mangle. mangle has five hooks including OUTPUT and
> PREROUTING. OUTPUT affects the locally generated traffic. PREROUTING affects
> the externally generated traffic that passes through your firewall. 

Thanks alot Ramin,

I had read Oskar's tutorial before I started posting this thread. Sometimes
when I read things I like to verify my understanding with others to make sure I
did not get it wrong. I do this a lot by asking vuager questions than I
probably should to get to the "meat and portatoes" of what I read.

Again I owe all you guys a big thanks! 



=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

