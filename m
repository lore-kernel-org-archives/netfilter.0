From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 16:08:15 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA578CF@OST_EXCH_USR5>
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I get the picture - so you can have "external-SSHD-access" chain, and
"external-SMTP-access" chain, rather than a huge pile of rules which you
could risk blamming, in a rushed moment.

I have mr Ziegler's esteemed tome [it seemed to be v highly regarded after a
snoop around googly groups] and it's damn fine, it's what I'm working from
to configure my fw.  Its so rigorous though that I can get easily lost in
there!

Sorry for the ultra-lamer question now...

is it the case that for each rule on the INPUT chain you must have the
corresponding OUTPUT rule also?  i.e. if I say

<pseudocode>
Accept from ANYWHERE spt:1024...65535 LOCALHOST dpt:22
</pseudocode>

Do I also have to put a corresponding response rule in --- 

Accept from LOCALHOST spt:22 ANYWHERE dpt:1024...65535

In order to allow the response through?
OR does the fact I've put an "accept from anywhere to SSHD" rule, imply that
I want to allow the service to respond.

Again, sorry for what seems like an ultra stupid question, but it's not 100%
clearly stated in ziegler, at least after two reads of the relevant chapter.

Thanks :D

steve




-----Original Message-----
From: Robert P. J. Day [mailto:rpjday@mindspring.com] 
Sent: 28 October 2003 1.14
To: Knight, Steve
Cc: netfilter@lists.netfilter.org
Subject: RE: new iptables user - default options


On Tue, 28 Oct 2003, Knight, Steve wrote:

> Thanks Robert - I appreciate your response.
> 
> I have to say I'd agree - it seems to be more of a belt and braces
approach
> to use your suggestion, and more in the spirit of what we were told in
> checkpoint kindergarten ["deny everything unless explicitly asked" - also
> sounds a bit like being married].
> 
> Are the rules in each chain processed top down?

yup, which is why many folks recommend setting up some user-defined
chains to break the processing down into more efficient and bite-sized
pieces (unless you have a very small set of rules, then it's not
really worth it).

so far, the more comprehensive treatment of iptables i've seen is
ziegler's new riders book, particularly the lengthy examples of 
rulesets he supplies.

rday



.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


