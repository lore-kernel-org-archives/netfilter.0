From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging -- a newbie question
Date: Fri, 7 May 2004 14:45:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405071445.38711.Antony@Soft-Solutions.co.uk>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de>
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

On Friday 07 May 2004 2:34 pm, Pawel Mueller wrote:

> Hi folks,
>
> I'm a newbie to netfilter and have a short question:
> Where can I see which packages has been DROPPED and which not?

Netfilter LOGs what you tell it to; it doesn't log anything automatically.

Simply add a rule with the LOG target for the packets you're interested in.

See "man netfilter" for more details.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


