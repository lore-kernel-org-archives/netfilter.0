From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Matching UDP broadcasts using RELATED
Date: Mon, 5 Jan 2004 16:16:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401051616.15414.Antony@Soft-Solutions.co.uk>
References: <xiwu88jw8c.fsf@random-node.example.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <xiwu88jw8c.fsf@random-node.example.org>
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

On Sunday 04 January 2004 2:14 am, yu5p97f02@sneakemail.com wrote:

> For protocols which work by initiating a request using a UDP broadcast and
> expecting a reply for a specific host, is there any way to match the reply
> back to the original broadcast.
>
> An example of something that does this is smbmount, a request is broadcast
> to the localnet with a port set to the netbios-ns port, and then smbmount
> expects a reply from a particular host to the initiating port.

Not with the existing connection tracking code, no.

It shouldn't be too hard to write a conntrack helper for such a protocol which 
enables reply packets to be recognised as Related, however - all it would 
need to do is match:

  destination IP = original source IP
  destination port = original source port
  source IP is within network range of original broadcast destination IP
  source port = original destination port

If you wanted to do a 'quick and dirty' version then you could even not bother 
about the source IP, and match packets where just the other three were 
correct - this would then be an almost trivial hack of the current conntrack 
code, I expect.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


