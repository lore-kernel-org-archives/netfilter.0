From: Luke Worthy <luke@solutionsmanagement.com.au>
Subject: MASQUERADE: Route sent us somewhere else.
Date: Thu, 26 Feb 2004 16:11:58 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402261611.58277.luke@solutionsmanagement.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi hi,

      I am a Linux admin, and recently set up an IP Tables firewall at work.  
Whenever I set up these things, I like to use nice programs with interfaces 
to quickly and easily change things, at the moment, my fav de jour is Jay's 
Firewall (if you havn't seen it - it's very slick).

Anyways, it doesn't use SNAT, just MASQ, and it is on a static IP....so I 
started seeing them msgs:

MASQUERADE: Route sent us somewhere else.

A quick google, and I saw the msgs about Rusty's brain breaking etc.

So I put an older kernel on the firewall, and it's all sweet.  So what I want 
to know is, is 2.4.25 good-to-go using this MASQ technique, or should I talk 
to Jay about incorporating SNAT - or some other suggestion?

Luke

(using Debian Woody)

