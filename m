From: Roberto Nibali <ratz@tac.ch>
Subject: Re: iptables and linuxVirtualServer
Date: Fri, 04 Oct 2002 11:17:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D9D5CB0.7020307@tac.ch>
References: <71FD63241A2DD511AFED00010236A4B33224BF@LIVAUDAIS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Tim Cronin <tim@13-colonies.com>
Cc: "'Walther@gehag-dsk.de'" <Walther@gehag-dsk.de>, netfilter@lists.netfilter.org

Hi,

Tim Cronin wrote:
> yup, I've checked the packet exchange for a single page request.
> 
> the problem is that since lvs is handling the NAT for http
> iptables doesn't look like it's tracking state.

Yes, you're right and I was wrong redirecting you to the netfilter mailinglist. 
We will solve it on the LVS mailinglist and if there are problems with netfilter 
we will come back, ok?

> if I let iptables handle nat to the web server the line below
> works.

Yes, it is clearly the NF_STOLEN interaction of LVS in the NAT part of the code.

Sorry for the confusion I created,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


