From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Help with ftp helper please
Date: Sun, 25 Apr 2010 12:04:41 +0200
Message-ID: <4BD413B9.90900@chello.at>
References: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com> <4BD3E5F3.4070907@chello.at> <alpine.LSU.2.01.1004251108170.5896@obet.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004251108170.5896@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jeff Jensen <jjensen@unyalli.com>

On 25.04.2010 11:09, Jan Engelhardt wrote:
> On Sunday 2010-04-25 08:49, Mart Frauenlob wrote:
> 
>> On 24.04.2010 18:48, Jeff Jensen wrote:

>>>    I have an email conversation from Jan 9, 2010 between
>>> mart.frauenlob@chello.at and margoandtodd@gmail.com with the subject
>>> "passive mode ftp high ports driving me nuts". I have studied this
>>> intensely and found out about this "helper" thing.

>> you don't allow sport 21 back incoming traffic.
>> btw: nf_nat_ftp is also loaded?
> 
> That's why one should always have -m conntrack --ctstate ESTABLISHED(,RELATED)
> in INPUT, FORWARD, and OUTPUT. It really trims down all these rules.
> 

Yes, if the OP would have looked up the original post correctly it would
show exactly that.
http://eeek.borgchat.net/lists/netfilter/msg47205.html
Putting the global RELATED rule, of course makes most of the rules
obsolete (which fits in most cases), but that example was to show how to
use the (ftp) helper match, if one chooses to split things up for
whatever reason.

Good day

Mart
