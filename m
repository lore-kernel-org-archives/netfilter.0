From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Filtering PPP traffic
Date: Thu, 17 Apr 2003 12:55:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030417195557.52702.qmail@web40208.mail.yahoo.com>
References: <3E9EEA10.9050306@numlog.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E9EEA10.9050306@numlog.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francis GASCHET <fg@numlog.fr>, netfilter@lists.netfilter.org

You should be able to filter at the "eth0" level of your diagram...

I kinda need more information on your "BRIDGE" before I could suggest something
else.. If by bridge you mean it bridges the DSL modem and the LAN...then your
eth0 is in the same machine you are calling a bridge?

In that case you should theoretically filter the eth0 device


--- Francis GASCHET <fg@numlog.fr> wrote:
> Hi list,
> 
> Is there somebody who knows a possibility to apply netfilter rules to 
> ppp packets ?
> 
> Configuration :
> 
> DSL - PCI modem card - BRIDGE - eth0 (in a virtual machine)
> 
> I would like to filter the traffic which flows across the bridge, but at 
> this level, the IP traffic is encapsulated...
> 
> Any clue ?
> 
> Ciao.
> 
> -- 
> Francis GASCHET / NUMLOG
> http://www.numlog.fr
> Tel.: +33 (0) 130 791 616
> Fax.: +33 (0) 130 819 286
> 
> 
> 
> 
> 


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

