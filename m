From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: /dev/rob0 Need to secure up server. But want to use qmail
	sending and php mx functions
Date: Tue, 23 Aug 2005 06:06:15 -0500
Message-ID: <200508230606.15882.rob0@gmx.co.uk>
References: <0MKwtQ-1E7VDR2DXS-0007hK@mrelayeu.kundenserver.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0MKwtQ-1E7VDR2DXS-0007hK@mrelayeu.kundenserver.de>
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

To clarify the .sig, I generally read list mail. The Subject header 
concerns offlist mail only. I often don't even collect mail at this 
address, and in fact it has been more than a week since I did. I read 
list mail from a different subscribed address in my own domain.

On Tuesday 2005-August-23 04:38, darren@daz-web.com wrote:
> I want to allow the qmail to send mail out from the box and allow php
> scripts to use the MX functions to identify bad domains. The problem
> is that this means I need to have all ports open for outgoing . Is

I generally do not recommend restricting OUTPUT. You can, if you know 
all source ports or destination ports or destination IP's you need, but 
the gain in security is far less than the loss of functionality. Thus 
I'd say, don't worry, leave OUTPUT open.

> there a way to set up for outgoing mail and mx record checks to be
> done without opening all ports.

As described above. Outgoing mail will always have destination port 
25/tcp. Outgoing DNS queries will always go to the nameservers listed 
in your resolv.conf, and to 53/tcp and 53/udp.

Experiment with LOG rules to see what other external connections are 
being initiated. Perhaps you will find that your PHP has already been 
0wn3d. ;)

More on the security of OUTPUT filtering: if an intruder has a 
functional shell on your system, chances are high that a privilege 
escalation will occur. At that time whatever ports are wanted can be 
opened by and for the intruder's use. Furthermore in the few 
compromised systems I have seen, a common use of it is to send phish 
spams. You'll be allowing that anyway.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

