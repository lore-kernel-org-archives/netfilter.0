From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Trouble with --dport
Date: Mon, 21 Oct 2002 21:27:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021202758.QVP28874.mta06-svc.ntlworld.com@there>
References: <20021021201254.35389.qmail@web10908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021201254.35389.qmail@web10908.mail.yahoo.com>
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

On Monday 21 October 2002 9:12 pm, blah blah wrote:

> I am having trouble with the following lines:
>
> -A INPUT -i eth0 -p tcp -s 1.1.1.1 --dport 1234 -j
> ACCEPT
> -A INPUT -i eth0 -p tcp -s 1.1.1.2 --dport 1233 -j
> ACCEPT
>
> I get an error message about --dport being an unknown arg.

What actual error message do you get ?

If you can type in the commands and then cut & paste what you type and what 
comes back that would be good.

> If I use either of the 2 lines without the other they work fine.

To me, that says there's no "unknown argument", otherwise it would still be 
unknown when you haven't typed the other command....

> It always errors on the second line.   I can reverse the order and
> whichever is the second line will be flagged.

Show us a cut & paste so we can see what you mean.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

