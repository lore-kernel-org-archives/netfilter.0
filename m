From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 16:16:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081616.08717.Antony@Soft-Solutions.co.uk>
References: <Law9-F5F4g09DudNhpK000185fd@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law9-F5F4g09DudNhpK000185fd@hotmail.com>
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

On Thursday 08 January 2004 3:53 pm, Martin Leduc wrote:

> Thanks for help Mr. Brenton,
>
> But I dont understand something.  You tell me to use my public address for
> each server on my DMZ.  How can I use public IP on my server who are behind
> my firewall?  I want the server to stay behind the Firewall.
>
> I have one IP range /28, and I dont think my ISP will give me another IP
> range.

The suggestion was that if you have a large enough public IP block, you subnet 
it so that part is used for your DMZ and part is used for everything else.   
You can then route the DMZ subnet to machines on the DMZ which genuinely have 
the public addresses assigned to them without using NAT.

All that is involved is to assign one of the /28 addresses to the DMZ 
interface on your firewall, choosing the addresses for the 'external' and the 
'DMZ' interfaces (as well as the netmasks) so that the DMZ is a clearly 
identified subnet of its own, with a sensible routing table entry (which gets 
set up automatically by Linux as soon as you assign the address and the 
netmask to the interface).

All you need to remember is that Linux consults its routing table from most 
specific to least specific, therefore a /29 subset of a /28 will take 
precedence over the more general /28 entry.

Since you have a /28 subnet (=16 addresses) it's certainly possible to do this 
in your case, and clearly a /29 subnet for the DMZ would be the simplest 
arrangement (although not the only one by any means).

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


