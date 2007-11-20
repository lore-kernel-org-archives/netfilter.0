From: Philip Craig <philipc@snapgear.com>
Subject: Re: Matching by packet connection
Date: Tue, 20 Nov 2007 11:13:22 +1000
Message-ID: <474234B2.203@snapgear.com>
References: <d95317090711160041n20025e6fldce7387cef82a115@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090711160041n20025e6fldce7387cef82a115@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

Gilad Benjamini wrote:
> Is there a way to match a packet against a connection's direction ?
> 
> e.g. apply this rule
> iptables -A chain --destination mymachine -m state --state ESTABLISHED
> -j another_chain
> only to packets belonging to CONNECTIONS with destination mymachine
> 
> conntrack definitely knows has this information.

Yes it does, but I don't think anyone has written a match to access it.
Can you give an example of what action another_chain does that you
only want to do for one direction?  Maybe there is another way to solve
your problem.

