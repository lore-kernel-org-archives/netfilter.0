From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat with virtual interfaces
Date: Thu, 27 Jun 2002 16:40:19 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206271540.g5RFePU14935@vulcan.rissington.net>
References: <BACC2B29B574704A8494EAD86EDBB9500993B2@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <BACC2B29B574704A8494EAD86EDBB9500993B2@stosrv-0003.lemonplanet.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 27 June 2002 1:49 pm, Mika Ullgren wrote:

> Now when I connect to either http://192.168.64.59 or
> http://192.168.64.75 I get the same DocumentRoot. But when I go to
> http://192.168.64.75:8443 (eth0:0) i get the other DocumentRoot. So it
> seems there is something strange in the redirection.
>
> 192.168.64.59:8443, 192.168.64.59:8443 and 192.168.64.75 goes to
> DocumentRoot no.1
> 192.168.64.75:8443 goes to DocumentRoot no.2
>
> Im completely lost. I hope you got any more ideas.

What do you get in response to:

iptables -L PREROUTING -t nat -v -n

Do the packet / byte counters show that packets are getting translated by 
each of the four rules (in which case it would seem to be Apache that's 
having the problem), or do you see no packets being matched by one (or more) 
of the nat rules ?

 

Antony.

