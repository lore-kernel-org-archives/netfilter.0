From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Sharing Limited Internet Connection
Date: Thu, 1 Sep 2005 21:39:16 -0500
Message-ID: <200509012139.16446.rob0@gmx.co.uk>
References: <025601c5afe2$21c119a0$0200a8c0@etpi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <025601c5afe2$21c119a0$0200a8c0@etpi>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 2005-September-02 12:17, TestMail wrote:
> My ISP said i can only connect 1 PC in my DSL account (is this
> true????).

Lawyers who have no understanding of networking dictate such terms. 
Careful examination might show that they're talking about the physical 
connection ... only one DHCP client, one routable IP address.

Or perhaps they really are that stupid. There's no way they can enforce 
a restriction like that, because by all appearances you would only have 
a single machine connected. (They COULD sniff all your traffic and see 
if you're showing evidence of multiple computers in use, but that's not 
likely to make money for the company, so in reality don't worry.)

But ... if they caught you, they might use it as a means to extort more 
money out of you, so if they are that stupid and your terms don't allow 
NAT sharing of your connection, don't talk about it.

> If it is not true how can i share it using iptables??? 

http://netfilter.org/documentation/HOWTO//NAT-HOWTO.html
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

