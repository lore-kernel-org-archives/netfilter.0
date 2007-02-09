From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Iptables proxy to a different network
Date: Fri, 9 Feb 2007 13:38:51 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
	<45CC5A91.4090200@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CC5A91.4090200@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On Feb 9 2007 12:27, Pascal Hambourg wrote:
>> -----------
>> *nat
>> -A PREROUTING -p tcp --dport 80 -j DNAT --to x.y.z:80
>> COMMIT
>> -----------
>> 
>> This seems to ALMOST work. The request from a client system (System C)
>> go to System A, get rewritten and are received by system B. System B
>> seems to be responding, trying to send to System C directly, but (I
>> think) System C is expecting its response to be from system A, not
>> System B, so it ignores the responses.
>
> As usual. Known issue.
> If you cannot or do not wish to prevent direct routing between the client and
> the server, you must SNAT the forwarded connections in the POSTROUTING chain.

Or make it so that any packets from C pass B. For example, by setting up
your proxy box as a router or bridge (both approaches work) in the middle.


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

