From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Deleting Rules
Date: Sun, 14 Sep 2003 06:48:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F64478E.8060201@chrisbrenton.org>
References: <3F642E1B.8010801@riovia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Caritj <pcaritj@riovia.net>
Cc: netfilter@lists.netfilter.org

Paul Caritj wrote:
> 
> Is it possible to delete rules without complete knowledge of its 
> contents? E.g., Would it be possible to delete all rules that match a 
> source ip of X?

Not in my experience. Its only worked for me when I specify all the same 
options that are in the original rule.

> If not, can anyone recommend a workaround?

Maybe you can grep the output from '-L -nv' to search for the IP address 
you want, and then use info in the output to create your delete rule?

HTH,
C


