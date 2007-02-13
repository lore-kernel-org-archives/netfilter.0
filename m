From: "Yakov Lerner" <iler.ml@gmail.com>
Subject: Re: Filternig/logging by the exe name ?
Date: Tue, 13 Feb 2007 02:29:03 +0200
Message-ID: <f36b08ee0702121629l62d1ba3eq3449df3d8c4edd5@mail.gmail.com>
References: <f36b08ee0702100750y1b5f21b5i1d7646c829d28b5e@mail.gmail.com>
	<Pine.LNX.4.61.0702121839120.26360@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0702121839120.26360@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>, netfilter@lists.netfilter.org

On 2/12/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> Hi,
>
> On Feb 10 2007 17:50, Yakov Lerner wrote:
> >
> > Which filter allows me to filter/log by the name of the executable ?
> > Can I log the name of the executable [that was the sender or
> > receiver of the packet/connection], using such module ?
> > (talking about outgoing connection, in this case)
>
> Consider the case where there is no process executable attached to a
> socket.

Empty string would be reasonable representation of the process name in
such case, no ?
How common are sockets without process attached ?

Yakov

