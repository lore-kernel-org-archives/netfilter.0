From: Marco Colombo <marco@esi.it>
Subject: Re: Question about marking traffic.
Date: Tue, 29 Jun 2004 11:29:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E1368E.4040207@esi.it>
References: <1987903676.20040628181707@op.pl> <200406281731.40331.Antony@Soft-Solutions.co.uk> <1499142519.20040628225033@op.pl> <200406282204.57874.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406282204.57874.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Monday 28 June 2004 9:50 pm, mortar wrote:
> 
> 
>>I have one more question. Maybe someone can help.
>>
>>What about tracking connections on non standard ftp ports (or http), for
>>example 2121? How can i recognize them as a ftp (or http) connections
>>and proper mark them?
> 
> 
> I would answer this "you can recognise them just the same as you can recognise 
> them on 'standard' ports 21/20 or 80" - in other words (with a packet filter) 
> you can't - you just have to assume that ports = services (not always a safe 
> assumption).
> 
> 
>>I read about layer7-filter project, but is it necessery?
> 
> 
> Yes - if you want to know whether a traffic stream is HTTP (etc), you have to 
> look at OSI layer 7, because that's the only place HTTP means anything.
> 
> Netfilter works at OSI layers 3 & 4, therefore it can't identify what is HTTP 
> / FTP / DNS etc - it can only guess.

Not completely true, IMHO. conntrack modules look well above the TCP level
(OSI levels make little sense for the TCP/IP protocol suite, they simply
don't fit perfectly) otherwise they won't work. ip_conntrack_ftp does look
at the FTP protocol, and is able to recognise incoming (data) connections
as RELATED to the control one. But I don't know how to use such knowledge
to detect FTP running on non-stardard ports, particularly in matching a
rule.

.TM.
-- 
       ____/  ____/   /
      /      /       /			Marco Colombo
     ___/  ___  /   /		      Technical Manager
    /          /   /			 ESI s.r.l.
  _____/ _____/  _/		       Colombo@ESI.it

