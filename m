From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: use of -m limit for Syn Flood protection
Date: Sat, 14 Oct 2006 18:45:41 +0200
Message-ID: <45311435.20604@eccotours.co.za>
References: <4530E332.4090306@eccotours.co.za>
	<561dc3260610140717i45c75303weaa16bf327bd1f6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc3260610140717i45c75303weaa16bf327bd1f6d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jiann-Ming Su wrote:
> If you're trying to limit the SYNs to 4/sec, then the --limit should
> be "--limit 4/s" along with the --limit-burst 4.  Though, 4 SYNs per
> second is hardly a syn flood.  Also, you may want to specify the
> destination port of the syn flood to give more grainular control.

Hi Jiann

Thank you for your reply.

May I ask what you would consider a more realistic limit /value.

I currently have ports 25, 80 and 443 open. I would like to strive to get a respectable value that would cater for these ports.

Kind Regards
Brent Clark


