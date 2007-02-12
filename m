From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filternig/logging by the exe name ?
Date: Mon, 12 Feb 2007 18:39:38 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702121839120.26360@yvahk01.tjqt.qr>
References: <f36b08ee0702100750y1b5f21b5i1d7646c829d28b5e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f36b08ee0702100750y1b5f21b5i1d7646c829d28b5e@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yakov Lerner <iler.ml@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Feb 10 2007 17:50, Yakov Lerner wrote:
>
> Which filter allows me to filter/log by the name of the executable ?
> Can I log the name of the executable [that was the sender or
> receiver of the packet/connection], using such module ?
> (talking about outgoing connection, in this case)

Consider the case where there is no process executable attached to a 
socket.


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

