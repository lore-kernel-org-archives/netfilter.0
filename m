From: Jason Opperisano <opie@817west.com>
Subject: Re: what protocols need UDP instead of just TCP?? DNS, IMAP, SSH,
	etc.?
Date: Wed, 26 Jan 2005 13:47:21 -0500
Message-ID: <20050126184721.GA7134@bender.817west.com>
References: <20050126000550.GB15359@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050126000550.GB15359@spawar.navy.mil>
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

On Tue, Jan 25, 2005 at 04:05:50PM -0800, seberino@spawar.navy.mil wrote:
> I'm only allowing TCP out of my firewall.
> 
> What apps/protocls need UDP?
> 
> DNS, IMAP, SSH, etc.?

DNS--yes.  IMAP and SSH--no.

> I dunno if I need to allow UDP for anything.

other common UDP ports i allow out:

Port	Service
---------------
123	NTP
500	IKE

-j

--
"I never passed Remedial Science 1A.
 And you're a nuclear technician?"
        --The Simpsons

