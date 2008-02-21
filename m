From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic IPTables / firewall help?
Date: Wed, 20 Feb 2008 18:45:51 -0600
Message-ID: <47BCC9BF.9050509@riverviewtech.net>
References: <47BCA565.3000309@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47BCA565.3000309@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 02/20/08 16:10, Simon Jester wrote:
> Is there a list somewhere that is more for newbies where I can ask dumb 
> questions and not feel like I just stepped off a bus at Times Square 
> with no clothes on?

I don't know if there is another list elsewhere or not.  I'm sure there 
are lists but I would have no idea where to look other than Google or 
distribution support pages.

> Really - IPTables rules mystify me. What I need is some help translating 
> plain english (ie, I want to block everything except x, y and z) to the 
> appropriate IPTables command/rule. This list appears to be far too 
> technical for my needs...

IPTables is not that bad.  The thing that you really need is an 
understanding of what you are working with (and trying to filter).  The 
next thing you need is an understanding of how identify what you are 
trying to filter and then decide what to do with it.  Third, you need to 
understand the different ways that you can arrange things in an if match 
accept / drop / jump type logic structure.  (How to translate individual 
packet matching rules in to the """Business Logic""" of IPTables 
firewall rules.)

To sort of answer what you want, you could do something like this:

If <packet(s)> match "x" do "this"
If <packet(s)> match "y" do "that"
If <packet(s)> match "z" do "something"

"this", "that", and "something" can be the same or different actions. 
If you are happy with the simple match(s) you can decide to ACCEPT or 
DROP the packet(s) then and there.  If you need to run other tests on 
just packets you can jump to a different chain where you start your 
different set of matches against just the packets that matched the first 
set.

> Tia for any pointers or suggestions...

*nod*

I guess you can ask away with your questions.  Or if you want to talk 
off list, email me directly.



Grant. . . .
