From: "Rajkumar S" <rajkumars@gmail.com>
Subject: Re: Determine the netfilter load
Date: Tue, 9 Jan 2007 10:52:44 +0530
Message-ID: <64de5c8b0701082122t2fcd4d9bh6850a20769faf901@mail.gmail.com>
References: <64de5c8b0701072336q6ff16d57ra2ba56cde9cbf0dd@mail.gmail.com>
	<Pine.LNX.4.61.0701082125430.23737@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701082125430.23737@yvahk01.tjqt.qr>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 1/9/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> On Jan 8 2007 13:06, Rajkumar S wrote:
> > importantly how do I know if this packet rate is hitting or about to
> > hit any limits? How much more pps will my system take?
>
> If any packets you feed in don't come out again (two network cards - a
> forwarding setup)

Exactly the scenario I want to avoid :)

My setup is a bridge firewall, so two interfaces in a bridge, no
userspace programs except an ssh. Correct me if I am wrong here. I
believe most of the work done by my system is processing the nic
interrupts and inside netfilter code. So if my system has to drop the
packet it would mean that the inturrupts are coming so fast that the
system cannot cope up with it. If I could determine how much time it
takes to service an interrupt or at lest get an indication as  to when
there are some "near miss" I can avoid packet loss.

regards,

raj

