From: Stephen Jones <hivemynd@hivemynd.net>
Subject: Re: pptp conntrack patch missing argument
Date: Sun, 12 Dec 2004 22:28:08 -0600
Message-ID: <41BD1A58.7020708@hivemynd.net>
References: <1102910163.41bd12d377f0a@webmail.sld.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102910163.41bd12d377f0a@webmail.sld.cu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ali <ali@infomed.sld.cu>
Cc: netfilter@lists.netfilter.org

Hi Ali,

I was just in the process of sending you a note about this with the 
2.4.28 kernel.  I did a simple clean recompile with the pom-ng-20040621  
against iptables 1.2.11 source with only the pptp conntrack patches 
applied, and indeed, it did recompile without making the changes to the 
code in

line 108 in ip_nat_proto_gre.c.  I then later ran through and applied a boat-load more of the available patches, and ran back into the problem again!  I was about to start the tedious process of trying to figure out which patch nerfed pptp conntrack.  I definitely did apply both the tproxy and the nat-reservations patches, and after that, it was borked again!  I will cc the netfilter list with this info as well.  I was also unable to recompile iptables 1.2.11 after those patches, something borked ipt_mac.c in that series of patches.  I will pay closer attention next time, and see if I can narrow it down.  Thanks very much for the heads-up!


Ali wrote:

>Hi Stephen,
>Yesterday i proceed to compile another 2.4.27 kernel identical to the previous
>that give me the missing argument error but without the tproxy patch and it
>compiles without an error!!!! Curious about that i researched a little more
>in the code and found that the real culprit is nat-reservations, fortunately
>it seems that the only patch that depends on it is tproxy so if you no
>include it the probability of a clean compile is almost 100%
>  
>

>  
>
>>PS: I CC'd the netfilter list with your suggestion
>>    
>>
>thanks for that :)
>
>  
>
>>in the hopes that it does indeed fix the problem with the latest pom-ng
>>release.
>>    
>>
>I don't think that would be possible, from my research nat-reservations fix
>the protocols included in the standard kernel (icmp, tcp, udp) but have no
>way to fix other protocols not included (ex: gre), perhaps the only solution
>would be that the gre patch maintainer include a note about the problem and
>its solution.
>
>Best regards,
>  Ali
>
>
>
>-------------------------------------------------
>Este mensaje fue enviado usando el servicio de correo en web de Infomed
>http://webmail.sld.cu
>
>
>  
>



