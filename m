From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: execute iptables via web browsers?
Date: Fri, 24 Oct 2003 12:03:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F994D6A.1080108@Loudoun-Fairfax.com>
References: <200310240725.h9O7PuE23633@smtp.postech.ac.kr> <001701c39a0b$32aa86a0$0301a8c0@SIMON> <3F9938A3.8090903@fastwebwork.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F9938A3.8090903@fastwebwork.com>
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
To: rcriggs <rcriggs@fastwebwork.com>
Cc: netfilter@lists.netfilter.org

rcriggs wrote:

> Check and see if someone has written a webmin module
> for iptables.
>
> Simon Garner wrote:


There is a Webmin module for Shorewall and a regular frontend for 
iptables which seems to work fine. Like all Webmin modules it's fairly 
slow to refresh and can make extensive rule changes pretty tedious. I 
generally ssh in and edit my script directly since it's faster and I can 
document the rule better, but that's just my choice.

Jeff



