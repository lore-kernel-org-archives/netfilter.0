From: thiago@powers.com.br
Subject: Re: load balancing with REDIRECT - what is the best way?
Date: Fri, 11 Aug 2006 14:55:16 -0300
Message-ID: <OFE2B0B54F.CEEE25A8-ON832571C7.006242A1-832571C7.00636583@powers.com.br>
References: <73E0FE76-7EE0-4EC7-904B-17E157A4D0DC@121media.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <73E0FE76-7EE0-4EC7-904B-17E157A4D0DC@121media.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Paul <jeffrey.paul@121media.com>
Cc: netfilter-bounces@lists.netfilter.org, netfilter@lists.netfilter.org

A range should be begin:end (note the : instead of -). 

--
Thiago Lucas
thiago@powers.com.br
POWERSolutions Inf. Ltda.




Jeffrey Paul <jeffrey.paul@121media.com> 
Enviado Por: netfilter-bounces@lists.netfilter.org
11/08/2006 14:59

Para
netfilter@lists.netfilter.org
cc

Assunto
load balancing with REDIRECT - what is the best way?







I'm trying to perform some simple load balancing using the REDIRECT 
target.

Right now, I'm using -p tcp --dport 80 -j REDIRECT --to-ports 3128 to 
transparently proxy web traffic to a running squid.

I'd like to be able to balance between several running squid 
processes, say, on 3128, 3129, 3130, and 3131.

The --to-ports option to REDIRECT says it can take a port range, 
which I tried ("--to-ports 3128-3131"), but it only rewrites the dest 
port to 3128.  What is a port range option to --to-ports ever used for?

Next up, if I can't get this method working, is to try to use the nth 
or random modules to select SYNs to redirect to various ports.  Will 
I need to use connection marking to differentiate which ports I am 
redirecting a given set of tcp packets (a connection) to, or will the 
built in connection tracking automatically rewrite subsequent packets 
in the same connection with the same dest port it gave the first one?

Also, I read somewhere that nth and random aren't in patch-o-matic-ng 
anymore because they're being included into .18.  As they're not yet 
in the latest .18-rc, is there any currently recommended way of 
getting them into a production system other than using the last patch- 
o-matic-ng snapshot they're in (20060511)?

Cheers,
-j

--
Jeffrey Paul, 121Media - jeffrey.paul@121media.com
646-217-0598 x5333
264 W. 40th St, New York, NY 10018







