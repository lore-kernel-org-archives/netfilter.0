From: Matthias Hopf <Matthias.Hopf@informatik.uni-stuttgart.de>
Subject: Re: QoS traffic shaping behaves strangely with addressed based filtering
Date: Mon, 19 Jul 2004 17:14:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040719151418.GA12068@vismail.informatik.uni-stuttgart.de>
References: <20040719144759.GA11352@vismail.informatik.uni-stuttgart.de> <3063e504071907582d03bf3f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3063e504071907582d03bf3f@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Jul 19, 04 16:58:56 +0200, George Alexandru Dragoi wrote:
> I had same problem with that kernel, I'm not sure if it is QoS or
> realtek driver fault, i think i had this problem before applying QoS

Oh, yes, I *have* a realtek card...
Never thought about hardware driver issues.
It might be that I have problems without QoS, but it is definitvely much
worse with traffic shapeing (never noticed before).

> on the realtek iface. On that machine there was an realtek and
> pcnet32, and i could stay connected throught ssh via pcnet32, but not
> realtek. Somebody found a quickfix (till I switched to 2.6.7) and made
> the machine ping hisself all the time so his connections never freeze,
> unless he stoped the ping.

Ok, then I'll try two things
a) ping myself on eth0
b) finally switch to 2.6

I'll check this out.

Thanks!

CU

Matthias

-- 
Matthias Hopf - Visualization and Interactive Systems Group    \  |  |  /--
                  University of Stuttgart,                      \ |  |   \
       Universitaetsstr. 38, 70569 Stuttgart, Germany            \|  |  --/
Phone +49-711-7816-404    Fax -340          mat@mshopf.de     www.mshopf.de

