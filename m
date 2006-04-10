From: "Mailings'AT'netzwerk.cc" <mailings@netzwerk.cc>
Subject: Re: patch-o-matic ROUTE
Date: Mon, 10 Apr 2006 17:04:25 +0200
Message-ID: <443A73F9.6050508@netzwerk.cc>
References: <BAY112-F18D7AFAD77899CAE8DFA9399CC0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY112-F18D7AFAD77899CAE8DFA9399CC0@phx.gbl>
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
To: Ian stuart Turnbull <ian.t7@hotmail.co.uk>
Cc: netfilter@lists.netfilter.org

Ian stuart Turnbull wrote:
> Hi folks,
> can I request some help please. I would like to know if the 
> patch-o-matic ROUTE -tee function works and if so could someone please 
> tell me how/when I apply the patch. I mean how does one tell the Kernel 
> make to include just this one extra patch?
> Sorry if this has been explained earlier. I attempted to search the 
> mailing list archives but couldn't find a search capability.
> Thanks,
> Ian t
> 
> _________________________________________________________________
> Are you using the latest version of MSN Messenger? Download MSN 
> Messenger 7.5 today! http://join.msn.com/messenger/overview
> 
> 
> 

Hey dude :),

take a look at the pom2patch file in your patch-o-matic directory.

i think you have to call it like "pom2patch kernel-source patch"

you should get a normal kernel diff file.

cheers

