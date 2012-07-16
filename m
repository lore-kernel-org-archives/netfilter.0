From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: recent question
Date: Mon, 16 Jul 2012 16:15:19 +0200
Message-ID: <20120716161519.96348ce40ffc294dd344366f@lucassen.org>
References: <20120716151223.e5eb4406717f6e0186d7ca7f@lucassen.org>
	<50041659.6090601@evcz.tk>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50041659.6090601@evcz.tk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, 16 Jul 2012 15:25:45 +0200
Marco Padovan <evcz@evcz.tk> wrote:

> on centos
> 
> rmmod xt_recent
> modprobe xt_recent ip_list_tot=5000
> 
> will increase it to 5000 ;)
> 
> (to run rmmod you need to remove the rules using recent before
> proceeding)

Of course, that's in the manpage and in modinfo. But I just wonder what
will happen if you don't increase the modules parameter. I fear Jan
Engelhardt is on holiday ;-)

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
