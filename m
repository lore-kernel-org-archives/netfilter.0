From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnatted interface showing up as FW interface
Date: Thu, 11 Dec 2003 16:31:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111631.02756.Antony@Soft-Solutions.co.uk>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57C04@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57C04@OST_EXCH_USR5>
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
To: netfilter@lists.netfilter.org

On Thursday 11 December 2003 4:20 pm, Knight, Steve wrote:

> Why would an address that DNATs quite happily inbound
>
> 217.x.x.138 -> 192.168.1.2
>
> show up as the router address when performing outbound traffic - for
> example when delivering mail it is connecting from 137, instead of 138?

Probably because you have a general-purpose SNAT rule for outbound packets, 
setting the source address on everything to 217.x.x.137?

> Is there a forward rule I've forgotten?  Or do I need to do another DNAT
> rule translating 192.168.1.2 -> 217.79.119.138?

Change DNAT into SNAT in the above sentence, and yes.

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


