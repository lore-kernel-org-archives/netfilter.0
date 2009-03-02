From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulog: losing packets
Date: Mon, 02 Mar 2009 10:46:53 +0100
Message-ID: <49ABAB0D.1030304@netfilter.org>
References: <547716004.20090227172654@awanti.com> <49AA5FF8.5010409@netfilter.org> <1687794505.20090302105758@awanti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1687794505.20090302105758@awanti.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Kolesnik <alexander.kolesnik@awanti.com>
Cc: netfilter@vger.kernel.org

Alexander Kolesnik wrote:
> Hello Pablo,
> 
> Thanks for the answer!
> 
>>> /etc/ulogd.conf:
>>> rmem=442368
> PNA>        ^^^^^^
> PNA> Rising this value will delay hitting ENOBUFS. This is the size of the
> PNA> receiver buffer.
> 
> 1. "delay" means I will get ENOBUFS in any case (early or later)?

Yes, but as said, you can tune different parameters to make it harder to
happen, like rising qthreshold, reducing cprange, setting a lower nice
value for ulogd.

> 2. What ENOBUFS does depend on? Packets per second? Bytes per second?
> Amount of iptables/shaping rules? CPU performance?

On the queue size, bytes/s sent to ulogd and on how slow ulogd is
reading messages.

> 3. Is there any way to calculate or predict the high limit of
> traffic rate/number of rules/etc when the system will still manage to
> process ULOG without alerting with ENOBUFS?

I don't know any, at least yet.

> 4. ipcad buffers (I suppose this is the same as rmem for ulogd) is set
> to 4M:
> /etc/ipcad.conf:
> buffers = 4194304;
> But I'm still losing ULOG messages. Does that mean I have to rise this
> value more?

Rising the value to the infinite is not either a solution, you'll hit
ENOBUFS sooner or later.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
