From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: messages in /var/log/message file
Date: Wed, 09 Oct 2002 16:58:15 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA412CF.5010107@inbox.lv>
References: <Pine.LNX.4.44.0210091216330.29480-100000@dns.toxicfilms.tv>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: netfilter <netfilter@lists.netfilter.org>

hi
thanx for responding. some info to you all...
the linux box with 2.4.19 kernel & iptables 1.2.7a has 768mb ram its 
ip_conntrack_max shows 48632.
moreover the ip(=>> ipA) in the message file is a valid ip and not a 
private one & its going to a valid ip in internet.
the very interesting & confusing part for me(& hope for others?? ) is 
why a day ago with iptables 1.2.6a there was no error message ???.. as i 
mentioned in last mail the only difference is that i have as module--> 
ip_nat_h323.o & also ipt_helper.o
one last info to add here---why only this message for >>ipA<< when the 
box is handling more than 500 valid ip & above 200 private ip( of 10 
series),..slabinfo shows...
ip_conntrack        5150   6660    320  490  555  1

pls i need help to know where things went wrong for me.. if someone else 
have experienced the same can they give their experience/suggestions ??
thanx in anticipation...
A.H

Maciej Soltysiak wrote:
 >>Oct  9 12:25:24 ICG kernel: NET: 5 messages suppressed.
 >>Oct  9 12:26:31 ICG kernel: NET: 1 messages suppressed.
 >>Oct  9 12:26:31 ICG kernel: ip_conntrack: max number of expected 
 >>connections 1 of ftp reached for <ipA> -> <ipB>, reusing
 >>Oct  9 12:27:12 ICG kernel: ip_conntrack: max number of expected 
 >>connections 1 of ftp reached for <ipA> -> <ipB>, reusing
>>these messages are piling the message file.
>>am cusrious now why so ?.. what does this message signify ?
> 
> Read the FAQ, and then increase your /proc/net/ip_conntrack_max
> 
> Best Regards,
> Maciej Soltysiak
> 


