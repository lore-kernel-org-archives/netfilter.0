From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: [mangle table] end rule
Date: Mon, 14 Jan 2013 22:51:41 +0100
Message-ID: <20130114225141.9ffa1e68a5307837a6c779e7@lucassen.org>
References: <20130114214225.4a10201014b466ebf87eba94@lucassen.org>
	<50F4717A.9010608@airpost.net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50F4717A.9010608@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 14 Jan 2013 21:58:34 +0100
Born Without <blackhole@airpost.net> wrote:

> > Question: is a mangle rule really an end rule as the site suggests?
> > Or is this not true ("man iptables" says nothing about it AFAICS).
> > Or is it true and do I have to report a bug?
> 
> That depends if the target is a "non-terminating target" or not.
> i.e
> MARK, CONNMARK, LOG  are non-terminating.
> ACCEPT, DROP, RETURN are.

Ok, this is unfortunately not mentioned in "man iptables", only for LOG
and ULOG and not for CONNMARK and MARK. But anyway, the conclusion may
be: what the website says is wrong.

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
