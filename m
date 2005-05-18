From: Jason Opperisano <opie@817west.com>
Subject: Re: Connection tracking issues!!
Date: Wed, 18 May 2005 11:23:27 -0400
Message-ID: <20050518152327.GA4980@bender.817west.com>
References: <428a4b34.1deda931.20f0.6f9fSMTPIN_ADDED@mx.gmail.com>
	<9927912d0505172322c98d013@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d0505172322c98d013@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 18, 2005 at 10:22:20AM +0400, Visham Ramsurrun wrote:
> Also, I wanted to know if connection tracking still works for a TCP
> connection where the SYN packet passes through stateful firewall FW1,
> the SYN/ACK packet passes through stateful firewall FW2, the ACK
> passes again through FW1 and the first data packet passes through FW2.
> Is the connection considered as ESTABLISHED at that point on both
> firewalls?

absolutely not.

-j

--
"Baliff: Do you swear to tell the truth, the whole truth, and nothing
 but the truth? 
 Peter: I do... ya bastard."
        --Family Guy

