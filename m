From: Jason Opperisano <opie@817west.com>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 18:28:01 -0500
Message-ID: <1106090881.4934.1.camel@hubcap.ljm.dom>
References: <d645356050118053928226673@mail.gmail.com>
	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
	<d645356050118125243d12dfb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d645356050118125243d12dfb@mail.gmail.com>
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

On Tue, 2005-01-18 at 15:52, Ulysses Almeida wrote:
>   That's another doubt, dos nat PREROUTING called with syn+ack
> packets, or only with sym packets?

nat PREROUTING sees NEW packets, without regard to TCP flags.

-j
--
"Oh, people can come up with statistics to prove anything, Kent. 14%
 of people know that."
	--The Simpsons


