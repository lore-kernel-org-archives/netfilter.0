From: Garison Piatt <todo@garisonpiatt.com>
Subject: Re: I have no idea why this doesn't work...(further details)
Date: Thu, 22 Apr 2004 10:10:28 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040422095244.03eb5ec0@mail.garisonpiatt.com>
References: <20040422192403.16425.25260.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040422192403.16425.25260.Mailman@vishnu.netfilter.org>
References: <20040422192403.16425.25260.Mailman@vishnu.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 09:24 PM 4/22/04 +0200, you wrote:
>Also, if you want help from this list, you'll have to be a bit clearer about
>what you are trying to do

Ah!  Good point.

>(for example, you have some pretty strange destination port
>numbers in there, and I can't begin to guess why).

Because this was cobbled together from scripts that were said to work in 
other places, and my assumption was that these were common port numbers.


>I recommend the following:
>1. Describe your network setup to us so that we know what clients & servers
>you have on what network segments.

As far as I know: one server, everything on the same machine, no 
LAN.  Right now, there is only the IP for the server itself, and another 
for one web site client; in the future she'll have 8-10 sites (with 
independent IPs) on the server.

I say "as far as I know" because all of my information come via my client, 
who is not exactly computer literate, even though she is in the business of 
designing web sites.  Support calls are $150 a pop, so she wants me to make 
as few of those (read: zero) as possible.


>2. Explain what traffic you want to allow and what traffic you want to block
>(and what you want to log).

We want to allow TELNET (just from me and her, if possible), all FTP, and 
web traffic.  We can't have (and don't want) chats, and we'd like to keep 
hackers out.


>3. If you feel able to do so, show us a very simple script which does most of
>what you need

I don't, sorry.  I'm just a programmer, and I've left system administration 
to the experts until now.

>If you don't feel able to do this, don't worry, just ask for guidance on 
>how to do
>what you described in (2), given the sitiuation in (1).

Okay: I'd like some guidance on how to do what I described in (2), given 
the situation in (1).  Bear in mind that, though I'm confident I can 
program rings around most of my colleagues in any of a dozen languages, 
when it comes to sysadmin stuff, I'm basically an idiot.

Feel free to contact me privately, if need be: todo@garisonpiatt.com


Mahalo,
-garison



