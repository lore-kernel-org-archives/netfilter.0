From: "Corey Furman" <furmanc@empirekosher.com>
Subject: Re: Email Server Timeouts
Date: Thu, 19 Feb 2004 13:49:14 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3515.192.168.2.103.1077216554.squirrel@mail.empirekosher.com>
References: <20040218203304.24484.34213.Mailman@netfilter-sponsored-by.noris.net>
Reply-To: furmanc@empirekosher.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040218203304.24484.34213.Mailman@netfilter-sponsored-by.noris.net>
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

Thanks, Antony.  Just because I do a thing, doesn't mean I know why I do
it :P

I (believe it or not) close those ports because I did not think anything
would use them, and I sort of approach the firewall as:
    + close everything
    + poke holes where needed

This may sound like a stupid question, but why aren't the SMTP and POP
ports sufficient?

For better or for worse, I only know enough to get the linux products I
use to work, and if something goes wrong, I usually take a week or two to
figure it out.  The company I work for doesn't have the cash to get me
trained, so anything I learn is typically self taught on live systems.

So I appreciate it when folks like yourself give me a direction to look
for answers.  Thanks a lot!

Let me say for the record that if I had my druthers, the firewall would be
a firewall and nothing else.  I'm simply constrained on resources, and
frankly I have bigger fish to fry.  I'll get back to it at some point this
year....



> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> To: netfilter@lists.netfilter.org
> Subject: Re: Email Server Timeouts
> Date: Wed, 18 Feb 2004 18:55:31 +0000
>
> On Tuesday 17 February 2004 9:20 pm, Corey Furman wrote:
>
>> When I enabled these rules, but then sendmail (on the same box) started
>> timing out talking to other mail servers.  Does anyone see why?
>
> Yes.   Your first INPUT rule blocks all TCP packets coming in to ports in
> the
> range  11001 to 65535 (why do you have this rule?).
>
> That means on average there's an 85% chance that any connection from this
> machine will not be able to receive a response, depending on the source
> port
> it chooses to communicate from.
>
> By the way, I'd just like to comment that it's not a good idea to run
> sendmail
> (or any other application for that matter) on your firewall.
>
> Regards,
>
> Antony.


