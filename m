From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I have no idea why this doesn't work...
Date: Thu, 22 Apr 2004 20:23:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404222023.24672.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040422085041.03eb3ec0@mail.garisonpiatt.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040422085041.03eb3ec0@mail.garisonpiatt.com>
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

On Thursday 22 April 2004 7:58 pm, Garison Piatt wrote:

> Aloha.

G'day.

> I'm Garison, a web designer in Hawaii.

Hi.

> Below is a pared-down combination of several example scripts which did
> something reasonably close to what I want.  When I run this, however, I lose
> FTP, and who-knows-what-else.

Your posted ruleset *is* very long, yes, and by your own admission you're not 
quite sure what you're doing, so I recommend that you start simple and build 
up, ensuring there are no problems at each stage, so that when a problem does 
crop up, you know it must be the small part you just changed, rather than 
"somewhere in this great long script I've got".

Also, if you want help from this list, you'll have to be a bit clearer about 
what you are trying to do - specifically, what you want to allow, and what 
you want to block, so that we can understand why you have certain things in 
your ruleset (for example, you have some pretty strange destination port 
numbers in there, and I can't begin to guess why).

I recommend the following:

1. Describe your network setup to us so that we know what clients & servers 
you have on what network segments.

2. Explain what traffic you want to allow and what traffic you want to block 
(and what you want to log).

3. If you feel able to do so, show us a very simple script which does most of 
what you need, but falls down somewhere, and ask for guidance with the bit 
which doesn't work.   If you don't feel able to do this, don't worry, just 
ask for guidance on how to do what you described in (2), given the sitiuation 
in (1).

It's actually far easier to say "this is how I would go about what you 
require" than it is to say "this is where I think there's an error in your 
existing script which I don't fully understand".

Hope this helps,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


