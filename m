From: "Lohan Spies" <l.spies@petzetakis.co.za>
Subject: RE: open port to specific ip address
Date: Tue, 11 Nov 2003 09:41:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAK6iB3UPoxEi0dscTRq25PQEAAAAA@petzetakis-africa.co.za>
References: <1068476240.1530.30.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068476240.1530.30.camel@valhalla>
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

Yes, this is exactly what I need. Internal to internal - nat external!

I don't know why the company want this because if I use my linux squid
proxy address for this everything is fine!

Will speak to the requestor and let you know! Thanks for all the help so
far!


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris Brenton
Sent: 10 November 2003 04:57 PM
To: netfilter@lists.netfilter.org
Subject: Re: open port to specific ip address


On Mon, 2003-11-10 at 08:26, Antony Stone wrote:
> 
> I assumed (maybe wrongly?) that because Lohan specified an internal IP
> address, the access was required from the internal network.

Obviously Lohan needs to be the one to clarify, but I think your right.
Going back through the thread, it looks like the access is internal to
internal, with forwarding to an external.

Of course this is still going to give him trouble if 10.10.10.41 is part
of the local subnet. Systems are going to ARP for this IP, not send the
traffic to their default gateway. You might be able to use publish ARP
on the internal interface of the firewall, but that assumes a flat
subnet and starts to get real messy.

Thanks for the clarification,
C

CONFIDENTIALITY CAUTION: If you have received this communication in error, please note that it is intended for the addressee only, is private and confidential and dissemination or copying prohibited. Please notify us immediately by e-mail and return the original message. We cannot assure that the integrity of this communication has been maintained nor that it is free of errors, virus, interception or interference. Thank you



