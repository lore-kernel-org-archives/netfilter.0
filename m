From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What are these and how can I not log them?
Date: Mon, 07 Jul 2008 21:25:52 -0500
Message-ID: <4872D030.5050701@riverviewtech.net>
References: <48729139.8040505@libertytrek.org> <48729582.909@riverviewtech.net> <48729F72.5060502@libertytrek.org> <4872A002.8020606@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4872A002.8020606@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/7/2008 6:00 PM, Simon wrote:
> never mind, I see a iptables -L will list them all...

That will list the rules in one table, filter by default.  You will need 
to dump all tables that way.  IPTables-save is a more concise way to 
dump all tables and rules in one clean consistent manner for others to see.

Yes the copy and past will work.  (See my (coming) reply to your 
previous message.)



Grant. . . .
