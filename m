From: "HareRam" <hareram@sol.net.in>
Subject: Re: transfer Bytes Counting
Date: Fri, 4 Oct 2002 14:14:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017601c26b82$5189c8a0$7cfcc5cb@humanpc>
References: <MGEJJDEEGMBGKBIMLPDDAEELCBAA.ctodish@crayon.com>
Reply-To: "HareRam" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Clint Todish <ctodish@crayon.com>, Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Hi Clint

thanks for the reply
i am not able to see any file called the same name in /proc/net/ directory
how to i export and get that file and put the in and out packets to mysql
can u give me some example

thanks
hare
----- Original Message -----
From: "Clint Todish" <ctodish@crayon.com>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>;
<netfilter@lists.netfilter.org>
Sent: Wednesday, October 02, 2002 9:43 PM
Subject: RE: transfer Bytes Counting


>
> What might be exceeding useful is the addition of in/out packet counters
in
> /proc/net/ip_conntrack - kind of like Cisco's netflow. Not only would
> historical info been gleaned, but a nice real-time "what's goin on with
the
> net" tool could be built off of that.
>
> -C
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: Wednesday, October 02, 2002 9:33 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: transfer Bytes Counting
>
>
> On Wednesday 02 October 2002 2:39 pm, HareRam wrote:
>
> > Hi
> >
> > thanks for the reply
> > i did the same, but iam not able to see the in and out bytes
>
> If you mean a separate count of bytes in each direction on the connection,
> you would need to have two rules, one to count packets in and one to count
> packets out.
>
> > is there any way i can send those packets to mysql
> > from there i can generate report
>
> I believe other people have posted to this list with mechanisms for
> capturing
> log entries to sql database - can anyone post a tool or URL to help with
> this?
>
> Antony.
>
> --
>
> You can spend the whole of your life trying to be popular,
> but at the end of the day the size of the crowd at your funeral
> will be largely dictated by the weather.
>
>  - Frank Skinner
>
>
>


