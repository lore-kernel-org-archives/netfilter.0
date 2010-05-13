From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 20:45:36 +0200
Message-ID: <hshhcg$rl3$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> 	<hshf0k$ine$1@dough.gmane.org> <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Curby schrieb:
> On Thu, May 13, 2010 at 12:05 PM, Markus Feldmann
> <feldmann_markus@gmx.de> wrote:
>> What are CTs?
> 
> Mebbe Conntrack?  The basic point that Jan's trying to make is that
> NEW/ESTABLISHED/INVALID/RELATED describes packets as they're seen by
> the connection tracking.  It is not necessarily related to whether a
> TCP packet has the SYN flag set.
> 
> If a new and valid ICMP ping packet comes in, it's considered NEW by
> conntrack because it's not associated with any other traffic, not is
> it INVALID.  That's an example of NEW packets that don't have to be
> TCP SYN.
I try an example and you say whether i am right.

If i meet a girl, which i doesnt meet before, than she is NEW.
When i meet a girl every day which, than she is only new at the first 
meet but the meeting is every day a new experience (syn).

Is that correct?

So the state NEW is the sight view of my computer and the syn only 
means, there is a foreign computer which wants to establish a new 
connection.

Ist that right?

If that is right than i need the --syn argument not the state NEW for my 
apache-server.

regards Markus

