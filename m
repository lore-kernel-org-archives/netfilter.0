From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: More neqbie questions
Date: Mon, 2 Aug 2004 20:03:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408022003.54833.Antony@Soft-Solutions.co.uk>
References: <410E7DFB.9000505@mail.co.gilchrist.fl.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410E7DFB.9000505@mail.co.gilchrist.fl.us>
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

On Monday 02 August 2004 6:46 pm, Eric Ellis wrote:

> This is one of those things that's been hounding me for the past few
> weeks that I can't understand what's *exactly* going on...
>
> I've been using the IPTables tutorial from
> http://iptables-tutorial.frozentux.net/chunkyhtml/index.html, as has
> been pointed out and recommended by many of the list's pros.  It's a
> great tutorial, and I highly recommend it.
>
> However, I have either glossed something covered in it, or I have a
> fundamental misunderstanding of some part of IPTables.
>
> I know that the route works.  I've verified it.  I can move IPTraffic
> when I set all of my policies on my filter script to accept.  However,
> when I set my policies on my script to drop, Nothing talks any more.

My recommendation is to put a LOG rule at the end of each chain, just before 
the default DROP policy takes effect, and you'll see what packets are getting 
that far and then being lost.

Regards,

Antony.

-- 
If J. Random Websurfer clicks on a button that promises dancing pigs on his 
computer monitor, and instead gets a hortatory message describing the 
potential dangers of the applet - he's going to choose dancing pigs over 
computer security any day. If the computer prompts him with a warning screen 
like: "The applet DANCING PIGS could contain malicious code that might do 
permanent damage to your computer, steal your life's savings, and impair your 
ability to have children," he'll click "OK" without even reading it. Thirty 
seconds later he won't even remember that the warning screen even existed.

 - Bruce Schneier "Secrets and Lies"

                                                     Please reply to the list;
                                                           please don't CC me.


