From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: feature request
Date: Thu, 14 Apr 2005 13:52:35 -0500
Message-ID: <425EBBF3.9090904@riverviewtech.net>
References: <aec22fc50504140950949956c@mail.gmail.com>	<425EB3F5.5020003@riverviewtech.net>
	<425EB850.1060506@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425EB850.1060506@solutti.com.br>
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
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

> 
>    Guys, how about using the new comment module for making grepping easy 
> ???? Instead of grepping the rules parameters, you can include an unique 
> ID as a comment in your rule and simply grep for it !!! What do you 
> think ??

I've considered doing that my self for other projects.  But seeing as how I did not have any real solution / method for doing so already I did not want to propose it yet.  I'm thinking of using it for more of a ""system that would manage all your rules, not unlike SysV Init scripts, for you.  You would then go through that interface and work with iptables.  I know that what ever I end up coming up with I'll end up using some sort of numeric identifiers for the rules to be matched against so it is easier to machine parse.  I'll probably end up using a comment of something like this ':<numeric ID>:<free text comment>'.  This way the machine parseable identifier is there in the form of ':<numeric ID>:' where it will be easy to find on the line.  The <numeric ID> will be at the start of the comments and starting at about the same column on screen while still allowing for free text comments (
 or as free as comment will allow it's self, just a bit shorter) thus making it easier to 
search for a specific <numeric ID> visually, vs having it at the end of the comment which would make location of the <numeric ID> of the rule depend on the length of the free text.  Seeing as how comment is a relatively new match extension and not all systems have it in the kernel this system would be valid for new and patched kernels only.  Where as something that would parse the output of iptables(|-save) would be more backwards compatible.

I personally am EXTENSIVELY using the comment match extension, as well as planing on using TARPIT targets (that is a sticky subject un to it's self.  Pun intended.  :P  )



Grant. . . .

