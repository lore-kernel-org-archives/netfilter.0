From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: Re: preserving fwmarks through KLIPS
Date: Tue, 11 Jan 2005 15:45:32 -0500
Message-ID: <1105476332.12167.66.camel@latte.nssg.mitel.com>
References: <1105393017.12167.24.camel@latte.nssg.mitel.com>
	<1105447514.9691.9.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105447514.9691.9.camel@hubcap.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Tue, 2005-01-11 at 07:45 -0500, Jason Opperisano wrote:
> nothing can replace you actually testing this for yourself, but yes--in
> my experience--MARKs stay with a packet through its entire journey
> through the stack, regardless of what sort of processing is done to the
> packet.  a MARK is simply tag associated with a packet, but not part of
> the packet itself.

That being said, I just did some testing, and it would appear that they
are indeed preserved. 

Thanks,
Mike

-- 
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
6000/6010/60* Development, Mitel Corporation
"...the word HACK is used as a verb to indicate a massive amount of
nerd-like effort." -Harley Hahn, A Student's Guide to Unix



