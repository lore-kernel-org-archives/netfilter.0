From: Hideaki Nemoto <eme@bg8.so-net.ne.jp>
Subject: Re: can't delete with iptables
Date: Tue, 17 Feb 2004 00:35:26 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402161533.i1GFXPJ10058@mail.bg8.so-net.ne.jp>
References: <200402070721.i177LxJ09969@mail.bg8.so-net.ne.jp>
	<20040215155955.GQ15567@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040215155955.GQ15567@sunbeam.de.gnumonks.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org

Hi Harald,

I've noticed that.
And I've also found the reason, but I guess it be better not to
post that here.
Thanks anyway.

Harald Welteさんの<20040215155955.GQ15567@sunbeam.de.gnumonks.org>から
>On Sat, Feb 07, 2004 at 04:23:07PM +0900, Hideaki Nemoto wrote:
>> Hi,
>> 
>> I can't delete the rule by iptables, that I inserted
>> with my program using libiptc.
>> 
>> I've managed to insert, replace, and delete the rulesfrom my program.
>> But I can't delete that rule by iptables, or the ip6tables.
>
>Please note that libiptc is not meant as a public API for 3rd party
>applications.  We do not encourage people to do so, and it is not
>supported at all.
>
>-- 
>- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
>============================================================================
>  "Fragmentation is like classful addressing -- an interesting early
>   architectural error that shows how much experimentation was going
>   on while IP was being designed."                    -- Paul Vixie

-- 
Hideaki mailto:eme@bg8.so-net.ne.jp

