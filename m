From: "George J. Jahchan, Eng." <NetFilter-Users@Compucenter.org>
Subject: RE: Unassigned Networks List
Date: Sat, 8 Mar 2003 07:51:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBIFPIJNDPMFBPKBPGOEJIDKAA.NetFilter-Users@Compucenter.org>
References: <007201c2e2d7$4c6552f0$e11310ac@techknowledge.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007201c2e2d7$4c6552f0$e11310ac@techknowledge.ws>
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
To: Netfilter <netfilter@lists.netfilter.org>
Cc: "Gokarn, Pavan" <PavanG@TechKnowledge.ws>

Pavan,
I am trying to block RFC1918 networks, in addition to unassigned ones (IANA
reserved or not assigned) from getting in or out on the public interface.
Any traffic coming in (or leaving) from such networks on the public
interface undoubtedly has a spoofed source IP and should be dropped.
As mentioned before, classes A & D networks are fairly well documented on
IANA's site <http://www.iana.org/assignments/ipv4-address-space>, but B and
C are listed as "various registries" and in bulk, which is of no help.
I need a list of 128~191 and 192~223 netblocks which are either reserved or
not assigned.
Site filtering based on content classification is an entirely different
matter that is best handled at the http proxy level, and is of no relevance
here.
Thank you for any help,
Regards,
George.
-----Original Message-----
From: 	Pavan Gokarn [mailto:pavang@techknowledge.ws]
Sent:	Wednesday, March 05, 2003 7:23 AM
To:	George J. Jahchan, Eng.
Subject:	Re: Unassigned Networks List
what do you want to do george. do u want to block some sites which are
bad(porn) or block a range of specific ip addresses. in the former case I
might me able to help you.
regards


