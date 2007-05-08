From: Bas Verhoeven <netfilter@bserved.nl>
Subject: Re: iptables NAT routing issues
Date: Wed, 09 May 2007 00:46:01 +0200
Message-ID: <4640FDA9.5000706@bserved.nl>
References: <4640E893.1010206@bserved.nl>	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>	<4640FAD0.9050301@plouf.fr.eu.org>
	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

Jan Engelhardt wrote:
>
>> Assuming that the outbound server is the default gateway for the web server and
>> receives the return traffic, of course.
>>     
>
> You'd be kinda screwed if that was not the case. Because the 'nat' table
> is only consulted for NEW connections afaics, the reply packets do _not_
> get SNATed, since the _first_ packet was the TCP SYN, which makes the
> connection ESTABLISHED when input processing is done.
>
>   
The webserver has its own gateway, and that's not the outer box. You 
seem to be describing the exact problem i'm seeing in tcpdump; new 
connections get snat'ed, 'forwarded' connections do not.

Is there really no solution for this?

Bas

