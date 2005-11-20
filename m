From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: DROP or REJECT?
Date: Sun, 20 Nov 2005 12:57:12 -0600
Message-ID: <200511201257.12528.rob0@gmx.co.uk>
References: <000001c5ee00$f8343970$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c5ee00$f8343970$2801a8c0@MBRC40>
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

On Sunday 2005-November-20 12:33, Michael D. Berger wrote:
> For blocking various attacks on ports 22 and 80,
> I have been using:
>    -j REJECT --reject-with icmp-host-unreachable
> To minimize future attempts, is this best, or is
> there a better idea, such as DROP?

I doubt it matters much. I have seen, though, with my own approach of 
"-m limit --limit 3/min --limit-burst 3 -j ACCEPT" (followed by a DROP 
or REJECT rule) that -j REJECT does not always turn them away 
immediately, whereas with -j DROP they usually give up. But my REJECT 
uses the default, "--reject-with icmp-port-unreachable".

Insofar as concerns future attacks, as long as you have those ports 
open, you will have bots and worms knocking on them. They are nothing 
more than an annoyance if you have properly secured services.

I think the purpose of the SSH probes is to find more hosts from which 
to launch these probes. :) And some of them are put to work in phishing 
scams. The whole idea is to make it impossible to trace the phisher. 
They probably decide who to attack by doing a port scan on 22 of the 
entire Internet. When you're using stolen resources, there is no need 
to conserve.

HTTP probes are similar except most of those seem to target MS IIS. 
These are more likely to be operated by Internet mass-mail marketers, 
a/k/a spammers.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

