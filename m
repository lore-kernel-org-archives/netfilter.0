From: Florian Westphal <fw@strlen.de>
Subject: Re: Creating named set
Date: Sat, 27 Mar 2021 00:31:51 +0100
Message-ID: <20210326233151.GD8998@breakpoint.cc>
References: <037901d72265$3e58d790$bb0a86b0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <037901d72265$3e58d790$bb0a86b0$@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: paul.guijt@gmail.com
Cc: netfilter@vger.kernel.org

paul.guijt@gmail.com <paul.guijt@gmail.com> wrote:
> Hi all,
> On Raspbian I tried:
> 	sudo nft add set inet filter blocklist { type inet_proto \; flags timeout \; }
> 	Error: Could not process rule: No such file or directory
> 	add set inet filter blocklist { type inet_proto ; flags timeout ; }
 	             ^^^^^^
> I have tried all sorts of syntax, but every time that error comes up. Even with “% nft add set ip filter blackhole { type ipv4_addr\;}” from the wiki. 
> I have an inet table, and in it I want to drop anything coming from @blocklist. Can anyone please hand me the correct syntax, either for command line (sudo nft …) or for a rules file? 

This syntax is fine.  The error comes from the kernel.
Either no 'inet filter' table exists, or your kernel lacks set
functionality.
